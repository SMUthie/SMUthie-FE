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

    func fetchCheckAuthStatus(schoolId: Int) {
        provider.request(.getCheckAuthStatus(schoolId: schoolId)) { result in
            switch result {
            case let .success(response):
                do {
                    let emailResponse = try JSONDecoder().decode(CheckResponse.self, from: response.data)

                    if emailResponse.message == "성공!" {
                        self.successful = true
                        print("이메일 인증 상태 확인 결과: \(emailResponse.message)")
                    } else {
                        self.successful = false
                        print("\(emailResponse.code) - \(emailResponse.message)")
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
