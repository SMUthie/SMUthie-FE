//
//  PlusViewModel.swift
//  SMUthie
//
//  Created by Phil on 2023/04/10.
//

import Combine

class MenuListViewModel: ObservableObject {
    @Published var allMenu: [Menu] = [
        Menu(menuName: "김밥", placeName: "윤가네",like: 10,category: Category(up: false, rice: true, soup: false, meat: false, spicy: false)),
        Menu(menuName: "안동찜닭", placeName: "부대통령",like: 5, category: Category(up: false, rice: true, soup: false, meat: true, spicy: false)),
        Menu(menuName: "매운핫도그", placeName: "블루포트",like : 7, category: Category(up: true, rice: false, soup: false, meat: true, spicy: true))
    ]
    @Published var filteredMenu: [Menu] = []
    @Published var countOfList: Int = 1
}
