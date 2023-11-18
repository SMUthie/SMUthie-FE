//
//  CheckNicknameViewModel.swift
//  SMUthie
//
//  Created by 김유빈 on 2023/11/17.
//

import Foundation
import Combine
import Moya

class CheckNicknameViewModel: ObservableObject {
    @Published var nicknameResponse: CheckResponse?
    @Published var successful: Bool = false
    
    private let provider = MoyaProvider<SmuthieAPI>()

    init() {
        //print("CheckNicknameViewModel init")
    }

    func fetchCheckNickname(nickname: String, completionHandler: @escaping ((Result<Bool, SmuthieAPIError>) -> Void)) {
        provider.request(.getCheckNickname(nickname: nickname)) { result in
            switch result {
            case let .success(response):
                do {
                    let nicknameResponse = try JSONDecoder().decode(CheckResponse.self, from: response.data)

                    if nicknameResponse.message == "성공!" {
                        self.successful = true
                        completionHandler(.success(true))
                        print("\(nickname) \(nicknameResponse.message)")
                    } else {
                        self.successful = false
                        completionHandler(.failure(.nickname))
                        print("\(nicknameResponse.message)")
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
