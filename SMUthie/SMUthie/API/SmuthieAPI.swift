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
    case getRecommendation
    case getMapStore
    case getMapRestaurant
    case getMapCafe
    case getCategory
    case getDetail
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
        case .getCategory:
            return "/board/category"
        case .getDetail:
            return "/board/detail/{storeIdx}"
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
        case .getCheckNickname, .getLikedReview, .getLikedReport, .getWrittenReview, .getWrittenReport, .getInfo, .getCafeteria, .getAndamiro, .getCafe, .getRecommendation, .getMapStore, .getMapRestaurant, .getMapCafe, .getCategory, .getDetail, .getSearch, .getSearchResult, .getReporterUser:
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
        case .getRecommendation:
            return .requestPlain
        case .getMapStore:
            return .requestPlain
        case .getMapRestaurant:
            return .requestPlain
        case .getMapCafe:
            return .requestPlain
        case .getCategory:
            return .requestPlain
        case .getDetail:
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
        case .getCategory:
            return nil
        case .getDetail:
            return nil
        case .getSearch:
            return nil
        case .getSearchResult:
            return nil
        case .getReporterUser:
            return nil
        }
    }
}
