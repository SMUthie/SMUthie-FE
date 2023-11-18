//
//  SendEmailViewModel.swift
//  SMUthie
//
//  Created by 김유빈 on 2023/11/16.
//

import Foundation
import Combine
import Moya

class SendEmailViewModel: ObservableObject {
    @Published var emailResponse: CheckResponse?
    @Published var successful: Bool = false
    @Published var schoolId: Int?
    
    private let provider = MoyaProvider<SmuthieAPI>()
    
    init() {
        //print("SendEmailViewModel init")
    }

    func fetchSendEmail(schoolId: Int) {
        // 이메일을 가져올 때 schoolId를 저장
        self.schoolId = schoolId
        
        provider.request(.getSendEmail(schoolId: schoolId)) { result in
            switch result {
            case let .success(response):
                do {
                    let emailResponse = try JSONDecoder().decode(CheckResponse.self, from: response.data)

                    if emailResponse.message == "성공!" {
                        self.successful = true
                        print("인증 이메일 전송하기: \(emailResponse.message)")
                    } else {
                        self.successful = false
                        print("인증 이메일 전송하기 실패: \(emailResponse.code) - \(emailResponse.message)")
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
