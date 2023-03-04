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
                                .frame(height: UIScreen.main.bounds.height / 5)
                            Text("오늘 뭐 먹지?")
                                .font(.title2)
                                .bold()
                            RecommendView()
                                .padding()
                            CellView(title: "공지사항")
                            CellView(title: "피드백 작성")
                            CellView(title: "회원탈퇴")
                            
                            Text("현재 버전 1.0.0")
                                .font(.footnote)
                                .foregroundColor(.secondary)
                                .padding(.top, 10)
                        }
                    }
                }
                .refreshable {
                    isLoading = true
                    isLoading = false
                }
            }
            .navigationTitle("My Page")
        }
    }
}




struct MyPageView_Previews: PreviewProvider {
    static var previews: some View {
        MyPageView()
    }
}
