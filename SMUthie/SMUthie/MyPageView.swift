//
//  MyPageView.swift
//  SMUthie
//
//  Created by Phil on 2023/02/28.
//

import SwiftUI


struct MyPageView: View {
    @State private var isLoading = false
    var body: some View {
        NavigationView{
            VStack{
                ScrollView {
                    if isLoading {
                        ProgressView()
                            .frame(maxWidth: .infinity, alignment: .center)
                    }
                    else{
                        VStack {
                            ProfileView()
                
                            CellView(title: "공지사항")
                            CellView(title: "회원탈퇴")
                            CellView(title: "현재 버전 11.40.1")
                            
                            Text("본 어플리케이션은\n상명대학교 휴먼정보지능공학과\n학생들이 제작하였습니다.\n\n문의 및 피드백 - 201910701@sangmyung.kr")
                                .foregroundColor(.secondary)
                                .font(.system(size: 12))
                                .multilineTextAlignment(.center)
                                .padding()
                        }
                    }
                }
                .refreshable {
                    isLoading = true
                    isLoading = false
                }
            }
            .navigationTitle("")
        }
    }
}




struct MyPageView_Previews: PreviewProvider {
    static var previews: some View {
        MyPageView()
    }
}
