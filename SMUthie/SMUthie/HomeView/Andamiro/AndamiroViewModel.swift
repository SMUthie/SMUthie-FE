//
//  AndamiroViewModel.swift
//  SMUthie
//
//  Created by Phil on 2023/03/01.
//

import Combine
import Foundation
import Moya

class AndamiroViewModel: ObservableObject {
    private let provider = MoyaProvider<SmuthieAPI>()
    @Published var menus: [AndamiroResult] = []
    @Published var currentMenuItemIndex = 0
    
    init(){
        self.fetchAndamiro()
    }
    
    func fetchAndamiro() {
           provider.request(.getAndamiro) { [weak self] result in
               DispatchQueue.main.async {
                   switch result {
                   case let .success(response):
                       do {
                           let andamiroResponse = try JSONDecoder().decode(AndamiroResponse.self, from: response.data)
                           self?.menus = andamiroResponse.result
                           self?.currentMenuItemIndex = 0 // 초기화
//                           print(andamiroResponse.result)
                       } catch {
                           print("Error parsing response: \(error)")
                       }
                       
                   case let .failure(error):
                       print("Network request failed: \(error)")
                   }
               }
           }
       }
    
    
    func showNextMenuItem() {
        currentMenuItemIndex += 1
        if currentMenuItemIndex >= menus.count {
            currentMenuItemIndex = 0
        }
    }
}
