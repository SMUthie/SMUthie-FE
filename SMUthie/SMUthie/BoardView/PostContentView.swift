//
//  PostContentView.swift
//  SMUthie
//
//  Created by Phil on 2023/09/13.
//

import SwiftUI

struct PostContentView: View {
    let post : Post
    var body: some View {
        VStack{
            Text("리뷰게시판")
                .font(.system(size: 24,weight: .heavy))
                .foregroundColor(Color("CustomOrange"))
                .padding(1)
            Text(post.place)
                .font(.system(size: 15,weight: .heavy))
                .foregroundColor(Color("LightGray"))
            ZStack {
                RoundedRectangle(cornerRadius: 5)
                    .strokeBorder(Color("BorderLine"))
                    .background(.white)
                    .cornerRadius(5)
                    .padding(5)
                VStack() {
                    HStack{
                        Image("ProfileImage")
                        VStack{
                            Text(post.name)
                            Text(post.date)
                        }
                        Spacer()
                    }.padding()
                    HStack{
                        Text(post.hashtag)
                            .foregroundColor(Color("CustomBlue"))
                        Spacer()
                    }.padding(.horizontal)
                    Text(post.content)
                        .padding()
                    RoundedRectangle(cornerRadius: 5)
                        .strokeBorder(Color("DividerGray"))
                        .background(.white)
                        .frame(width: 330, height: 330)
                        .cornerRadius(5)
                        .padding()
                        .overlay(
                            Image(systemName: "camera")
                        )
                    HStack {
                        Button(action: {}){
                            RoundedRectangle(cornerRadius: 50)
                                .strokeBorder(Color("DividerGray"))
                                .frame(width: 58, height: 26)
                                .background(.white)
                                .cornerRadius(50)
                                .padding(.horizontal)
                                .overlay(
                                    HStack(spacing:2){
                                        Image("ThumbsUp")
                                        Text("\(post.like)")
                                            .foregroundColor(.red)
                                    }
                                )
                        }
                        Button(action: {}){
                            RoundedRectangle(cornerRadius: 50)
                                .strokeBorder(Color("DividerGray"))
                                .frame(width: 58, height: 26)
                                .background(.white)
                                .cornerRadius(50)
                                .padding(.horizontal)
                                .overlay(
                                    HStack(spacing:2){
                                        Image("ThumbsDown")
                                        Text("\(post.unlike)")
                                            .foregroundColor(Color("CustomBlue"))
                                    }
                                )
                        }
                    }
                }
            }
        }
    }
}

struct PostContetView_Previews: PreviewProvider {
    static var previews: some View {
        PostContentView(post : BoardViewModel().posts[0])
    }
}
