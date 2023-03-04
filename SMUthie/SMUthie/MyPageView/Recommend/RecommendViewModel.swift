//
//  RecommendViewModel.swift
//  SMUthie
//
//  Created by Phil on 2023/03/02.
//

import Combine

class RecommendViewModel : ObservableObject {
    @Published var placeDB : [Recommend] = [
        Recommend(image: "wineglass", name: "some cafe"),
        Recommend(image: "birthday.cake", name: "학식"),
        Recommend(image: "carrot", name: "안다미로"),
        Recommend(image: "wineglass.fill", name: "some cafe2"),
        Recommend(image: "birthday.cake.fill", name: "학식2"),
        Recommend(image: "carrot.fill", name: "안다미로2")
    ]
}
