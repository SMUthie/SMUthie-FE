//
//  ProfileView.swift
//  SMUthie
//
//  Created by Phil on 2023/03/02.
//

import SwiftUI

struct ProfileView: View {
    @State var imageChanged = true
    @State var showMyPosts = false // 상태 변수
    
    var body: some View {
        VStack {
            HStack {
                Image("Profile")
                    .resizable()
                    .frame(width: 80, height: 80)
                    .padding()
                VStack {
                    HStack() {
                        Spacer()
                        Button(action: {
                            // 설정 버튼 클릭 시 처리할 로직
                        }) {
                            Image(systemName: "gear")
                                .foregroundColor(.orange)
                        }
                    }.padding(.bottom,10)
                    HStack{
                        Text("나는야슴우")
                            //.foregroundColor(Color("CustomOrange"))
                            .fontWeight(.heavy)
                            .font(.title3)
                        
                        Text("님 안녕하세요!")
                            .font(.headline)
                            //.foregroundColor(Color("LightGray"))
                            .padding(.top, 5)
                    }
                }
                Spacer()
            }
            Divider()
            Button(action: {
                showMyPosts = true
            }) {
                Text("내가 쓴 글")
                    .foregroundColor(.black)
                    .font(.headline)
                    .cornerRadius(10)
                    .padding(.top, 10)
            }
            .sheet(isPresented: $showMyPosts, content: {
                //MyPostsView() // 내가 쓴 글 보기 페이지
            })
            Divider()
            Button(action: {
                showMyPosts = true
            }) {
                Text("좋아요한 글")
                    .foregroundColor(.black)
                    .font(.headline)
                    .cornerRadius(10)
                    .padding(.top, 10)
            }
            .sheet(isPresented: $showMyPosts, content: {
                //MyPostsView() // 내가 쓴 글 보기 페이지
            })
            Divider()
            Button(action: {
                // 설정 버튼 클릭 시 처리할 로직
            }) {
                Text("로그아웃")
                    .foregroundColor(.orange)
            }
            .padding(.top, 10)
            .padding(.bottom, 15)
            
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
