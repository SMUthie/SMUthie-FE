//
//  BoardInformationViewModel.swift
//  SMUthie
//
//  Created by Phil on 11/15/23.
//

import Combine
import Moya
import Foundation

class BoardPageViewModel: ObservableObject {
    private let provider = MoyaProvider<SmuthieAPI>()
    @Published var boardDetailResult: BoardDetailResult?
    
    @Published var posts : [Post] = [Post(name :"나는야 슴우",date: "15:34", place: "부대통령",
                                          content:  "부대통령 혼밥하기 좋음 순두부찌개 진짜 너무 맛있지 않나? 계란 넣어먹는 거 국룰이고 밥도둑이라 매일먹어도 안질림 사장님 친절해서 더 좋아요 다들 부대통령 와라 ㅋㅋ",pictures: ["camera","carrot"],
                                          hashtag: "#순두부찌개", ImageNum: 2, like :13, unlike: 8)]
    let storeId : Int
    init(storeId : Int){
        self.storeId = storeId
        fetchBoardDetail(self.storeId)
    }
    
    func fetchBoardDetail(_ store_Id : Int) {
        provider.request(.getBoardDetail(storeId: store_Id)) { result in
            switch result {
            case let .success(response):
                do {
                    let boardDetailResponse = try JSONDecoder().decode(BoardDetailResponse.self, from : response.data)
                    DispatchQueue.main.async {
                        self.boardDetailResult = boardDetailResponse.result
//                        print(boardDetailResponse.result)
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
