//
//  BoardListViewModel.swift
//  SMUthie
//
//  Created by Phil on 11/14/23.
//

import Foundation

class PlaceListViewModel : ObservableObject {
    
    @Published var places = [
        Place(store_index: 1, store_name: "학교식당", menu_name: "학식", up : true),
        Place(store_index: 2, store_name: "돈까스", menu_name: "안다미로", up : true),
        Place(store_index: 3, store_name: "부대통령", menu_name: "부대찌개",up : false),
        Place(store_index: 4, store_name: "치즈밥", menu_name: "김치 치즈밥", up : false),
        Place(store_index: 5, store_name: "부대통령", menu_name: "부대찌개", up : false)
    ]
}

struct Place {
    var store_index : Int
    var store_name : String
    var menu_name : String
    var up : Bool
}

