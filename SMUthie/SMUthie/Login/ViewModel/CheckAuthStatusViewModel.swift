//
//  CheckAuthStatusViewModel.swift
//  SMUthie
//
//  Created by 김유빈 on 2023/11/16.
//

import Foundation
import Combine
import Moya

class CheckAuthStatusViewModel: ObservableObject {
    @Published var emailResponse: CheckResponse?
    @Published var successful: Bool = false
    
    private let provider = MoyaProvider<SmuthieAPI>()
    
    init() {
        
    }

    func fetchCheckAuthStatus(schoolId: Int, completionHandler: @escaping (Result<Bool, SmuthieAPIError>)->Void) {
        provider.request(.getCheckAuthStatus(schoolId: schoolId)) { result in
            switch result {
            case let .success(response):
                do {
                    let emailResponse = try JSONDecoder().decode(CheckResponse.self, from: response.data)

                    if emailResponse.message == "성공!" {
                        self.successful = true
                        completionHandler(.success(self.successful))
                        print("이메일 인증 상태 확인 결과: \(emailResponse.message)")
                    } else {
                        self.successful = false
                        completionHandler(.failure(.email))
                        print("\(emailResponse.code) - \(emailResponse.message)")
                    }
                } catch {
                    print("Error parsing response: \(error)")
                }
            case let .failure(error):
                completionHandler(.failure(.parsingError))
                print("네트워크 요청 실패: \(error)")
            }
        }
    }
}
