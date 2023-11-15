//
//  CampusCafeViewModel.swift
//  SMUthie
//
//  Created by Phil on 2023/02/28.
//

import Combine
import Moya
import Foundation

class CampusCafeViewModel: ObservableObject {
    private let provider = MoyaProvider<SmuthieAPI>()
    @Published var cafes: [CampusCafeResult] = []
    
    init(){
        fetchCampusCafe()
    }
    
    func fetchCampusCafe() {
        provider.request(.getCafe) { result in
            switch result {
            case let .success(response):
                do {
                    let cafeResponse = try JSONDecoder().decode(CampusCafeResponse.self, from : response.data)
                    self.cafes = cafeResponse.result
//                    print(cafeResponse.result)
                } catch {
                    print("Error parsing response: \(error)")
                }
                
            case let .failure(error):
                print("Network request failed: \(error)")
            }
        }
    }
}
