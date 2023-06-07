//
//  MenuData.swift
//  SMUthie
//
//  Created by Phil on 2023/04/10.
//

import Foundation

struct Menu {
    let menuName : String
    let placeName : String
    let like : Int
    let category : Category
}

struct Category {
    let up : Bool
    let rice : Bool
    let soup : Bool
    let meat : Bool
    let spicy : Bool
}
