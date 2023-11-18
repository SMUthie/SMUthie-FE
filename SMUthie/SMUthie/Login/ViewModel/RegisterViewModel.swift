//
//  RegisterViewModel.swift
//  SMUthie
//
//  Created by 김유빈 on 2023/11/17.
//

import Foundation
import Combine
import Moya

class RegisterViewModel: ObservableObject {
    @Published var successful: Bool = false
    
    private let provider = MoyaProvider<SmuthieAPI>()
    
    init() {
        
    }

    func fetchRegister(studentId: String, password: String, nickname: String, completionHandler: @escaping (Bool)->Void){
        provider.request(.postRegister(studentId: studentId, password: password, nickname: nickname)) { result in
            switch result {
            case let .success(response):
                do {
                    let registerResponse = try JSONDecoder().decode(CheckResponse.self, from: response.data)

                    if registerResponse.message == "성공!" {
                        self.successful = true
                        completionHandler(self.successful)
                        print("회원가입 \(registerResponse.message)")
                    } else {
                        self.successful = false
                        print("\(registerResponse.message)")
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
