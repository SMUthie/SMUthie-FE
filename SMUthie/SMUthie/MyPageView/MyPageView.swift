//
//  MyPageView.swift
//  SMUthie
//
//  Created by Phil on 2023/02/28.
//

import SwiftUI

struct MyPageView: View {
    @State private var isLoading = false
    @State private var isLoggedIn = false
    
    var body: some View {
        NavigationView{
            VStack{
                ScrollView {
                    if isLoading {
                        ProgressView()
                            .frame(maxWidth: .infinity, alignment: .center)
                    }
                    else {
                        if isLoggedIn {
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
                        else {
                            VStack {
                                Spacer()
                                
                                Text("로그인을 해주세요 :)")
                                    .font(
                                        Font.custom("NanumSquareRoundOTF", size: 24)
                                            .weight(.heavy)
                                    )
                                    .foregroundColor(.black)
                                    .padding(.bottom, 10)
                                
                                Text("상명대학교에 재학중이신가요?\n슴우디의 회원이 되어보세요!")
                                    .font(
                                        Font.custom("NanumSquareRoundOTF", size: 20)
                                            .weight(.heavy)
                                    )
                                    .foregroundColor(.black)
                                
                                Button(action: {
                                    // 버튼이 클릭되었을 때 수행할 동작
                                }) {
                                    Text("로그인 하러 가기")
                                        .foregroundColor(.white)
                                        .frame(width: 180, height: 40)
                                        .background(Color(red: 0.89, green: 0.47, blue: 0.16))
                                        .cornerRadius(23)
                                }
                                .padding(.vertical, 10)
                                
                                Button(action: {
                                    // 버튼이 클릭되었을 때 수행할 동작
                                }) {
                                    Text("회원가입 하러 가기")
                                        .foregroundColor((Color(red: 0.89, green: 0.47, blue: 0.16)))
                                        .frame(width: 180, height: 40)
                                        .background(
                                            RoundedRectangle(cornerRadius: 23)
                                                .stroke(Color(red: 0.89, green: 0.47, blue: 0.16), lineWidth: 2)
                                        )
                                        .cornerRadius(23)
                                }
                            }
                            .background(
                                RoundedRectangle(cornerRadius: 18)
                                    .foregroundColor(.clear)
                                    .frame(width: 340, height: 280)
                                    .background(.white)
                                    .cornerRadius(18)
                                    .shadow(color: .black.opacity(0.2), radius: 2.5, x: 1, y: 1)
                            )
                            .padding(.vertical, 50)
            
                            CellView(title: "공지사항")
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
                    DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                        isLoading = false
                        isLoggedIn = true // 실제 로그인 상태에 따라 설정
                    }
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
