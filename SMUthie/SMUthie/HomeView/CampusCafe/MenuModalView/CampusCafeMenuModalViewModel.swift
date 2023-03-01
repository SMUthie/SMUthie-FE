//
//  CampusCafeMenuModalViewModel.swift
//  SMUthie
//
//  Created by Phil on 2023/03/01.
//

import Combine

class CampusCafeMenuModalViewModel: ObservableObject {
    @Published var cafeMenus: [CampusCafeMenu] = [
        CampusCafeMenu(name: "1번 카페", image: "카페 이미지"),
        CampusCafeMenu(name: "2번 카페", image: "카페 이미지"),
        CampusCafeMenu(name: "3번 카페", image: "카페 이미지")
    ]
}
