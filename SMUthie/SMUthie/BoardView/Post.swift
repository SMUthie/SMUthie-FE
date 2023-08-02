//
//  Post.swift
//  SMUthie
//
//  Created by Phil on 2023/08/02.
//

import Foundation

struct Post : Identifiable{
    let id = UUID()
    let date : String // 임시
    let place : String
    let content : String
    let hashtag : String
    let ImageNum : Int
    let like : Int
    let unlike : Int
}
