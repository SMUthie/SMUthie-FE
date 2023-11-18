//
//  TempPWViewModel.swift
//  SMUthie
//
//  Created by 김유빈 on 2023/11/19.
//

import Foundation
import Combine
import Moya

class TempPWViewModel: ObservableObject {
    @Published var successful: Bool = false
    
    private let provider = MoyaProvider<SmuthieAPI>()
    
    init() {
        //print("TempPWViewModel init")
    }

    func fetchTempPW(schoolId: String, completionHandler: @escaping (Bool)->Void){
        provider.request(.postTempPW(schoolId: schoolId)) { result in
            switch result {
            case let .success(response):
                do {
                    let tempPWResponse = try JSONDecoder().decode(TempPWResponse.self, from: response.data)

                    if tempPWResponse.message == "성공!" {
                        completionHandler(true)
                        print("임시 비밀번호 발급 \(tempPWResponse.message)")
                    } else {
                        print("\(tempPWResponse.message)")
                    }
                } catch {
                    print("유저 아이디 값을 확인해주세요. \(error)")
                }
            case let .failure(error):
                print("네트워크 요청 실패: \(error)")
            }
        }
    }
}
