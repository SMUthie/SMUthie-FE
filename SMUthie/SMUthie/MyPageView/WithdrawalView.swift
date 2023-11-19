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
            ZStack {
                Text("그동안 슴우디와 \n\n함께해주셔서 감사합니다 :)\n\n\n더이상 슴우디를 이용하지\n\n않으시나요?")
                    .font(
                        Font.custom("NanumSquareRoundOTF", size: 24)
                            .weight(.heavy)
                    )
                    .foregroundColor(.black)
                    .padding(.top, 30)
                
                Image("smu")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 150, height: 178)
                    .clipped()
                    .opacity(0.3)
                    .padding(.top, 150)
            }
            
            Spacer()
            
            Button(action: {
                
            }) {
                Text("아니요, 계속 이용할래요!")
                    .foregroundColor(.white)
                    .font(
                        Font.custom("NanumSquareRoundOTF", size: 20)
                            .weight(.heavy)
                    )
                    .frame(width: 365, height: 50)
                    .background(Color("CustomOrange"))
                    .cornerRadius(5)
                    .shadow(
                        color: .gray.opacity(0.3),
                        radius: 1,
                        x: 3, y: 3)
                
            }
            Button(action: {
                
            }) {
                Text("네, 탈퇴하고 싶습니다.")
                    .foregroundColor(Color("CustomOrange"))
                    .font(
                        Font.custom("NanumSquareRoundOTF", size: 18)
                            .weight(.heavy)
                    )
                    .frame(width: 365, height: 50)
                    .background(.white)
                    .cornerRadius(5)
                    .shadow(
                        color: .gray.opacity(0.3),
                        radius: 1,
                        x: 3, y: 3)
            }
            .padding(.bottom, 20)
        }
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                Image("Logo")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 116, height: 35.5)
            }
        }
    }
}

struct WithdrawalView_Previews: PreviewProvider {
    static var previews: some View {
        WithdrawalView()
    }
}
