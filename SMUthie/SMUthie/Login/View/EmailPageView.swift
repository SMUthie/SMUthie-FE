//
//  EmailPageView.swift
//  SMUthie
//
//  Created by 김유빈 on 2023/09/06.
//

import SwiftUI

struct EmailPageView: View {
    @State var number = ""
    @ObservedObject private var sendEmailViewModel = SendEmailViewModel()
    @State private var isEmailEnabled = false
    @State private var isSendEmail = false
    
    @Binding var navigationPath: NavigationPath
    
    var body: some View {
        VStack {
            Text("회원가입을 위해\n학교 이메일 인증을 해주세요.")
                .font(
                Font.custom("NanumSquareRoundOTF", size: 24)
                .weight(.heavy)
                )
                .multilineTextAlignment(.center)
                .padding(.bottom, 150)
            
            if !isSendEmail {
                Text("이미 등록된 이메일 입니다.")
                  .font(
                    Font.custom("NanumSquareRoundOTF", size: 14)
                      .weight(.bold)
                  )
                  .multilineTextAlignment(.trailing)
                  .foregroundColor(Color.red)
                  .frame(maxWidth: .infinity, alignment: .trailing)
                  .padding(.trailing, 50)
            }
            
            HStack {
                TextField("학번", text: $number)
                    .padding()
                    .frame(width: 150, height: 30)
                    .overlay(
                        RoundedRectangle(cornerRadius: 5)
                            .stroke(Color("DividerGray"))
                    )
                
                Text("@sangmyung.kr")
            }

            NavigationLink(destination: EmailCheckView(navigationPath: $navigationPath, schoolId: sendEmailViewModel.schoolId ?? 0), isActive: $sendEmailViewModel.successful) {
                Button(action: {
                    if let schoolId = Int(number) {
                        sendEmailViewModel.fetchSendEmail(schoolId: schoolId)
                        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                            if sendEmailViewModel.successful == false {
                                isSendEmail = false
                            } else {
                                isSendEmail = true
                            }
                        }
                    }
                }) {
                    Text("이메일 인증하기")
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
            }
            .disabled(!isEmailEnabled)
            .navigationBarTitle("", displayMode: .inline)
            .onAppear(){
                isSendEmail = true
            }
        }
        .onReceive([number].publisher.collect()) { values in
            isEmailEnabled = values.allSatisfy { number in
                let regex = #"^\d{9}"#
                return NSPredicate(format: "SELF MATCHES %@", regex).evaluate(with: number)
            }
        }
    }
}
