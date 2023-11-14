//
//  CafeteriaViewModel.swift
//  SMUthie
//
//  Created by Phil on 2023/02/28.
//

import Combine
import Moya
import Foundation

class CafeteriaViewModel: ObservableObject {
    private let provider = MoyaProvider<SmuthieAPI>()
    
    @Published var cafeteriaMenus: [[CafeteriaResult]] = []
    @Published var currentMenuItemIndex = 0
    
    init(){
        self.fetchCafeteria()
    }
    
    func fetchCafeteria() {
           provider.request(.getAndamiro) { [weak self] result in
               DispatchQueue.main.async {
                   switch result {
                   case let .success(response):
                       do {
                           let cafeteriaResponse = try JSONDecoder().decode(CafeteriaResponse.self, from: response.data)
                           let groupedResults = Dictionary(grouping: cafeteriaResponse.result, by: { $0.date })
                           self?.cafeteriaMenus = Array(groupedResults.values)
                           self?.currentMenuItemIndex = 0
                           print(Array(groupedResults.values))
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
        if currentMenuItemIndex >= cafeteriaMenus.count {
            currentMenuItemIndex = 0
        }
    }
}

