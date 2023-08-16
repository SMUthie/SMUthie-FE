//
//  ProfileView.swift
//  SMUthie
//
//  Created by Phil on 2023/03/02.
//

import SwiftUI

struct ProfileView: View {
    @State var imageChanged = true
    @State var showMyPosts = false
    @State var showLikePosts = false
    @State var showProfileEdit = false
    
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Image("Profile")
                    .resizable()
                    .frame(width: 80, height: 80)
                    .padding()
                VStack {
                    HStack() {
                        Spacer()
                        NavigationLink(destination: ProfileEditView(), isActive: $showProfileEdit) {
                            Image("Gear")
                        }
                    }
                    .padding(.bottom, 10)
                    .padding(.trailing, 5)
                    
                    HStack{
                        Text("나는야슴우")
                            .fontWeight(.heavy)
                            .font(.title3)
                            .foregroundColor(Color.orange)
                        Text("님 안녕하세요!")
                            .font(.headline)
                            .foregroundColor(Color.gray)
                    }
                }
                Spacer()
            }
            Divider()
            Button(action: {
                showMyPosts = true
            }) {
                Image("PencilLine")
                Text("내가 쓴 글")
                    .foregroundColor(.black)
                    .font(.headline)
                    .cornerRadius(10)
            }
            .padding(.vertical, 5)
            .padding(.leading, 10)
            .sheet(isPresented: $showMyPosts, content: {
                // MyPostsView()
            })
            Divider()
            Button(action: {
                showLikePosts = true
            }) {
                Image("ThumbsUp")
                Text("좋아요한 글")
                    .foregroundColor(.black)
                    .font(.headline)
                    .cornerRadius(10)
            }
            .padding(.vertical, 5)
            .padding(.leading, 10)
            .sheet(isPresented: $showLikePosts, content: {
                // LikePostsView()
            })
            Divider()
            Button(action: {
                
            }) {
                Text("로그아웃")
                    .foregroundColor(.white)
                    .font(.system(size: 14))
                    .frame(width: 70, height: 26)
                    .background(.orange)
                    .cornerRadius(30)
            }
            .padding(.top, 10)
            .padding(.bottom, 15)
            .padding(.leading, 270)
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
