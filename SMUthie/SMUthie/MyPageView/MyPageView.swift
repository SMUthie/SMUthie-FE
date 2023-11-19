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
    @Binding var goBackLoginView: Bool
    @Binding var showingLoginView: Bool
    
    @ObservedObject private var checknicknameViewModel = CheckNicknameViewModel()
    @Binding var username: String
    let schoolId: Int
    
    let loginChecker = checkLogin()
    
    var body: some View {
        NavigationView{
            VStack{
                ScrollView {
                    if isLoading {
                        ProgressView()
                            .frame(maxWidth: .infinity, alignment: .center)
                    }
                    else {
                        if loginChecker.checkLoginStatus() {
                            VStack {
                                ProfileView(goBackLoginView: $goBackLoginView, showingLoginView: $showingLoginView, username: $username, schoolId: schoolId)
                                
                                CellView(title: "공지사항")
                                
                                Text("현재 버전 23.11.20")
                                    .font(Font.custom("NanumSquareRoundOTF", size: 15))
                                    .foregroundColor(.black)
                                    .frame(height: 40)
                                    .padding(.horizontal)
                                    .padding(.vertical, 5)
                                    .padding(.leading, 15)
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                
                                Divider()
                                
                                NavigationLink(
                                    destination: WithdrawalView(),
                                    label: {
                                        Text("회원탈퇴")
                                            .font(
                                                Font.custom("NanumSquareRoundOTF", size: 14)
                                            )
                                            .underline()
                                            .foregroundColor(Color("54Gray"))
                                            .frame(maxWidth: .infinity, alignment: .trailing)
                                            .padding(.trailing, 20)
                                    })
                                
                                Text("본 어플리케이션은\n상명대학교 휴먼지능정보공학전공\n학생들이 제작하였습니다.\n\n문의 및 피드백 - 201910790@sangmyung.kr")
                                    .foregroundColor(.secondary)
                                    .font(.system(size: 12))
                                    .multilineTextAlignment(.center)
                                    .padding()
                            }
                        }
                        else {
                            VStack {
                                Spacer()
                                
                                HStack {
                                    Text("로그인을 해주세요 :)")
                                        .font(
                                            Font.custom("NanumSquareRoundOTF", size: 24)
                                                .weight(.heavy)
                                        )
                                        .foregroundColor(.black)
                                        .padding(.bottom, 10)
                                    Image("smu")
                                        .resizable()
                                        .aspectRatio(contentMode: .fill)
                                        .frame(width: 60, height: 71)
                                }
                                
                                Text("상명대학교에 재학중이신가요?\n슴우디의 회원이 되어보세요!")
                                    .font(
                                        Font.custom("NanumSquareRoundOTF", size: 20)
                                            .weight(.heavy)
                                    )
                                    .foregroundColor(.black)
                                
                                Button(action: {
                                    
                                }) {
                                    Text("로그인 하러 가기")
                                        .font(
                                            Font.custom("NanumSquareRoundOTF", size: 18)
                                                .weight(.bold)
                                        )
                                        .multilineTextAlignment(.center)
                                        .foregroundColor(.white)
                                        .frame(width: 180, height: 40)
                                        .background(Color("CustomOrange"))
                                        .cornerRadius(23)
                                }
                                .padding(.vertical, 10)
                                
                                Button(action: {
                                    
                                }) {
                                    Text("회원가입 하러 가기")
                                        .font(
                                            Font.custom("NanumSquareRoundOTF", size: 18)
                                                .weight(.bold)
                                        )
                                        .foregroundColor(Color("CustomOrange"))
                                        .frame(width: 180, height: 40)
                                        .background(
                                            RoundedRectangle(cornerRadius: 23)
                                                .stroke(Color("CustomOrange"))
                                        )
                                        .cornerRadius(23)
                                }
                            }
                            .background(
                                RoundedRectangle(cornerRadius: 18)
                                    .foregroundColor(.clear)
                                    .frame(width: 340, height: 300)
                                    .background(.white)
                                    .cornerRadius(18)
                                    .shadow(color: .black.opacity(0.2), radius: 2.5, x: 1, y: 1)
                            )
                            .padding(.vertical, 50)
                            
                            CellView(title: "공지사항")
                            
                            Text("현재 버전 23.11.20")
                                .font(Font.custom("NanumSquareRoundOTF", size: 15))
                                .foregroundColor(.black)
                                .frame(height: 40)
                                .padding(.horizontal)
                                .padding(.vertical, 5)
                                .padding(.leading, 15)
                                .frame(maxWidth: .infinity, alignment: .leading)
                            
                            Text("본 어플리케이션은\n상명대학교 휴먼지능정보공학전공\n학생들이 제작하였습니다.\n\n문의 및 피드백 - 201910790@sangmyung.kr")
                                .font(
                                    Font.custom("NanumSquareRoundOTF", size: 12)
                                        .weight(.heavy)
                                )
                                .multilineTextAlignment(.center)
                                .foregroundColor(Color("LightGray"))
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
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Image("Logo")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 116, height: 35.5)
                }
            }
            .navigationTitle("")
        }
    }
}
