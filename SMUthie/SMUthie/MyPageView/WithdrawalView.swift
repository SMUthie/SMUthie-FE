//
//  WithdrawalView.swift
//  SMUthie
//
//  Created by Phil on 2023/03/02.
//

import SwiftUI

struct WithdrawalView: View {
    var body: some View {
        VStack {
            Text("그동안 슴우디와 함께해주셔서 감사합니다 :) \n\n더이상 슴우디를 이용하지 \n않으시나요?")
                .font(.system(size: 24))
                .bold()
                .padding(.top, 100)
            
            Spacer()
            
            Button(action: {
                
            }) {
                Text("아니요, 계속 이용할래요!")
                    .foregroundColor(.white)
                    .font(.system(size: 24))
                    .bold()
                    .frame(width: 365, height: 50)
                    .background(.orange)
                    .cornerRadius(5)
                    .shadow(
                        color: .gray.opacity(0.3),
                        radius: 1,
                        x: 3, y: 3)
                
            }
            Button(action: {
                
            }) {
                Text("네, 탈퇴하고 싶습니다.")
                    .foregroundColor(.orange)
                    .font(.system(size: 18))
                    .bold()
                    .frame(width: 365, height: 50)
                    .background(.white)
                    .cornerRadius(5)
                    .shadow(
                        color: .gray.opacity(0.3),
                        radius: 1,
                        x: 3, y: 3)
            }
            
        }
    }
}

struct WithdrawalView_Previews: PreviewProvider {
    static var previews: some View {
        WithdrawalView()
    }
}
