//
//  BoardInformationViewModel.swift
//  SMUthie
//
//  Created by Phil on 11/15/23.
//

import Combine
import Moya
import Foundation
import UIKit

class BoardPageViewModel: ObservableObject {
    private let provider = MoyaProvider<SmuthieAPI>()
    @Published var boardDetailInfo: BoardDetailResult?{
        didSet {
                    id = UUID() // Trigger view update
                }
    }
    @Published var id: UUID = UUID()
    @Published var reviewResult : [ReviewResult] = []
    @Published var hashtag: String = "제육볶음"
    
    func postReview(_ store_Id: Int, content: String, images: [UIImage], menuTag: String) {
        // Step 1: 이미지를 서버에 업로드하고 URL 받기
        uploadImagesAndGetUrls(images) { imageUrlList in
            // Step 2: 이미지 URL과 함께 리뷰 포스트
            self.finalPostReview(store_Id, content: content, imageUrlList: imageUrlList, menuTag: menuTag)
        }
    }
    func uploadImagesAndGetUrls(_ images: [UIImage], completion: @escaping ([String]) -> Void) {
        let imageDataArray = images.compactMap { $0.jpegData(compressionQuality: 0.5) }
        print(imageDataArray)
        // .postConvertUrl 요청을 여기서 구현
        provider.request(.postConvertUrl(imageDataArray: imageDataArray)) { result in
            switch result {
                    case .success(let response):
                        do {
                            // 서버 응답을 디코드하여 URL 목록을 얻음
                            let responseData = try JSONDecoder().decode(ImageUploadResponse.self, from: response.data)
                            // URL 목록을 반환
                            completion(responseData.imageUrlsArray)
                            print("업로드 url get 성공 : \(responseData.imageUrlsArray)")
                        } catch {
                            print("Data to Url Error parsing response: \(error)")
                            completion([])
                        }
                    case .failure(let error):
                        print("Error during image upload: \(error)")
                        completion([])
                    }
                }
    }
    func finalPostReview(_ store_Id : Int, content : String ,imageUrlList : [String], menuTag: String) {

        provider.request(.postReview(storeIdx: store_Id, content: content, imageUrlList: imageUrlList , menuTag: menuTag)) { result in
            switch result {
            case .success(let response):
                do {
                    let responseData = try JSONDecoder().decode(PostResponse.self, from: response.data)
                    print(responseData)
                } catch {
                    print("Error parsing response: \(error)")
                }
            case .failure(let error):
                print("Error: \(error)")
            }
        }
    }
    
    func fetchBoardDetail(_ store_Id : Int) {
        provider.request(.getBoardDetail(storeId: store_Id)) { result in
            switch result {
            case let .success(response):
                do {
                    let boardDetailResponse = try JSONDecoder().decode(BoardDetailResponse.self, from : response.data)
                    DispatchQueue.main.async {
                        self.boardDetailInfo = boardDetailResponse.result
                        print(boardDetailResponse.result ?? "boardDetailInfo 없음")
                    }
                } catch {
                    print("Error parsing response: \(error)")
                }
                
            case let .failure(error):
                print("Network request failed: \(error)")
            }
        }
    }
    func fetchReviews(_ store_Id: Int) {
        provider.request(.getReviews(storeIdx: store_Id)) { result in
            switch result {
            case let .success(response):
                do {
                    let reviewResponse = try JSONDecoder().decode(ReviewResponse.self, from: response.data)
                    DispatchQueue.main.async {
                        // likes 기준으로 내림차순 정렬
                        self.reviewResult = reviewResponse.result.sorted { $0.likes > $1.likes }
                    }
                } catch {
                    print("Error parsing response: \(error)")
                }
                
            case let .failure(error):
                print("Network request failed: \(error)")
            }
        }
    }

    
    
    func fetchMenuLike(_ menuId: Int) {
            provider.request(.putLikeMenu(menuId: menuId)) { result in
                switch result {
                case let .success(response):
                    do {
                        let putLikeResponse = try JSONDecoder().decode(PutLikeResponse.self, from: response.data)
                        if let index = self.boardDetailInfo?.menus.firstIndex(where: { $0.menuIndex == menuId }) {
                            DispatchQueue.main.async {
                                self.boardDetailInfo?.menus[index].isLiked = putLikeResponse.result.nowStatus
                                self.boardDetailInfo?.menus[index].menuLikes += putLikeResponse.result.nowStatus ? 1 : -1
                            }
                        }
                    } catch {
                        print("Error parsing response: \(error)")
                    }

                case let .failure(error):
                    print("Network request failed: \(error)")
                }
            }
        }
}
