//
//  SecretKey.swift
//  SMUthie
//
//  Created by 김유빈 on 2023/11/19.
//

import Foundation
import KeychainSwift

enum KeychainType: String{
    case accessToken = "AccessToken"
}

final class KeyChainManager{
    static let shared = KeyChainManager()
    
    private let keychain = KeychainSwift()
    
    private init() {}
    
    //키체인 저장
    //첫번째 파라미터를 통해 어떤 keychain을 저장할 것인지 정하고 두번째 파라미터를 통해 저장할 키체인 값을 전달하면 저장이 완료됩니다.
    func saveKeyChain(saveType: KeychainType, keychainValue: String) {
       keychain.set(keychainValue, forKey: saveType.rawValue)
   }
    
    //키체인 가져오기
    //첫번째 파라미터를 . 으로 접근해서 키체인을 가져올 수 있습니다.
    func getKeyChanin(saveType: KeychainType) -> String? {
        return keychain.get(saveType.rawValue)
    }
    
    //키체인 삭제
    //첫번째 파라미터를 통해 원하는 키체인을 삭제합니다.
    func deleteKeychain(saveType: KeychainType) -> Bool {
        print("키체인 삭제됨")
        return keychain.delete(saveType.rawValue)
    }
}
