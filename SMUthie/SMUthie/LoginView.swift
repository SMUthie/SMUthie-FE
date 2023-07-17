//
//  LoginView.swift
//  SMUthie
//
//  Created by 김유빈 on 2023/07/12.
//

import SwiftUI

struct LoginView: View {
    
    var body: some View {
        NavigationView {
            VStack {
                Image("Login")
                    .padding()
                
                NavigationLink(
                    destination: LoginPageView(),
                    label: {
                        Text("로그인")
                            .foregroundColor(.white)
                            .font(.headline)
                            .frame(width: 365, height: 50)
                            .background(Color("CustomOrange"))
                            .cornerRadius(10)
                    })
                
                NavigationLink(
                    destination: SignUpPageView(),
                    label: {
                        Text("회원가입")
                            .foregroundColor(Color("CustomOrange"))
                            .font(.headline)
                            .frame(width: 365, height: 50)
                            .background(Color.white)
                            .overlay(
                                RoundedRectangle(cornerRadius: 10)
                                    .stroke(Color("CustomOrange"), lineWidth: 1))
                    })
            }
            .navigationBarHidden(true)
            .navigationBarTitle("", displayMode: .inline)
        }
        .accentColor(.black)
    }
}

struct LoginPageView: View {
    @State private var email = ""
    @State private var password = ""
    @State private var isLoginEnabled = false
    @State private var isEmailEnabled = false
    @State public var isLoggedin = false
    
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
                
            
            Button(action: {
                isLoggedin = true
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

struct SignUpPageView: View {
    var body: some View {
        VStack {
            Text("반가워요! 가입하려면\n\n약관에 동의해주세요 :)")
                .fontWeight(.bold)
                .font(.system(size: 24))
                .padding()        }
    }
}

struct NextPageView: View {
    @State private var email = ""
    @State private var isEmailEnabled = false

    var body: some View {
        VStack {
            Text("이메일을 입력해 주세요,\n\n등록하신 이메일로\n임시 비밀번호를 전송해 드릴게요.")
                .fontWeight(.bold)
                .font(.system(size: 24))
                .padding()
               
            TextField("이메일", text: $email)
                .padding()
                .frame(width: 339, height: 50)
                .overlay(
                    RoundedRectangle(cornerRadius: 5)
                        .stroke(Color("DividerGray"))
                )
                .padding(.top, 10)

            Button(action: {
                
            }) {
                Text("비밀번호 전송")
                    .foregroundColor(isEmailEnabled ? Color.white : Color("CustomGray"))
                    .font(.headline)
                    .frame(width: 365, height: 50)
                    .background(isEmailEnabled ? Color("CustomOrange") : Color("DividerGray"))
                    .cornerRadius(10)
                    .padding(.top, 320)
            }
            .disabled(!isEmailEnabled)
        }
        .onReceive([email].publisher.collect()) { values in
            isEmailEnabled = values.allSatisfy { email in
                let regex = #"^\d{9}@sangmyung\.kr$"# // 숫자 9개 + @sangmyung.kr 패턴
                return NSPredicate(format: "SELF MATCHES %@", regex).evaluate(with: email)
            }
        }
    }
}


struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
