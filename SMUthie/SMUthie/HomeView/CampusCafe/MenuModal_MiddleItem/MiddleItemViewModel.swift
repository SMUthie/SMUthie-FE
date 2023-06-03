//
//  MiddleItemViewModel.swift
//  SMUthie
//
//  Created by Phil on 2023/03/09.
//

import Combine

class MiddleItemViewModel : ObservableObject {
    var heartChecked = false
    
    init() {
        setupItems()
    }
    
    @Published var items : [MiddleItem] = []
    
    func setupItems() {
        items = [
            MiddleItem(image: "MapPin", title: "가는길 보기"),
            MiddleItem(image: "ListChecks", title: "리뷰 보기"),
            MiddleItem(image: "Pencil", title: "리뷰 쓰기"),
            MiddleItem(image: "Heart" , title: "저장하기")
        ]
    }
    
    func heartClicked (){
        heartChecked = !heartChecked
        if heartChecked {
            items[3].image = "Heart.fill"
        }
        else {
            items[3].image = "Heart"
        }
        
    }
}
