//
//  SmuthieAPI.swift
//  SMUthie
//
//  Created by 김유빈 on 2023/11/13.
//

import Foundation
import Moya


enum SmuthieAPI {
    case getCheckNickname(nickname: String)
    case getLikedReview
    case getLikedReport
    case getReviews(storeIdx : Int)
    case getReviewDetail(reviewIdx : Int)
    case getWrittenReport
    case getInfo
    case getCafeteria
    case getAndamiro
    case getCafe
    case getRecommendation(isUp : Int, isRice: Int, isSoup: Int, isMeat: Int, isSpicy:Int)
    case getMapStore
    case getMapRestaurant
    case getMapCafe
    case getBoardCategory
    case getBoardDetail(storeId : Int)
    case getSearch
    case getSearchResult
    case getReporterUser
    
    case postConvertUrl(imageDataArray: [Data])
    case postReview(storeIdx : Int, content: String, imageUrlList: [String], menuTag: String)
}

extension SmuthieAPI: TargetType {
    var baseURL: URL {
        return URL(string: "http://43.200.110.213:3000/app")!
    }
    
    var path: String {
        switch self {
        case .getCheckNickname:
            return "/user/checkNickname"
        case .getLikedReview:
            return "/user/likedReview"
        case .getLikedReport:
            return "/user/likedReport"
        case .getReviews(let storeIdx):
            return "/board/review/\(storeIdx)"
        case .getReviewDetail(let reviewIdx):
            return "/board/review/detail/\(reviewIdx)"
        case .getWrittenReport:
            return "/user/writtenReport"
        case .getInfo:
            return "/user/info"
        case .getCafeteria:
            return "/home/cafeteria"
        case .getAndamiro:
            return "/home/andamiro"
        case .getCafe:
            return "/home/cafe"
        case .getRecommendation:
            return "/recommendation"
        case .getMapStore:
            return "/map/store"
        case .getMapRestaurant:
            return "/map/restaurant"
        case .getMapCafe:
            return "/map/cafe"
        case .getBoardCategory:
            return "/board/category"
        case .getBoardDetail(let storeId):
                return "/board/detail/\(storeId)"
        case .getSearch:
            return "/board/search"
        case .getSearchResult:
            return "/board/search/result"
        case .getReporterUser:
            return "/board/reporter/{userIdx}"
        
        case .postConvertUrl:
            return "/upload"
        case .postReview(let storeIdx,_,_,_):
            return "/board/review/\(storeIdx)"
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .getCheckNickname, .getLikedReview, .getLikedReport, .getReviews,.getReviewDetail,.getWrittenReport, .getInfo, .getCafeteria, .getAndamiro, .getCafe, .getRecommendation, .getMapStore, .getMapRestaurant, .getMapCafe, .getBoardCategory, .getBoardDetail, .getSearch, .getSearchResult, .getReporterUser:
            return .get
        case .postReview, .postConvertUrl:
            return .post
        }
    }
    
    var task: Moya.Task {
        switch self {
        case .getCheckNickname(let nickname):
            return .requestParameters(parameters: ["nickname": nickname], encoding: URLEncoding.queryString)
        case .getLikedReview:
            return .requestPlain
        case .getLikedReport:
            return .requestPlain
        case .getReviews:
            return .requestPlain
        case .getReviewDetail:
            return .requestPlain
        case .getWrittenReport:
            return .requestPlain
        case .getInfo:
            return .requestPlain
        case .getCafeteria:
            return .requestPlain
        case .getAndamiro:
            return .requestPlain
        case .getCafe:
            return .requestPlain
        case .getRecommendation(let isUp,let isRice,let isSoup,let isMeat,let isSpicy):
            return .requestParameters(parameters:["isUp": isUp,"isRice": isRice,"isSoup": isSoup,"isMeat": isMeat,"isSpicy":isSpicy], encoding: URLEncoding.default)
        case .getMapStore:
            return .requestPlain
        case .getMapRestaurant:
            return .requestPlain
        case .getMapCafe:
            return .requestPlain
        case .getBoardCategory:
            return .requestPlain
        case .getBoardDetail:
            return .requestPlain
        case .getSearch:
            return .requestPlain
        case .getSearchResult:
            return .requestPlain
        case .getReporterUser:
            return .requestPlain
        
        case .postConvertUrl(let imageDataArray):
            return .uploadMultipart(imageDataArray.enumerated().map { (index, data) in
                return MultipartFormData(provider: .data(data), name: "image", fileName: "image\(index).png", mimeType: "image/png")
            })

        case .postReview(_, let content, let imageUrlList, let menuTag):
                    let parameters: [String: Any] = [
                        "content": content,
                        "imageUrlList": imageUrlList,
                        "menuTag": menuTag
                    ]
                    return .requestParameters(parameters: parameters, encoding: JSONEncoding.default)
        }
    }
    
    var headers: [String: String]? {
            return ["Content-type": "application/json",
                    "x-access-token": "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyX2lkeCI6NSwiaWF0IjoxNzAwMTkyMDc1LCJleHAiOjE3MDA3OTY4NzV9.TItTVW2IFrKN1VVweGhIAfge3GVgyzX5NVAnSJWWOxA"]

    }
}
