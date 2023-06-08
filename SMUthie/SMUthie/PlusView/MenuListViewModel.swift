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
        Menu(menuName: "치즈 돈까쓰", placeName: "안다미로",like: 5, category: Category(up: false, rice: true, soup: false, meat: true, spicy: false)),
        Menu(menuName: "부리또", placeName: "리또리또",like : 7, category: Category(up: true, rice: false, soup: false, meat: true, spicy: true)),
        Menu(menuName: "제육덮밥", placeName: "안다미로",like : 7, category: Category(up: true, rice: false, soup: false, meat: true, spicy: true)),
        Menu(menuName: "참치김밥", placeName: "윤가네",like : 7, category: Category(up: true, rice: false, soup: false, meat: true, spicy: true)),
        Menu(menuName: "불고기김밥", placeName: "윤가네",like : 7, category: Category(up: true, rice: false, soup: false, meat: true, spicy: true)),
        Menu(menuName: "돼지 불고기", placeName: "안다미로",like : 7, category: Category(up: true, rice: false, soup: false, meat: true, spicy: true)),
        Menu(menuName: "돈까스김밥", placeName: "윤가네",like : 7, category: Category(up: true, rice: false, soup: false, meat: true, spicy: true)),
        Menu(menuName: "안다 가츠동", placeName: "안다미로",like : 7, category: Category(up: true, rice: false, soup: false, meat: true, spicy: true)),
        Menu(menuName: "바베큐 덮밥", placeName: "파이어 인더 보울",like : 7, category: Category(up: true, rice: false, soup: false, meat: true, spicy: true))
    ]
    @Published var filteredMenu: [Menu] = []
    @Published var countOfList: Int = 7
}
