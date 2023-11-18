//
//  EmailCheckView.swift
//  SMUthie
//
//  Created by 김유빈 on 2023/11/16.
//

import SwiftUI

struct EmailCheckView: View {
    @ObservedObject private var checkAuthStatusViewModel = CheckAuthStatusViewModel()
    @ObservedObject private var sendEmailViewModel = SendEmailViewModel()
    @State private var isButtonPressed = false
    @State private var shouldNavigate = false
    @State private var success = false
    
    @Binding var navigationPath: NavigationPath
    
    let schoolId: Int
    
    var body: some View {
        VStack {
            Image(success ? "smu" : "Check")
                .padding()
                .padding(.top, 150)
            
            Text(success ? "안녕하세요, 슴우님!\n인증이 완료됐어요 :)" : "학교 이메일로 들어가\n인증을 완료해 주세요.")
                .font(
                    Font.custom("NanumSquareRoundOTF", size: 24)
                        .weight(.heavy)
                )
                .multilineTextAlignment(.center)
                .padding(.bottom, 10)
            
            if success == false && isButtonPressed {
                Text("인증이 통과되지 않은 계정입니다.\n학교 이메일 인증을 진행해 주세요.")
                    .foregroundColor(Color.red)
                    .multilineTextAlignment(.center)
            }
            
            Button(action: {
                checkAuthStatusViewModel.fetchCheckAuthStatus(schoolId: schoolId) { value in
                    isButtonPressed = true
                    switch value{
                    case .success(let bool):
                        success = bool
                        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                            shouldNavigate = true
                        }
                        
                    case .failure(let error):
                        switch error{
                        case .email:
                            success = false
                        default:
                            success = false
                        }
                    }
                }
            }) {
                Text("확인했어요")
                    .foregroundColor(Color.white)
                    .font(
                        Font.custom("NanumSquareRoundOTFB", size: 18)
                    )
                    .frame(width: 365, height: 50)
                    .background(Color("CustomOrange"))
                    .cornerRadius(10)
            }
            .navigationBarTitle("", displayMode: .inline)
            .padding(.top, 250)
            
            NavigationLink(destination: SignView(schoolId: schoolId, navigationPath: $navigationPath/*, isLoggedin: .constant(false), showLoginPage: .constant(true)*/), isActive: $shouldNavigate) {
                EmptyView()
            }
        }
    }
}
