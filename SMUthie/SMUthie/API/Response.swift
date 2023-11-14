//
//  Response.swift
//  SMUthie
//
//  Created by 김유빈 on 2023/11/13.
//

import Foundation

// MARK: - CafeModel
struct CafeModel: Codable {
    let isSuccess: Bool
    let code: Int
    let message: String
    let result: [CafeResult]
}

struct CafeResult: Codable {
    let name, time, address: String
}


// MARK: - AndamiroModel
struct AndamiroModel: Codable {
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
