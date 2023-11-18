//
//  LoginView.swift
//  SMUthie
//
//  Created by 김유빈 on 2023/07/12.
//

import SwiftUI

struct LoginView: View {
    @State private var path: NavigationPath = NavigationPath()
    
    @Binding var isLoggedin: Bool
    @Binding var showLoginPage: Bool
    
    var body: some View {
        NavigationStack(path: $path) {
            VStack {
                Image("Login")
                    .padding()
                
                NavigationLink(value: LoginNavigationStackView.loginPageView) {
                    Text("로그인")
                        .foregroundColor(.white)
                        .font(
                        Font.custom("NanumSquareRoundOTF", size: 18)
                        .weight(.heavy)
                        )
                        .frame(width: 365, height: 50)
                        .background(Color("CustomOrange"))
                        .cornerRadius(10)
                }
                
                NavigationLink(value: LoginNavigationStackView.signUpPageView) {
                    Text("회원가입")
                        .foregroundColor(Color("CustomOrange"))
                        .font(
                        Font.custom("NanumSquareRoundOTF", size: 18)
                        .weight(.heavy)
                        )
                        .frame(width: 365, height: 50)
                        .background(Color.white)
                        .overlay(
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(Color("CustomOrange"), lineWidth: 1))
                }
            }
            .navigationBarHidden(true)
            .navigationBarTitle("", displayMode: .inline)
            .navigationDestination(for: LoginNavigationStackView.self) { nextView in
                switch nextView{
                case .signUpPageView:
                    SignUpPageView(navigationPath: $path)
                case .loginPageView:
                    LoginPageView(isLoggedin: $isLoggedin, showLoginPage: $showLoginPage, navigationPath: $path)
                case .nextPageView:
                    NextPageView()
                default:
                        self
                }
            }
        }
        .accentColor(.black)
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView(isLoggedin: .constant(false), showLoginPage: .constant(true))
    }
}
