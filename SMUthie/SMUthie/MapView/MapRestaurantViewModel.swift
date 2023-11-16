//
//  MapRestaurantViewModel.swift
//  SMUthie
//
//  Created by 김유빈 on 2023/11/15.
//

import Foundation
import Combine
import Moya

class MapRestaurantViewModel: ObservableObject {
    @Published var mapRestaurant: [MapResult] = []
    private let provider = MoyaProvider<SmuthieAPI>()
    
    init() {
        fetchMapRestaurant()
    }
    
    func fetchMapRestaurant() {
        provider.request(.getMapRestaurant) { result in
            switch result {
            case let .success(response):
                do {
                    let RestaurantResponse = try response.map(MapResponse.self)
                    self.mapRestaurant = RestaurantResponse.result
                    print(self.mapRestaurant)
                } catch {
                    print("Error parsing response: \(error)")
                }
                
            case let .failure(error):
                print("Network request failed: \(error)")
            }
        }
    }
}
