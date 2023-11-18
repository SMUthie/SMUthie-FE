//
//  NextPageView.swift
//  SMUthie
//
//  Created by 김유빈 on 2023/09/06.
//

import SwiftUI

struct NextPageView: View {
    @State private var email = ""
    @State private var isEmailEnabled = false
    
    var body: some View {
        VStack {
            Text("이메일을 입력해 주세요,\n\n등록하신 이메일로\n임시 비밀번호를 전송해 드릴게요.")
                .fontWeight(.bold)
                .font(
                Font.custom("NanumSquareRoundOTF", size: 24)
                .weight(.heavy)
                )
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
                    .font(
                    Font.custom("NanumSquareRoundOTF", size: 24)
                    .weight(.heavy)
                    )
                    .frame(width: 365, height: 50)
                    .background(isEmailEnabled ? Color("CustomOrange") : Color("DividerGray"))
                    .cornerRadius(10)
                    .padding(.top, 320)
                
            }
            .disabled(!isEmailEnabled)
        }
        .onReceive([email].publisher.collect()) { values in
            isEmailEnabled = values.allSatisfy { email in
                let regex = #"^\d{9}@sangmyung\.kr$"#
                return NSPredicate(format: "SELF MATCHES %@", regex).evaluate(with: email)
            }
        }
    }
}
