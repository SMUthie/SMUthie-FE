//
//  BoardListViewModel.swift
//  SMUthie
//
//  Created by Phil on 11/14/23.
//

import Foundation
import Foundation
import Moya

class BoardViewModel : ObservableObject {
    private let provider = MoyaProvider<SmuthieAPI>()
    @Published var boardCategorys : [BoardCategoryResult] = []
    
    init(){
        fetchBoardCategory()
    }
    func fetchBoardCategory() {
        provider.request(.getBoardCategory) { result in
            switch result {
            case let .success(response):
                do {
                    let boardCategoryResponse = try JSONDecoder().decode(BoardCategoryResponse.self, from : response.data)
                    DispatchQueue.main.async {
                        self.boardCategorys = boardCategoryResponse.result
//                        print(boardCategoryResponse.result)
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

