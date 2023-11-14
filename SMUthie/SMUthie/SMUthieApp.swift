//
//  SMUthieApp.swift
//  SMUthie
//
//  Created by 김유빈 on 2023/02/26.
//

import SwiftUI

@main
struct SMUthieApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.font, Font.custom("NanumSquareRoundOTF", size: 16))
                .onAppear{
                    NetworkManager.shared.fetchCafe()
                    NetworkManager.shared.fetchAndamiro()
                    NetworkManager.shared.postRegister(studentId: "201910790", password: "qwer1234", nickname: "nini")
                    NetworkManager.shared.postLogin(studentId: "201910790", password: "qwer1234") { result in
                        switch result {
                        case .success(let loginResult):
                            // 로그인 성공 시의 처리
                            print("Access Token: \(loginResult.access_token)")
                            print("Refresh Token: \(loginResult.refresh_token)")

                        case .failure(let error):
                            // 로그인 실패 또는 오류 처리
                            print("Login Error: \(error.localizedDescription)")
                        }
                    }

                }
        }
    }
}
