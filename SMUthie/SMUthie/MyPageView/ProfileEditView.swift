//
//  ProfileEditView.swift
//  SMUthie
//
//  Created by 김유빈 on 2023/08/14.
//

import SwiftUI

struct ProfileEditView: View {
    @Environment(\.presentationMode) var presentationMode
    @State var name: String = "나는야슴우"
    @State var password: String = ""
    @State var newpassword: String = ""
    @State var SettingButtonSelected = false
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            ZStack {
                Image("ProfileBackground")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(height: 195)
                Text("안녕하세요,")
                    .font(.system(size: 24))
                    .offset(y: -30)
                Text("\n\n\(name)님!")
                    .font(.system(size: 28))
                    .offset(y: -30)
            }
            
            HStack {
                Text("| 닉네임")
                    .padding(.leading, 20)
                TextField("", text: $name)
                    .padding(.leading, 65)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                Button(action: {
                    
                }) {
                    Image("changeBtn")
                }
                .padding(.leading, 10)
                .padding(.trailing, 35)
            }
            .padding(.top, 40)
            
            HStack {
                Text("| 이메일")
                    .padding(.leading, 20)
                Text("201910701 @ sangmyung.kr")
                    .font(.system(size: 12))
                    .foregroundColor(.gray)
                    .padding(.leading, 65)
            }
            .padding(.top, 20)
            
            HStack {
                Text("| 현재 비밀번호")
                    .padding(.leading, 20)
                TextField("", text: $password)
                    .padding(.trailing, 30)
                    .padding(.leading, 15)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
            }
            .padding(.top, 20)
            
            HStack {
                Text("| 신규 비밀번호")
                    .padding(.leading, 20)
                TextField("", text: $newpassword)
                    .padding(.trailing, 30)
                    .padding(.leading, 15)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
            }
            .padding(.top, 20)
            
            Button(action: {
                
            }) {
                Image("changeBtn")
            }
            .padding(.leading, 270)
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
                    .foregroundColor(.gray)
            }
        )
        .navigationTitle("프로필 수정")
        
        Button(action: {
            SettingButtonSelected.toggle()
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

struct ProfileEditView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileEditView()
    }
}
