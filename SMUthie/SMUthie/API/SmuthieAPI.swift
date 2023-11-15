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
    case getWrittenReview
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
        case .getWrittenReview:
            return "/user/writtenReview"
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
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .getCheckNickname, .getLikedReview, .getLikedReport, .getWrittenReview, .getWrittenReport, .getInfo, .getCafeteria, .getAndamiro, .getCafe, .getRecommendation, .getMapStore, .getMapRestaurant, .getMapCafe, .getBoardCategory, .getBoardDetail, .getSearch, .getSearchResult, .getReporterUser:
            return .get
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
        case .getWrittenReview:
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
        }
    }
    
    var headers: [String: String]? {
        switch self {
        case .getCheckNickname:
            return ["Content-type": "application/json"]
        case .getLikedReview:
            return nil
        case .getLikedReport:
            return nil
        case .getWrittenReview:
            return nil
        case .getWrittenReport:
            return nil
        case .getInfo:
            return nil
        case .getCafeteria:
            return nil
        case .getAndamiro:
            return nil
        case .getCafe:
            return nil
        case .getRecommendation:
            return nil
        case .getMapStore:
            return nil
        case .getMapRestaurant:
            return nil
        case .getMapCafe:
            return nil
        case .getBoardCategory:
            return nil
        case .getBoardDetail:
            return ["x-access-token": "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyX2lkeCI6MiwiaWF0IjoxNjk5ODQ5NzcyLCJleHAiOjE3MDA0NTQ1NzJ9.d4iqgj5iMH04rJmGL8ZNUo49GzrbwJnu-zIKLdkrj5I"]
        case .getSearch:
            return nil
        case .getSearchResult:
            return nil
        case .getReporterUser:
            return nil
        }
    }
}
