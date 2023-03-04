//
//  AndamiroViewModel.swift
//  SMUthie
//
//  Created by Phil on 2023/03/01.
//

import Combine

class AndamiroViewModel: ObservableObject {
    @Published var menu: [AndamiroMenu] = [
        AndamiroMenu(image: "carrot.fill", name: "제육볶음", price: "가격 7000원"),
        AndamiroMenu(image: "cup.and.saucer.fill", name: "돈까스", price: "가격 7500원")
    ]
    @Published var currentMenuItemIndex = 0
    
    func showNextMenuItem() {
        currentMenuItemIndex += 1
        if currentMenuItemIndex >= menu.count {
            currentMenuItemIndex = 0
        }
    }
}
