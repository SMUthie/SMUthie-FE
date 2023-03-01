//
//  ProfileView.swift
//  SMUthie
//
//  Created by Phil on 2023/03/02.
//

import SwiftUI

struct ProfileView: View {
    var body: some View {
        HStack {
            Image(systemName: "person.circle.fill")
                .resizable()
                .frame(width: 80, height: 80)
                .padding()
            
                Text("폴님 안녕하세요!")
                    .font(.title)
                    .bold()
                    .padding(.bottom, 10)
            VStack{
                HStack {
                    Button(action: {
                        // 로그아웃 버튼 클릭 시 처리할 로직
                    }) {
                        Text("로그아웃")
                    }
                    
                    Button(action: {
                        // 설정 버튼 클릭 시 처리할 로직
                    }) {
                        Image(systemName: "gear")
                    }
                }
                
            }

            
            Spacer()
        }
        .background(.white)
        .cornerRadius(20)
        .padding(.horizontal)
        .shadow(radius: 5)
        
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
