//
//  NetworkManager.swift
//  SMUthie
//
//  Created by 김유빈 on 2023/11/13.
//

import Foundation
import Moya

class NetworkManager: ObservableObject {
    private let provider = MoyaProvider<SmuthieAPI>()
    static let shared = NetworkManager()
    
    func fetchCafe() {
        provider.request(.getCafe) { result in
            switch result {
            case let .success(response):
                do {
                    let cafeResponse = try JSONDecoder().decode(CafeModel.self, from : response.data)
                    print(cafeResponse.result)
                } catch {
                    print("Error parsing response: \(error)")
                }
                
            case let .failure(error):
                print("Network request failed: \(error)")
            }
        }
    }
    
    func fetchAndamiro() {
        provider.request(.getAndamiro) { result in
            switch result {
            case let .success(response):
                do {
                    let andamiroResponse = try JSONDecoder().decode(AndamiroModel.self, from : response.data)
                    print(andamiroResponse.result)
                } catch {
                    print("Error parsing response: \(error)")
                }
                
            case let .failure(error):
                print("Network request failed: \(error)")
            }
        }
    }
}
