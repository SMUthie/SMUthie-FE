//
//  LoginPageView.swift
//  SMUthie
//
//  Created by 김유빈 on 2023/09/06.
//

import SwiftUI
import KeychainSwift
struct LoginPageView: View {
    @State private var email = ""
    @State private var password = ""
    @State private var isLoginEnabled = false
    @State private var isEmailEnabled = false
    
    @State private var isPasswordEnabled = false
    
    @Binding var isLoggedin: Bool
    @Binding var showLoginPage: Bool
    @Binding var navigationPath: NavigationPath
    @Binding var studentID: Int
    @Binding var username: String
    
    @ObservedObject private var loginViewModel = LoginViewModel()
    
    var body: some View {
        VStack {
            Image("Logo")
                .padding(.top, 210)
            
            if !loginViewModel.successful {
                if loginViewModel.errorMessage == "비밀번호가 잘못 되었습니다." {
                    Text("비밀번호가 일치하지 않습니다.")
                        .font(
                            Font.custom("NanumSquareRoundOTF", size: 14)
                                .weight(.bold)
                        )
                        .multilineTextAlignment(.trailing)
                        .foregroundColor(.red)
                        .padding(.trailing, 20)
                        .padding(.top, 10)
                        .frame(maxWidth: .infinity, alignment: .trailing)
                } else if loginViewModel.errorMessage == "학번이 잘못 되었습니다." {
                    Text("등록되지 않은 이메일 입니다.")
                        .font(
                            Font.custom("NanumSquareRoundOTF", size: 14)
                                .weight(.bold)
                        )
                        .multilineTextAlignment(.trailing)
                        .foregroundColor(.red)
                        .padding(.trailing, 20)
                        .padding(.top, 10)
                        .frame(maxWidth: .infinity, alignment: .trailing)
                }
            }
            
            TextField("이메일", text: $email)
                .padding()
                .frame(width: 339, height: 50)
                .overlay(
                    RoundedRectangle(cornerRadius: 5)
                        .stroke(Color("DividerGray"))
                ).padding(.top, 10)
            
            SecureField("비밀번호", text: $password)
                .padding()
                .frame(width: 339, height: 50)
                .overlay(
                    RoundedRectangle(cornerRadius: 5)
                        .stroke(Color("DividerGray"))
                )
                .padding(.top, 10)
//MARK: - Login Pass
            Button(action: {
                        isLoggedin = true
                        showLoginPage = false
                    KeyChainManager.shared.saveKeyChain(saveType: .accessToken, keychainValue: "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyX2lkeCI6NjIsImlhdCI6MTcwMTYwNjExMiwiZXhwIjoxNzAyMjEwOTEyfQ.hsDQxsgFSBgDWi2XuJ-xmSepqjlGHhis53R4oOAcwLI")
            }) {
                Text("로그인 PASS")
                    .foregroundColor(isLoginEnabled && isEmailEnabled ? Color.white : Color("CustomGray"))
                    .font(
                        Font.custom("NanumSquareRoundOTF", size: 18)
                            .weight(.heavy)
                    )
                    .frame(width: 365, height: 50)
                    .background(isLoginEnabled && isEmailEnabled ? Color("CustomOrange") : Color("DividerGray"))
                    .cornerRadius(10)
            }
            .padding(.top, 180)


            Button(action: {
                let studentId = extractStudentId(from: email)
                
                loginViewModel.fetchLogin(studentId: String(studentId), password: password) { value in
                    if value { // 로그인이 성공하면 메인 화면으로 이동
                        isLoggedin = true
                        showLoginPage = false
                        studentID = Int(studentId)!
                        self.username = loginViewModel.nickname
                    }
                }
            }) {
                Text("로그인")
                    .foregroundColor(isLoginEnabled && isEmailEnabled ? Color.white : Color("CustomGray"))
                    .font(
                        Font.custom("NanumSquareRoundOTF", size: 18)
                            .weight(.heavy)
                    )
                    .frame(width: 365, height: 50)
                    .background(isLoginEnabled && isEmailEnabled ? Color("CustomOrange") : Color("DividerGray"))
                    .cornerRadius(10)
            }
            .padding(.top, 180)
            .disabled(!isLoginEnabled)
            .disabled(!isEmailEnabled)

            NavigationLink(value: LoginNavigationStackView.nextPageView) {
                Text("비밀번호 찾기")
                    .foregroundColor(Color("CustomGray"))
                    .font(
                        Font.custom("NanumSquareRoundOTF", size: 16)
                            .weight(.bold)
                    )
                    .underline()
            }
            .padding(.bottom, 30)
            .navigationBarTitle("", displayMode: .inline)
        }
        .onReceive([email, password].publisher.collect()) { values in
            isLoginEnabled = values.allSatisfy { !$0.isEmpty }
        }
        .onReceive([email].publisher.collect()) { values in
            isEmailEnabled = values.allSatisfy { email in
                let regex = #"^\d{9}@sangmyung\.kr$"# // 숫자 9개 + @sangmyung.kr 패턴
                return NSPredicate(format: "SELF MATCHES %@", regex).evaluate(with: email)
            }
        }
    }
}

private func extractStudentId(from email: String) -> String {
    guard let atIndex = email.firstIndex(of: "@") else {
        return ""
    }
    
    let studentId = String(email.prefix(upTo: atIndex))
    return studentId
}
