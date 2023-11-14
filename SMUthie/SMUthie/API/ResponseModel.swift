//
//  Response.swift
//  SMUthie
//
//  Created by 김유빈 on 2023/11/13.
//

import Foundation


//MARK: - CafeteriaModel
struct CafeteriaResponse: Codable {
    var isSuccess: Bool
    var code: Int
    var message: String
    var result: [CafeteriaResult]
}

struct CafeteriaResult: Codable,Hashable {
    var id: String
    var date: String
    var weekday: Int
    var mealTimeType: String
    var mealName: String
    var mealDescription: String

    enum CodingKeys: String, CodingKey {
        case id = "_id"
        case date, weekday, mealTimeType, mealName, mealDescription
    }
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
//MARK: - BoardCategoryResult
struct BoardCategoryResponse: Codable {
    var isSuccess: Bool
    var code: Int
    var message: String
    var result: [BoardCategoryResult]
}

struct BoardCategoryResult: Codable,Hashable {
    var store_index: Int
    var store_name: String
    var address: String
    var menu_index: Int
    var menu_name: String
    var up: Bool
}



