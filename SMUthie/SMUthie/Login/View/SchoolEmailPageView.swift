//
//  SchoolEmailPageView.swift
//  SMUthie
//
//  Created by 김유빈 on 2023/09/06.
//

import SwiftUI

struct SchoolEmailPageView: View {
    @Binding var navigationPath: NavigationPath
    
    var body: some View {
        VStack {
            Image("Check")
                .padding()
                .padding(.top, 150)
            
            Text("회원가입을 위해\n학교 이메일 인증이 필요해요.")
                .font(
                Font.custom("NanumSquareRoundOTF", size: 24)
                .weight(.heavy)
                )
                .multilineTextAlignment(.center)
                .padding()
            
            NavigationLink(
                destination: EmailPageView(navigationPath: $navigationPath),
                label: {
                    Text("이메일 인증하러 가기")
                        .foregroundColor(Color.white)
                        .font(
                        Font.custom("NanumSquareRoundOTF", size: 18)
                        .weight(.heavy)
                        )
                        .frame(width: 365, height: 50)
                        .background(Color("CustomOrange"))
                        .cornerRadius(10)
                })
            .navigationBarTitle("", displayMode: .inline)
            .padding(.top, 250)
        }
    }
}
