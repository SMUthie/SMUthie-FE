//
//  BoardViewModel.swift
//  SMUthie
//
//  Created by Phil on 2023/08/02.
//

import Foundation

class BoardViewModel : ObservableObject {
    
    @Published var places = [
        Place(store_index: 1, store_name: "학교식당", menu_name: "학식", up : true),
        Place(store_index: 2, store_name: "돈까스", menu_name: "안다미로", up : true),
        Place(store_index: 3, store_name: "부대통령", menu_name: "부대찌개",up : false),
        Place(store_index: 4, store_name: "치즈밥", menu_name: "김치 치즈밥", up : false),
        Place(store_index: 5, store_name: "부대통령", menu_name: "부대찌개", up : false)
    ]
    
    @Published var dishes = [
        Dish(name: "부대찌개", price: 5000, likes: 21, isLiked: false),
        Dish(name: "김치찌개", price: 6000, likes: 19, isLiked: false),
        Dish(name: "순부두찌개", price: 7000, likes: 11, isLiked: false),
        Dish(name: "찜닭", price: 5000, likes: 21, isLiked: false)
    ]
    
    @Published var posts : [Post] = [Post(name :"나는야 슴우",date: "15:34", place: "부대통령",
                                          content:  "부대통령 혼밥하기 좋음 순두부찌개 진짜 너무 맛있지 않나? 계란 넣어먹는 거 국룰이고 밥도둑이라 매일먹어도 안질림 사장님 친절해서 더 좋아요 다들 부대통령 와라 ㅋㅋ",pictures: ["camera","carrot"],
                                          hashtag: "#순두부찌개", ImageNum: 2, like :13, unlike: 8),
                                     Post(name :"나는야 슴우", date: "15: 29", place: "부대통령",
                                          content:  "부대통령은 부대찌개가 국룰이지 ㄹㅇ ㅋㅋ",pictures: ["camera","carrot"],
                                          hashtag: "#부대찌개",ImageNum: 1, like: 10, unlike: 4),
                                     Post(name :"나는야 슴우", date: "19: 29", place: "부대통령",
                                          content:  "여러분 치즈 안동찜닭 드셔보세요 ㅋㅋ",pictures: ["camera","carrot"],
                                          hashtag: "#치즈안동찜닭", ImageNum: 0, like: 6, unlike: 0),
                                     Post(name :"나는야 슴우", date: "19: 29", place: "부대통령",
                                          content:  "여러분 치즈 안동찜닭 드셔보세요 ㅋㅋ",pictures: ["camera","carrot"],
                                          hashtag: "#치즈안동찜닭", ImageNum: 0, like: 6, unlike: 0)]

}

struct Dish {
    var name: String
    var price: Int
    var likes: Int
    var isLiked: Bool
}

struct Place {
    var store_index : Int
    var store_name : String
    var menu_name : String
    var up : Bool
}
