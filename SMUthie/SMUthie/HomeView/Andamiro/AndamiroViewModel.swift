//
//  AndamiroViewModel.swift
//  SMUthie
//
//  Created by Phil on 2023/03/01.
//

import Combine

class AndamiroViewModel: ObservableObject {
    @Published var menu: [AndamiroMenu] = [
        AndamiroMenu(image: "Food1", name: "제육볶음", price: "가격 7000원", comment:"자극적인데 맛있어요", like : 13),
        AndamiroMenu(image: "Food2", name: "순대국밥", price: "가격 7500원", comment:"그냥 맛있어요", like : 12),
        AndamiroMenu(image: "Food3", name: "라면", price: "가격 5000원", comment:"보통 라면맛이에요", like : 7),
        AndamiroMenu(image: "Food4", name: "돈까스", price: "가격 6000원", comment:"무난하게 맛있어요", like : 8)

    ]
    @Published var currentMenuItemIndex = 0
    
    func showNextMenuItem() {
        currentMenuItemIndex += 1
        if currentMenuItemIndex >= menu.count {
            currentMenuItemIndex = 0
        }
    }
}
