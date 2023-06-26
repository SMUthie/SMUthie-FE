//
//  PlusViewModel.swift
//  SMUthie
//
//  Created by Phil on 2023/04/10.
//

import Combine

class MenuListViewModel: ObservableObject {
    @Published var allMenu: [Menu] = [
        Menu(menuName: "라면", placeName: "윤가네",like: 10,category: Category(up: true, rice: false, soup: true, meat: false, spicy: true)),
        Menu(menuName: "치즈 돈까쓰", placeName: "안다미로",like: 5, category: Category(up: true, rice: true, soup: false, meat: true, spicy: false)),
        Menu(menuName: "부리또", placeName: "리또리또",like : 7, category: Category(up: true, rice: true, soup: false, meat: true, spicy: false)),
        Menu(menuName: "제육덮밥", placeName: "안다미로",like : 7, category: Category(up: true, rice: true, soup: false, meat: true, spicy: true)),
        Menu(menuName: "패퍼로니피자", placeName: "파파존스",like : 4, category: Category(up: false, rice: false, soup: false, meat: true, spicy: true)),
        Menu(menuName: "불고기김밥", placeName: "윤가네",like : 2, category: Category(up: true, rice: true, soup: false, meat: true, spicy: false)),
        Menu(menuName: "돼지 불고기", placeName: "안다미로",like : 5, category: Category(up: true, rice: true, soup: false, meat: true, spicy: false)),
        Menu(menuName: "카레치즈밥", placeName: "치즈밥있슈",like : 6, category: Category(up: false, rice: true, soup: false, meat: false, spicy: true)),
        Menu(menuName: "닭강정", placeName: "샌드앤닭",like : 6, category: Category(up: false, rice: false, soup: false, meat: true, spicy: true)),
        Menu(menuName: "치즈 샌드위치", placeName: "샌드앤닭",like : 6, category: Category(up: false, rice: false, soup: false, meat: false, spicy: false)),
        Menu(menuName: "바베큐 덮밥", placeName: "파이어 인더 보울",like : 0, category: Category(up: true, rice: true, soup: false, meat: true, spicy: false))
    ]
    @Published var filteredMenu: [Menu] = [] 
    @Published var switchState: [Int] = [-1, -1, -1, -1, -1]
        
    
    func filterMenu() {
        filteredMenu = allMenu.filter { menu in
            for (index, switchValue) in switchState.enumerated() {
                let category = menu.category
                if switchValue != -1 {
                    switch index {
                    case 0:
                        if category.up != (switchValue == 1) {
                            return false
                        }
                    case 1:
                        if category.rice != (switchValue == 1) {
                            return false
                        }
                    case 2:
                        if category.soup != (switchValue == 1) {
                            return false
                        }
                    case 3:
                        if category.meat != (switchValue == 1) {
                            return false
                        }
                    case 4:
                        if category.spicy != (switchValue == 1) {
                            return false
                        }
                    default:
                        break
                    }
                }
            }
            return true
        }
        filteredMenu.sort { $0.like < $1.like }
    }

}
