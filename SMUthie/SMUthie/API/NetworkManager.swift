//
//  NetworkManager.swift
//  SMUthie
//
//  Created by 김유빈 on 2023/11/13.
//

import Foundation
import Moya
import KeychainSwift

class NetworkManager: ObservableObject {
    private let provider = MoyaProvider<SmuthieAPI>()
    static let shared = NetworkManager()

    let keychain = KeychainSwift()
    
    func fetchCafe() {
        provider.request(.getCafe) { result in
            switch result {
            case let .success(response):
                do {
                    let cafeResponse = try JSONDecoder().decode(CafeModel.self, from : response.data)
                    print(cafeResponse.result)
                } catch {
                    print("Error parsing response: \(error)")
                }
                
            case let .failure(error):
                print("Network request failed: \(error)")
            }
        }
    }
    
    func fetchAndamiro() {
        provider.request(.getAndamiro) { result in
            switch result {
            case let .success(response):
                do {
                    let andamiroResponse = try JSONDecoder().decode(AndamiroModel.self, from : response.data)
                    print(andamiroResponse.result)
                } catch {
                    print("Error parsing response: \(error)")
                }
                
            case let .failure(error):
                print("Network request failed: \(error)")
            }
        }
    }
    
    func postRegister(studentId: String, password: String, nickname: String) {
        provider.request(.postRegister(studentId: studentId, password: password, nickname: nickname)) { result in
            switch result {
            case let .success(response):
                if response.statusCode == 200 {
                    print("회원가입 성공")
                } else {
                    print("회원가입 실패 code: \(response.statusCode)")
                }
            case let .failure(error):
                print("Error: \(error)")
            }
        }
    }
    
    func postLogin(studentId: String, password: String, completion: @escaping (Result<LoginResult, Error>) -> Void) {
        provider.request(.postLogin(studentId: studentId, password: password)) { result in
            switch result {
            case let .success(response):
                do {
                    let loginResponse = try response.map(LoginResponse.self)
                    if loginResponse.isSuccess, let result = loginResponse.result {
                        // 로그인이 성공했을 때 Keychain에 토큰 저장
                        self.keychain.set(result.access_token, forKey: "accessToken")
                        self.keychain.set(result.refresh_token, forKey: "refreshToken")
                        completion(.success(result))
                    } else {
                        // 로그인 실패 또는 서버 응답이 예상과 다를 경우
                        completion(.failure(NSError(domain: "AuthService", code: loginResponse.code, userInfo: nil)))
                    }
                } catch {
                    completion(.failure(error))
                }

            case let .failure(error):
                completion(.failure(error))
            }
        }
    }
    
    /*
    func postLogin(studentId: String, password: String) {
        provider.request(.postLogin(studentId: studentId, password: password)) { result in
            switch result {
            case let .success(response):
                if response.statusCode == 200 {
                    print("로그인 성공")
                } else {
                    print("로그인 실패 code: \(response.statusCode)")
                }
            case let .failure(error):
                print("Error: \(error)")
            }
        }
    } */
}
