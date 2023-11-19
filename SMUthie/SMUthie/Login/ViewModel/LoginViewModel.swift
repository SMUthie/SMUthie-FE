//
//  LoginViewModel.swift
//  SMUthie
//
//  Created by 김유빈 on 2023/11/18.
//

import Foundation
import Combine
import Moya
import KeychainSwift

class LoginViewModel: ObservableObject {
    @Published var successful: Bool = false
    @Published var errorMessage: String = ""
    @Published var nickname: String = ""
    
    private let keychainManager = KeyChainManager.shared
    
    private let provider = MoyaProvider<SmuthieAPI>()
    
    init() {
        //print("LoginVIewModel init")
    }
    
    func fetchLogin(studentId: String, password: String, completionHandler: @escaping (Bool)->Void) {
        provider.request(.postLogin(studentId: studentId, password: password)) { [self] result in
            switch result {
            case let .success(response):
                do {
                    let loginResponse = try JSONDecoder().decode(LoginResponse.self, from: response.data)
                    let errorResponse = try JSONDecoder().decode(ErrorResponse.self, from: response.data)
                    
                    if errorResponse.isSuccess == false {
                        // 로그인이 실패한 경우
                        self.successful = false
                        self.errorMessage = errorResponse.message
                        print("로그인 실패: \(errorResponse.message)")
                    } else {
                        // 로그인이 성공한 경우
                        let accessToken = loginResponse.result!.accessToken
                        self.keychainManager.saveKeyChain(saveType: .accessToken, keychainValue: accessToken)
                        self.successful = true
                        let username = loginResponse.result?.nickname
                        self.nickname = username ?? ""
                        completionHandler(self.successful)
                        print("로그인 성공!")
                        //print(self.nickname)
                    }
                } catch {
                    print("Error parsing response: \(error)")
                }
            case let .failure(error):
                print("네트워크 요청 실패: \(error)")
            }
        }
    }
}

class checkLogin {
    let loginViewModel = LoginViewModel()

        // 로그인 상태를 확인하는 함수
        func checkLoginStatus() -> Bool {
            if KeyChainManager.shared.getKeyChanin(saveType: .accessToken) != nil {
                // 사용자가 로그인되어 있고 AccessToken을 가지고 있음
                print("사용자가 로그인되어 있습니다.")
                return true
            } else {
                // 사용자가 로그인되어 있지 않습니다
                print("사용자가 로그인되어 있지 않습니다.")
                return false
            }
        }
}
