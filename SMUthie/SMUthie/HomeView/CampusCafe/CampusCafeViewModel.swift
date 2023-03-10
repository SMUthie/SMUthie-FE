//
//  CampusCafeViewModel.swift
//  SMUthie
//
//  Created by Phil on 2023/02/28.
//

import Combine

class CampusCafeViewModel: ObservableObject {
    @Published var cafes: [CampusCafe] = [
        CampusCafe(name: "[미래백년관 1층 블루포트]", description: "영업시간 8:00 ~ 20:00"),
        CampusCafe(name: "[교수회관 1층 카페드림]", description: "영업시간 7:00 ~ 19:00"),
        CampusCafe(name: "[월해관 2층 안다미로 내]", description: "영업시간 11:00 ~ 14:00")
    ]
}
