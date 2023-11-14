//
//  PostContentView.swift
//  SMUthie
//
//  Created by Phil on 2023/09/13.
//

import SwiftUI

struct PostContentView: View {
    @Environment(\.dismiss) private var dismiss
    let post : Post
    @State private var pictureNum = 0
    var body: some View {
        VStack{
            HStack{
                Button(action: {dismiss()}){
                    Image(systemName: "chevron.left")
                        .foregroundStyle(.black)
                        .font(.system(size: 25))
                }
                .padding()
                Spacer()
                VStack{
                    Text("리뷰게시판")
                        .font(.system(size: 24,weight: .heavy))
                        .foregroundColor(Color("CustomOrange"))
                        .padding(1)
                    Text(post.place)
                        .font(.system(size: 15,weight: .heavy))
                        .foregroundColor(Color("LightGray"))
                }
                Spacer()
                Spacer()
            }
            ZStack {
                RoundedRectangle(cornerRadius: 5)
                    .strokeBorder(Color("BorderLine"))
                    .background(.white)
                    .cornerRadius(5)
                    .padding(5)
                VStack {
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
                    HStack {
                        Button(action: {
                            pictureNum -= 1
                            if  pictureNum < 0 {
                                pictureNum = post.pictures.count - 1
                            }
                        }) {
                            Image(systemName: "chevron.compact.left")
                                .font(.system(size:40))
                                .accentColor(Color("CustomOrange"))
                        }
                        .padding(.leading, 17)
                        Spacer()
                        Image(systemName: post.pictures[pictureNum])
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 200, height: 200)
                            .padding(.horizontal)
                        Spacer()
                        
                        Button(action: {
                            pictureNum += 1
                            if  pictureNum >= post.pictures.count{
                                pictureNum = 0
                            }
                        }) {
                            Image(systemName: "chevron.compact.right")
                                .font(.system(size:40))
                                .accentColor(Color("CustomOrange"))
                        }
                        .padding(.trailing, 17)
                    }
                    Spacer()
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
                    }.padding()
                }
            }
        }.navigationBarBackButtonHidden(true)
    }
}

struct PostContetView_Previews: PreviewProvider {
    static var previews: some View {
        PostContentView(post : BoardPageViewModel().posts[0])
    }
}
