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
    
    private let keychain = KeychainSwift()
    
    private let provider = MoyaProvider<SmuthieAPI>()
    
    init() {
        
    }
    
    func fetchLogin(studentId: String, password: String, completionHandler: @escaping (Bool)->Void) {
        provider.request(.postLogin(studentId: studentId, password: password)) { result in
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
                        self.keychain.set(accessToken, forKey: "AccessToken")
                        self.successful = true
                        completionHandler(self.successful)
                        print("로그인 성공!")
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
