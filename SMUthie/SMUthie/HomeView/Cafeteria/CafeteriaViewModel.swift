//
//  CafeteriaViewModel.swift
//  SMUthie
//
//  Created by Phil on 2023/02/28.
//

import Combine

class CafeteriaViewModel: ObservableObject {
    @Published var cafeteria: [Cafeteria] = [
        Cafeteria(classification: "자율한식", price: "6000원", menu: "맛있는 자율한식 메뉴"),
        Cafeteria(classification: "푸드코트", price: "4500원", menu: "푸드코트 메뉴")
    ]
}

