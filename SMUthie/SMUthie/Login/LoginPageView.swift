//
//  LoginPageView.swift
//  SMUthie
//
//  Created by 김유빈 on 2023/09/06.
//

import SwiftUI

struct LoginPageView: View {
    @State private var email = ""
    @State private var password = ""
    @State private var isLoginEnabled = false
    @State private var isEmailEnabled = false
    
    @Binding var isLoggedin: Bool
    @Binding var showLoginPage: Bool
    
    var body: some View {
        VStack {
            Image("Logo")
                .padding(.top, 210)
            
            TextField("이메일", text: $email)
                .padding()
                .frame(width: 339, height: 50)
                .overlay(
                    RoundedRectangle(cornerRadius: 5)
                        .stroke(Color("DividerGray"))
                ).padding(.top, 20)
            
            SecureField("비밀번호", text: $password)
                .padding()
                .frame(width: 339, height: 50)
                .overlay(
                    RoundedRectangle(cornerRadius: 5)
                        .stroke(Color("DividerGray"))
                )
                .padding(.top, 10)
            //MARK: - PASS
            Button(action: {
                isLoggedin = true
                showLoginPage = false
                
            }) {
                Text("로그인 PASS")
                    .foregroundColor(isLoginEnabled && isEmailEnabled ? Color.white : Color("CustomGray"))
                    .font(.headline)
                    .frame(width: 365, height: 50)
                    .background(isLoginEnabled && isEmailEnabled ? Color("CustomOrange") : Color("DividerGray"))
                    .cornerRadius(10)
            }
            
            //MARK: ____
            Button(action: {
                isLoggedin = true
                showLoginPage = false
                
            }) {
                Text("로그인")
                    .foregroundColor(isLoginEnabled && isEmailEnabled ? Color.white : Color("CustomGray"))
                    .font(.headline)
                    .frame(width: 365, height: 50)
                    .background(isLoginEnabled && isEmailEnabled ? Color("CustomOrange") : Color("DividerGray"))
                    .cornerRadius(10)
            }
            .padding(.top, 180)
            .disabled(!isLoginEnabled)
            .disabled(!isEmailEnabled)
            
            NavigationLink(
                destination: NextPageView(),
                label: {
                    Text("비밀번호 찾기")
                        .foregroundColor(Color("CustomGray"))
                        .font(.headline)
                        .underline()
                })
            .padding(.top, 10)
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
