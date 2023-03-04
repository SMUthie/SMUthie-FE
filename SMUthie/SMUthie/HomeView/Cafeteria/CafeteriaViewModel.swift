//
//  CafeteriaViewModel.swift
//  SMUthie
//
//  Created by Phil on 2023/02/28.
//

import Combine

class CafeteriaViewModel: ObservableObject {
    @Published var cafeteria: [(Cafeteria,Cafeteria)] = [
        (Cafeteria(date: "3/3 (월)", classification: "자율한식", price: "가격 6000원", menu: " [메인메뉴] 간장돈불고기\n쌀밥 / 잡곡밥\n매콤순두부찌개\n볼어묵마늘쫑볶음\n오이부추무침\n배추김치\n그린샐러드&드래싱"),
        Cafeteria(date: "3/3 (월)", classification: "푸드코트", price: "가격 4500원", menu: "[메인메뉴] 국물떡볶이&꼬치어묵국\n치즈추가원\n모듬튀김추가원\n김가루밥")),
         
        (Cafeteria(date: "3/4 (화)",classification: "자율한식2", price: "가격 6000원", menu: "맛있는 자율한식 메뉴"),
        Cafeteria(date: "3/4 (화)",classification: "푸드코트2", price: "가격 4500원", menu: "푸드코트 메뉴"))
    ]
    @Published var currentMenuItemIndex = 0
    
    func showNextMenuItem() {
        currentMenuItemIndex += 1
        if currentMenuItemIndex >= cafeteria.count {
            currentMenuItemIndex = 0
        }
    }
}

