//
//  PostContentView.swift
//  SMUthie
//
//  Created by Phil on 2023/09/13.
//

import SwiftUI

struct ReviewDetailView: View {
    @Environment(\.dismiss) private var dismiss
    let reviewIndex : Int
    @StateObject var vm = ReviewDetailViewModel()
    @State private var pictureNum = 0
    
    var body: some View {
        VStack{
            if let reviewDetailInfo = vm.reviewDetailResult{
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
                    Text(reviewDetailInfo.storeName)
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
                VStack{
                    VStack(alignment: .leading) {
                        HStack{
                            Image("ProfileImage")
                            VStack(alignment: .leading){
                                Text(reviewDetailInfo.nickname)
                                Text(convertToKST2(reviewDetailInfo.createdAt) ?? "")
                                    .foregroundColor(Color("LightGray"))
                                    .font(.system(size: 12))
                            }
                            Spacer()
                        }.padding()
                        HStack{
                            Text("#"+(reviewDetailInfo.menuName))
                                .foregroundColor(Color("CustomBlue"))
                            Spacer()
                        }.padding(.horizontal)
                        Text(reviewDetailInfo.content)
                            .padding()
                        HStack {
                            Button(action: {
                                pictureNum -= 1
                                if  pictureNum < 0 {
                                    pictureNum = reviewDetailInfo.imageUrl.count - 1
                                }
                            }) {
                                Image(systemName: "chevron.compact.left")
                                    .font(.system(size:40))
                                    .accentColor(Color("CustomOrange"))
                            }
                            .padding(.leading, 17)
                            Spacer()
                            AsyncImage(urlString: reviewDetailInfo.imageUrl[pictureNum])
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 200, height: 200)
                                .padding(.horizontal)
                            Spacer()
                            
                            Button(action: {
                                pictureNum += 1
                                if  pictureNum >= reviewDetailInfo.imageUrl.count{
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
                    }
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
                                        Text("\(reviewDetailInfo.likes)")
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
                                        Text("\(reviewDetailInfo.dislikes)")
                                            .foregroundColor(Color("CustomBlue"))
                                    }
                                )
                        }
                    }.padding()
                    Spacer()
                }
            }
        }
        }
        .onAppear{
            vm.fetchReviewDetail(reviewIndex)
        }
        .navigationBarBackButtonHidden(true)
    }
}


