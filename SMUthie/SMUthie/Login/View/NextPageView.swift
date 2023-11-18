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
    
    @ObservedObject var tempPWViewModel = TempPWViewModel()
    
    var body: some View {
        VStack {
            Text("이메일을 입력해 주세요,\n\n등록하신 이메일로\n임시 비밀번호를 전송해 드릴게요.")
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
                
                let schoolId = extractStudentId(from: email)
                
                tempPWViewModel.fetchTempPW(schoolId: schoolId) { value in
                    if value {
                        //print("임시 비밀번호가 발급되었습니다.")
                    }
                }
            }) {
                Text("비밀번호 전송")
                    .foregroundColor(isEmailEnabled ? Color.white : Color("CustomGray"))
                    .font(
                    Font.custom("NanumSquareRoundOTF", size: 18)
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

private func extractStudentId(from email: String) -> String {
    guard let atIndex = email.firstIndex(of: "@") else {
        return ""
    }
    
    let studentId = String(email.prefix(upTo: atIndex))
    return studentId
}
