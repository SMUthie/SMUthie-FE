//
//  Response.swift
//  SMUthie
//
//  Created by 김유빈 on 2023/11/13.
//

import Foundation

//MARK: - ForPost
struct PostResponse: Codable {
    var isSuccess: Bool
    var code: Int
    var message: String
}
struct ImageUploadResponse : Codable {
    var imageUrls : String
    var imageUrlsArray: [String] {
            return imageUrls.split(separator: ",").map { String($0) }
        }
}
//put
struct PutLikeResponse: Codable {
    var isSuccess: Bool
    var code: Int
    var message: String
    var result: PutLikeResult
}
struct PutLikeResult: Codable {
    var nowStatus : Bool
}

//MARK: - CafeteriaModel
struct CafeteriaResponse: Codable {
    var isSuccess: Bool
    var code: Int
    var message: String
    var result: [CafeteriaResult]
}

struct CafeteriaResult: Codable,Hashable {
    var _id : String
    var date: String
    var weekday: Int
    var mealTimeType: String
    var mealName: String
    var mealDescription: String
    var price: String
}

// MARK: - AndamiroModel
struct AndamiroResponse: Codable {
    let isSuccess: Bool
    let code: Int
    let message: String
    let result: [AndamiroResult]
}

struct AndamiroResult: Codable {
    let menuName: String
        let price, likes: Int
        let comment: String?
        let imageURL: String

        enum CodingKeys: String, CodingKey {
            case menuName = "menu_name"
            case price, likes, comment
            case imageURL = "image_url"
        }
}
// MARK: - CafeModel
struct CampusCafeResponse: Codable {
    let isSuccess: Bool
    let code: Int
    let message: String
    let result: [CampusCafeResult]
}

struct CampusCafeResult: Codable {
    let name, time, address: String
}

//MARK: - RecommendationModel
struct RecommendationResponse: Codable {
    var isSuccess: Bool
    var code: Int
    var message: String
    var result: [RecommendationResult]
}

struct RecommendationResult: Codable {
    var name: String
    var menuName: String
    var likes: Int

    enum CodingKeys: String, CodingKey {
        case name
        case menuName = "menu_name"
        case likes
    }
}
//MARK: - BoardCategoryModel
struct BoardCategoryResponse: Codable {
    var isSuccess: Bool
    var code: Int
    var message: String
    var result: [BoardCategoryResult]
}

struct BoardCategoryResult: Codable{
    var store_index: Int
    var store_name: String
    var address: String
    var menu_index: Int
    var menu_name: String
    var up: Bool
    var isCafe: Bool
}

//MARK: - BoardDetailModel
struct BoardDetailResponse: Codable {
    var isSuccess: Bool
    var code: Int
    var message: String
    var result: BoardDetailResult?
}
struct BoardDetailResult: Codable {
    var storeName: String
    var storeIdx: Int
    var storeTime: String
    var storeTel: String
    var menus: [BoardDetailResultMenu]
    var images : [String]

    enum CodingKeys: String, CodingKey {
        case storeName = "store_name"
        case storeIdx = "store_idx"
        case storeTime = "store_time"
        case storeTel = "store_tel"
        case menus,images
    }
}
struct BoardDetailResultMenu: Codable {
    var menuIndex: Int
    var menuName: String
    var menuPrice: Int
    var menuLikes: Int
    var isLiked: Bool

    enum CodingKeys: String, CodingKey {
        case menuIndex = "menu_index"
        case menuName = "menu_name"
        case menuPrice = "menu_price"
        case menuLikes = "menu_likes"
        case isLiked = "is_liked"
    }
}
//MARK: - ReviewModel
struct ReviewResponse: Codable {
    var isSuccess: Bool
    var code: Int
    var message: String
    var result: [ReviewResult]
}
struct ReviewResult: Codable {
    var reviewIdx: Int
    var storeIdx: Int
    var content: String
    var likes: Int
    var unlikes: Int
    var menuIdx: Int
    var menuName: String
    var createdAt: String

    enum CodingKeys: String, CodingKey {
        case reviewIdx = "review_idx"
        case storeIdx = "store_idx"
        case content
        case likes
        case unlikes
        case menuIdx = "menu_idx"
        case menuName = "menu_name"
        case createdAt = "created_at"
    }
}

//MARK: - ReviewDetailModel
struct ReviewDetailResponse: Codable {
    let isSuccess: Bool
    let code: Int
    let message: String
    let result: ReviewDetailResult
}

struct ReviewDetailResult: Codable {
    let reviewIndex: Int
    let userIndex: Int
    let nickname: String
    let menuIndex: Int
    let menuName: String
    let storeIndex: Int
    let storeName: String
    let content: String
    let likes: Int
    let dislikes: Int
    let imageUrl: [String]
    let createdAt: String
    let isLiked: Bool
    let isDisliked: Bool

    enum CodingKeys: String, CodingKey {
        case reviewIndex = "review_idx"
        case userIndex = "user_idx"
        case nickname
        case menuIndex = "menu_idx"
        case menuName = "menu_name"
        case storeIndex = "store_idx"
        case storeName = "name"
        case content, likes
        case dislikes = "unlikes"
        case imageUrl = "image_url"
        case createdAt = "created_at"
        case isLiked = "isLiked"
        case isDisliked = "isUnliked"
    }
}



