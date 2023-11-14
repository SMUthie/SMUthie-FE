//
//  PlusViewModel.swift
//  SMUthie
//
//  Created by Phil on 2023/04/10.
//

import Combine
import Foundation
import Moya

class RecommendationViewModel: ObservableObject {
    private let provider = MoyaProvider<SmuthieAPI>()
    
    @Published var allMenu: [RecommendationResult] = []
    @Published var switchState: [Int] = [-1, -1, -1, -1, -1]
        
    
    init(){
        fetchRecommendation()
    }
    func fetchRecommendation() {
        provider.request(.getRecommendation(isUp: switchState[0],isRice: switchState[1],isSoup: switchState[2],isMeat: switchState[3],isSpicy:switchState[4])) { result in
            switch result {
            case .success(let response):
                do {
                    let recommendationResponse = try JSONDecoder().decode(RecommendationResponse.self, from: response.data)
                    self.allMenu = recommendationResponse.result
                    print (recommendationResponse.result)
                } catch let err {
                    print(err)
                }
            case .failure(let moyaError):
                print("There's an error, \(moyaError)")
            }
        }
    }

}
