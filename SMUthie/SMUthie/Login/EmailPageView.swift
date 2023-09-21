//
//  EmailPageView.swift
//  SMUthie
//
//  Created by 김유빈 on 2023/09/06.
//

import SwiftUI

struct EmailPageView: View {
    @State private var number = ""
    @State private var isEmailEnabled = false
    
    var body: some View {
        VStack {
            Text("회원가입을 위해\n학교 이메일 인증을 해주세요.")
                .fontWeight(.bold)
                .font(.system(size: 24))
                .multilineTextAlignment(.center)
                .padding()
            
            HStack {
                TextField("학번", text: $number)
                    .padding()
                    .frame(width: 150, height: 30)
                    .overlay(
                        RoundedRectangle(cornerRadius: 5)
                            .stroke(Color("DividerGray"))
                    )
                
                Text("@ sangmyung.kr")
            }.padding(.top, 150)
            
            Button(action: {
                
            }) {
                Text("이메일 인증하기")
                    .foregroundColor(isEmailEnabled ? Color.white : Color("CustomGray"))
                    .font(.headline)
                    .frame(width: 365, height: 50)
                    .background(isEmailEnabled ? Color("CustomOrange") : Color("DividerGray"))
                    .cornerRadius(10)
                    .padding(.top, 320)
                
            }
            .disabled(!isEmailEnabled)
        }
        .onReceive([number].publisher.collect()) { values in
            isEmailEnabled = values.allSatisfy { number in
                let regex = #"^\d{9}"#
                return NSPredicate(format: "SELF MATCHES %@", regex).evaluate(with: number)
            }
        }
    }
}
