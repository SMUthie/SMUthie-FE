//
//  ProfileView.swift
//  SMUthie
//
//  Created by Phil on 2023/03/02.
//

import SwiftUI

struct ProfileView: View {
    private let keychainManager = KeyChainManager.shared
    @Binding var goBackLoginView: Bool
    @Binding var showingLoginView: Bool
    
    @State var imageChanged = true
    @State var showMyPosts = false
    @State var showLikePosts = false
    @State var showProfileEdit = false
    
    @ObservedObject private var checknicknameViewModel = CheckNicknameViewModel()
    @Binding var username: String
    let schoolId: Int
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Image("Profile")
                    .resizable()
                    .frame(width: 80, height: 80)
                    .padding()
                    .padding(.top, 20)
                
                VStack {
                    HStack() {
                        Spacer()
                        NavigationLink(destination: ProfileEditView(username: $username, schoolId: schoolId), isActive: $showProfileEdit) {
                            Image("Gear")
                        }
                    }
                    .padding(.vertical, 10)
                    .padding(.trailing, 15)
                    
                    HStack{
                        Text(username)
                            .font(
                            Font.custom("NanumSquareRoundOTF", size: 18)
                            .weight(.heavy)
                            )
                            .foregroundColor(Color("CustomOrange"))
                        Text("님 안녕하세요!")
                            .font(
                            Font.custom("NanumSquareRoundOTF", size: 18)
                            .weight(.heavy)
                            )
                            .foregroundColor(Color.gray)
                    }
                    .padding(.bottom, 10)
                }
                Spacer()
            }
            
            Text("제보 Lv.999")
              .font(
                Font.custom("NanumSquareRoundOTF", size: 12)
                  .weight(.heavy)
              )
              .multilineTextAlignment(.trailing)
              .foregroundColor(Color(red: 0, green: 0.04, blue: 1))
              .frame(maxWidth: .infinity, alignment: .trailing)
              .padding(.trailing, 35)
            
            Image("level999")
                .frame(maxWidth: .infinity, alignment: .center)
                .padding(.bottom, 10)
            
            Divider()
            Button(action: {
                showMyPosts = true
            }) {
                Image("PencilLine")
                Text("내가 쓴 글")
                    .font(
                    Font.custom("NanumSquareRoundOTF", size: 15)
                    .weight(.bold)
                    )
                    .foregroundColor(.black)
                    .cornerRadius(10)
            }
            .padding(.vertical, 5)
            .padding(.leading, 20)
            .sheet(isPresented: $showMyPosts, content: {
                // MyPostsView()
            })
            Divider()
            Button(action: {
                showLikePosts = true
            }) {
                Image("ThumbsUp")
                Text("좋아요한 글")
                    .font(
                    Font.custom("NanumSquareRoundOTF", size: 15)
                    .weight(.bold)
                    )
                    .foregroundColor(.black)
                    .cornerRadius(10)
            }
            .padding(.vertical, 5)
            .padding(.leading, 20)
            .sheet(isPresented: $showLikePosts, content: {
                // LikePostsView()
            })
            Divider()
            Button(action: {
                _ = keychainManager.deleteKeychain(saveType: .accessToken)
                goBackLoginView.toggle()
                showingLoginView.toggle()
            }) {
                Text("로그아웃")
                    .foregroundColor(.white)
                    .font(
                    Font.custom("NanumSquareRoundOTF", size: 12)
                    .weight(.bold)
                    )
                    .frame(width: 70, height: 26)
                    .background(Color("CustomOrange"))
                    .cornerRadius(30)
            }
            .padding(.top, 10)
            .padding(.bottom, 15)
            .padding(.leading, 270)
        }
        .cornerRadius(20)
        .padding(.horizontal)
        .background(
            RoundedRectangle(cornerRadius: 18)
                .foregroundColor(.clear)
                .background(.white)
                .cornerRadius(18)
                .shadow(color: .black.opacity(0.2), radius: 2.5, x: 1, y: 1)
                .padding(.horizontal, 15)
                .padding(.top, 20)
        )
    }
}
