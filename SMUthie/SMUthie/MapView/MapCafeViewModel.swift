//
//  MapCafeViewModel.swift
//  SMUthie
//
//  Created by 김유빈 on 2023/11/16.
//

import Foundation
import Combine
import Moya

class MapCafeViewModel: ObservableObject {
    @Published var mapCafe: [MapResult] = []
    private let provider = MoyaProvider<SmuthieAPI>()
    
    init() {
        fetchMapCafe()
    }
    
    func fetchMapCafe() {
        provider.request(.getMapCafe) { result in
            switch result {
            case let .success(response):
                do {
                    let CafeResponse = try response.map(MapResponse.self)
                    self.mapCafe = CafeResponse.result
                    print(self.mapCafe)
                } catch {
                    print("Error parsing response: \(error)")
                }
                
            case let .failure(error):
                print("Network request failed: \(error)")
            }
        }
    }
}
