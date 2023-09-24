//
//  BoardPageView.swift
//  SMUthie
//
//  Created by Phil on 2023/07/10.
//

import SwiftUI

struct BoardPageView: View {
    
    var body: some View {
        ScrollView{
            VStack{
                HStack(spacing:1) {
                    Image("Food1")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                    
                    VStack(spacing:1){
                        Image("Food2")
                            .resizable()
                            .frame(height: 122)
                        Image("Food3")
                            .resizable()
                            .frame(height: 122)
                    }
                }
                Text("부대통령 게시판")
                    .font(.system(size: 24))
                    .foregroundColor(Color("CustomOrange"))
                    .padding(.top)
                
                BoardInformationView()
                BoardListView()
            }
        }
    }
}

struct BoardListView :View {
    @ObservedObject var vm = BoardViewModel()
    
    var body: some View {
        HStack {
            NavigationLink(destination: AddPostView()){
                Image("AddReviewBtn")
            }
            Spacer()

            Text ("게시글")
                .font(.system(size: 18))
                .bold()
            Spacer()
            VStack{
                Spacer()
                Button(action: {}){
                    ZStack{
                        RoundedRectangle(cornerRadius: 5)
                            .strokeBorder(Color("LightGray"))
                            .frame(width: 80,height: 24)
                        HStack{
                            Image(systemName: "magnifyingglass")
                            Text("검색하기")
                                .font(.system(size: 12))
                                .underline(true)
                        }
                        .foregroundColor(Color("CustomGray"))
                    }
                }
                .padding(.horizontal)
            }
        }
        .padding(.top)
        showPostList(vm : vm)
    }
}

struct showPostList : View{
    let vm : BoardViewModel
    
    var body : some View {
        VStack(spacing: 0) {
            ForEach(Array(vm.posts.enumerated()), id: \.element.id) {
                (index, post) in
                NavigationLink (destination: PostContentView(post :post)) {
                    ZStack {
                        RoundedRectangle(cornerRadius: 5)
                            .strokeBorder(Color("LightGray"))
                            .frame(height: 75)
                        VStack {
                            Spacer()
                            Spacer()
                            HStack{
                                if index == 0 {
                                    Text("인기")
                                        .bold()
                                        .foregroundColor(.red)
                                        .padding(.horizontal)
                                    Spacer()
                                    Text(post.content)
                                        .frame(maxWidth: 220)
                                        .foregroundColor(.black)
                                        .font(.system(size: 16))
                                        .lineLimit(1)
                                    Spacer()
                                    Spacer()
                                    Spacer()
                                    Spacer()
                                }
                                else{
                                    Text(post.content)
                                        .frame(maxWidth: 220)
                                        .foregroundColor(.black)
                                        .font(.system(size: 16))
                                        .lineLimit(1)
                                }
                            }
                            HStack{
                                Text(post.date)
                                    .font(.system(size: 14))
                                Text(post.hashtag)
                                    .font(.system(size: 14))
                                    .foregroundColor(Color("CustomBlue"))
                                    .padding(.horizontal)
                                Spacer()
                                VStack {
                                    Spacer()
                                    HStack {
                                        HStack(spacing: 0) {
                                            Image(systemName: "photo")
                                            Text("\(post.ImageNum)")
                                                .font(.system(size: 12))
                                        }
                                        .foregroundColor(Color("CustomGray"))
                                        HStack(spacing: 0) {
                                            Image("ThumbsUp")
                                            Text("\(post.like)")
                                                .font(.system(size: 12))
                                        }
                                        .foregroundColor(.red)
                                        HStack(spacing : 0) {
                                            Image("ThumbsDown")
                                            Text("\(post.unlike)")
                                                .font(.system(size: 12))
                                        }
                                        .foregroundColor(Color("CustomBlue"))
                                    }
                                }
                            }
                            .padding(.horizontal)
                            Spacer()
                        }//VStack
                    }
//                    .onTapGesture{
//                        print(index)
//                    }
                }
            }
        }
    }
}

struct BoardPageView_Previews: PreviewProvider {
    static var previews: some View {
        BoardPageView()
    }
}
