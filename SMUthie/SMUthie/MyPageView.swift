//
//  MyPageView.swift
//  SMUthie
//
//  Created by Phil on 2023/02/28.
//

import SwiftUI

struct MyPageView: View {
    var body: some View {
        ScrollView {
            VStack {
                ProfileView()
                    .frame(height: UIScreen.main.bounds.height / 5)
                    .padding(.top)
                Text("오늘 뭐 먹지?")
                    .font(.title2)
                    .bold()
                    .padding(.horizontal)
                RecommendView()
                    .padding()
                CellView(title: "공지사항")
                CellView(title: "피드백 작성")
                CellView(title: "회원탈퇴")
                
                Text("현재 버전 1.0.0")
                    .font(.footnote)
                    .foregroundColor(.secondary)
                    .padding(.top, 10)
                    .padding(.bottom, 20)
            }
        }
    }
}




struct MyPageView_Previews: PreviewProvider {
    static var previews: some View {
        MyPageView()
    }
}
