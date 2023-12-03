//
//  ReviewDetailViewModel.swift
//  SMUthie
//
//  Created by Phil on 11/17/23.
//

import Combine
import Moya
import Foundation

class ReviewDetailViewModel: ObservableObject {
    private let provider = MoyaProvider<SmuthieAPI>()
    
    @Published var reviewDetailResult : ReviewDetailResult?
    
    
    func fetchReviewDetail(_ review_Id : Int) {
        provider.request(.getReviewDetail(reviewIdx: review_Id)) { result in
            switch result {
            case let .success(response):
                do {
                    let reviewDetailResponse = try JSONDecoder().decode(ReviewDetailResponse.self, from : response.data)
                    DispatchQueue.main.async {
                        self.reviewDetailResult = reviewDetailResponse.result
                        print(reviewDetailResponse.result)
                    }
                } catch {
                    print("Error parsing response: \(error)")
                }
                
            case let .failure(error):
                print("Network request failed: \(error)")
            }
        }
    }
    func fetchReviewLike(_ reviewIdx: Int) {
            provider.request(.putLikeReview(reviewIdx: reviewIdx)) { result in
//                print(result)
                switch result {
                case let .success(response):
                    do {
                        let putLikeResponse = try JSONDecoder().decode(PutLikeResponse.self, from: response.data)
                            DispatchQueue.main.async {
                                self.reviewDetailResult?.isLiked = putLikeResponse.result.nowStatus
                                self.reviewDetailResult?.likes  += putLikeResponse.result.nowStatus ? 1 : -1
                            }
                    } catch {
                        print("Error parsing response: \(error)")
                    }

                case let .failure(error):
                    print("Network request failed: \(error)")
                }
            }
        }
    func fetchReviewDisLike(_ reviewIdx: Int) {
            provider.request(.putDislikeReview(reviewIdx: reviewIdx)) { result in
                switch result {
                case let .success(response):
                    do {
                        let putLikeResponse = try JSONDecoder().decode(PutLikeResponse.self, from: response.data)
                            DispatchQueue.main.async {
                                self.reviewDetailResult?.isDisliked = putLikeResponse.result.nowStatus
                                self.reviewDetailResult?.dislikes  += putLikeResponse.result.nowStatus ? 1 : -1
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
