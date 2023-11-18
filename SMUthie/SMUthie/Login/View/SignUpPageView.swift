//
//  SignUpPageView.swift
//  SMUthie
//
//  Created by 김유빈 on 2023/09/06.
//

import SwiftUI

struct SignUpPageView: View {
    @State var isChecked: Bool = false
    @State var Checked: Bool = false
    @State private var isTextBoxVisible = false
    
    @Binding var navigationPath: NavigationPath
    
    var body: some View {
        VStack {
            Text("반가워요! 가입하려면\n\n약관에 동의해주세요 :)")
                .font(
                    Font.custom("NanumSquareRoundOTF", size: 24)
                        .weight(.heavy)
                )
                .padding()
            
            HStack {
                Button(action: {
                    isChecked = !isChecked
                }, label: {
                    if isChecked == false {
                        Image("EmptyCheckBox")
                            .resizable()
                            .frame(width: 30, height: 30)
                    } else {
                        Image("FullCheckBox")
                            .resizable()
                            .frame(width: 30, height: 30)
                    }
                }
                )
                
                Text("개인정보 수집 이용 동의 (필수)")
                    .font(
                        Font.custom("NanumSquareRoundOTF", size: 16)
                            .weight(.bold)
                    )
                    .padding(.leading, 10)
                
                Button(action: {
                    Checked = !Checked
                    isTextBoxVisible.toggle()
                }, label: {
                    if Checked == false {
                        Image("!isChecked")
                            .resizable()
                            .frame(width: 15, height: 15)
                    } else {
                        Image("isChecked")
                            .resizable()
                            .frame(width: 15, height: 15)
                    }
                }
                )
                .padding()
            }
            
            if isTextBoxVisible {
                Image("Text")
            }
            
            Spacer()
            
            NavigationLink(
                destination: SchoolEmailPageView(navigationPath: $navigationPath),
                label: {
                    Text("확인")
                        .foregroundColor(isChecked ? Color.white : Color("CustomGray"))
                        .font(
                            Font.custom("NanumSquareRoundOTF", size: 18)
                                .weight(.heavy)
                        )
                        .frame(width: 365, height: 50)
                        .background(isChecked ? Color("CustomOrange") : Color("DividerGray"))
                        .cornerRadius(10)
                }) .disabled(!isChecked)
                .navigationBarTitle("", displayMode: .inline)
        }
    }
}
