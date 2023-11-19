//
//  ProfileEditView.swift
//  SMUthie
//
//  Created by 김유빈 on 2023/08/14.
//

import SwiftUI

struct ProfileEditView: View {
    @ObservedObject private var checknicknameViewModel = CheckNicknameViewModel()
    
    @Binding var username: String
    let schoolId: Int
    
    @Environment(\.presentationMode) var presentationMode
    @State var password: String = ""
    @State var newpassword: String = ""
    @State var SettingButtonSelected = false
    @State private var isButtonPressed = false
    @State private var isNicknameEnabled = false
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            ZStack {
                Image("ProfileBackground")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(height: 195)
                Text("안녕하세요,")
                    .font(
                        Font.custom("NanumSquareRoundOTFR", size: 24)
                    )
                    .offset(y: -30)
                Text("\n\n\(username)님!")
                    .font(
                        Font.custom("NanumSquareRoundOTFR", size: 28)
                    )
                    .offset(y: -30)
            }.padding(.bottom, 35)
            
            if !isNicknameEnabled && isButtonPressed {
                Text("*중복된 닉네임입니다.")
                    .font(
                        Font.custom("NanumSquareRoundOTF", size: 11)
                            .weight(.bold)
                    )
                    .multilineTextAlignment(.trailing)
                    .foregroundColor(Color.red)
                    .padding(.trailing, 40)
                    .padding(.bottom, 8)
                    .frame(maxWidth: .infinity, alignment: .trailing)
            }
            
            HStack {
                Text("| 닉네임(8자이하)")
                    .font(
                        Font.custom("NanumSquareRoundOTF", size: 14)
                            .weight(.bold)
                    )
                    .padding(.leading, 16)
                
                TextField("", text: $username)
                    .font(Font.custom("NanumSquareRoundOTF", size: 14))
                    .padding(.leading, 18)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                
                Button(action: {
                    checknicknameViewModel.fetchCheckNickname(nickname: username, completionHandler: { result in
                        isButtonPressed = true
                        switch result {
                        case .success(let bool):
                            isNicknameEnabled = bool
                        default:
                            isNicknameEnabled = false
                        }
                    })
                }) {
                    if isButtonPressed && !isNicknameEnabled {
                        Text("중복 확인")
                            .foregroundColor(.white)
                            .font(
                            Font.custom("NanumSquareRoundOTF", size: 12)
                            .weight(.bold)
                            )
                            .frame(width: 70, height: 26)
                            .background(Color("CustomOrange"))
                            .cornerRadius(30)
                    } else {
                        Text("변경")
                            .foregroundColor(.white)
                            .font(
                            Font.custom("NanumSquareRoundOTF", size: 12)
                            .weight(.bold)
                            )
                            .frame(width: 70, height: 26)
                            .background(Color("CustomOrange"))
                            .cornerRadius(30)
                    }
                }
                .padding(.leading, 5)
                .padding(.trailing, 25)
            }
            
            HStack {
                Text("| 이메일")
                    .font(
                        Font.custom("NanumSquareRoundOTF", size: 14)
                            .weight(.bold)
                    )
                    .padding(.leading, 16)
                Text("\(String(schoolId)) @ sangmyung.kr")
                    .font(
                        Font.custom("NanumSquareRoundOTF", size: 14)
                            .weight(.bold)
                    )
                    .foregroundColor(.gray)
                    .padding(.leading, 60)
            }
            .padding(.top, 20)
            
            HStack {
                Text("| 현재 비밀번호")
                    .font(
                        Font.custom("NanumSquareRoundOTF", size: 14)
                            .weight(.bold)
                    )
                    .padding(.leading, 16)
                SecureField("", text: $password)
                    .padding(.trailing, 30)
                    .padding(.leading, 15)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
            }
            .padding(.top, 20)
            
            HStack {
                Text("| 신규 비밀번호")
                    .font(
                        Font.custom("NanumSquareRoundOTF", size: 14)
                            .weight(.bold)
                    )
                    .padding(.leading, 16)
                SecureField("", text: $newpassword)
                    .padding(.trailing, 30)
                    .padding(.leading, 15)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
            }
            .padding(.top, 20)
            
            Text("변경")
                .foregroundColor(.white)
                .font(
                Font.custom("NanumSquareRoundOTF", size: 12)
                .weight(.bold)
                )
                .frame(width: 70, height: 26)
                .background(Color("CustomOrange"))
                .cornerRadius(30)
                .padding(.leading, 260)
                .padding(.top, 10)
            
            Text("“오늘은 뭐 먹지? SMUthie”")
                .padding(.top, 10)
                .padding(.bottom, 30)
                .padding(.horizontal, 80)
        }
        .background(.white)
        .cornerRadius(20)
        .padding(.horizontal)
        .shadow(color: .orange, radius: 2)
        
        .navigationBarBackButtonHidden(true)
        .navigationBarItems(
            leading: Button(action: {
                presentationMode.wrappedValue.dismiss()
            }) {
                Image(systemName: "chevron.left")
                    .foregroundColor(.primary)
            }
        )
        .navigationTitle("프로필 수정")
        
        Button(action: {
            //SettingButtonSelected.toggle()
        }) {
            Text("설정 완료")
                .foregroundColor(SettingButtonSelected ? Color.white : Color.gray)
                .font(.system(size: 14))
                .frame(width: 89, height: 25)
                .background(SettingButtonSelected ? Color.orange : Color.gray.opacity(0.2))
                .cornerRadius(30)
                .padding(.bottom, 20)
        }
        .padding(.top, 20)
    }
}
