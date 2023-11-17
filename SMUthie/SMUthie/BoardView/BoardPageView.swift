//
//  BoardPageView.swift
//  SMUthie
//
//  Created by Phil on 2023/07/10.
//

import SwiftUI

struct BoardPageView: View {
    @Environment(\.dismiss) private var dismiss
    
    let store_index : Int
    @StateObject var vm = BoardPageViewModel()
    
    
    var body: some View {
        ScrollView{
            HStack{
                Button(action: {dismiss()}){
                    Image(systemName: "chevron.left")
                        .foregroundStyle(.black)
                        .font(.system(size: 25))
                }
                Spacer()
                Image("Logo")
                    .resizable()
                    .scaledToFit()
                    .frame(width: UIScreen.main.bounds.width/3, height: 35.5)
            }.padding()
            VStack{
                HStack(spacing:1) {
                    AsyncImage(urlString: vm.boardDetailInfo?.images[0] ?? "")
                        .aspectRatio(contentMode: .fill)
                    
                    VStack(spacing:1){
                        AsyncImage(urlString: vm.boardDetailInfo?.images[1] ?? "")
                            .frame(height: 122)
                        AsyncImage(urlString: vm.boardDetailInfo?.images[2] ?? "")
                            .frame(height: 122)
                    }
                }
                Text((vm.boardDetailInfo?.storeName ?? "알 수 없는")+" 게시판")
                    .font(.system(size: 24,weight: .heavy))
                    .foregroundColor(Color("CustomOrange"))
                    .padding(.top)
                
                BoardDetailView(vm: vm)
                
                VStack{
                    HStack {
                        NavigationLink(destination: AddReviewView(storeIdx : store_index, vm : vm)){
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
                    VStack(spacing: 0) {
                        ForEach(vm.reviewResult, id: \.reviewIdx) {review in
                            ReviewCellView(review: review)
                        }
                        
                    }
                }
            }
        }.onAppear{
            vm.fetchBoardDetail(store_index)
            vm.fetchReviews(store_index)
        }
        .navigationBarBackButtonHidden(true)
    }
}


struct ReviewCellView :View {
    let review : ReviewResult
    
    var body: some View {
        NavigationLink(destination: {ReviewDetailView(reviewIndex: review.reviewIdx)}){
            ZStack {
                RoundedRectangle(cornerRadius: 5)
                    .strokeBorder(Color("LightGray"))
                    .frame(height: 75)
                HStack{
                    Text(convertToKST(review.createdAt) ?? "")
                        .font(.system(size: 14))
                        .padding()
                    Spacer()
                    VStack(alignment: .leading) {
                        Spacer()
                        Spacer()
                        HStack{
                            Text(review.content)
                                .foregroundColor(.black)
                                .font(.system(size: 16))
                                .lineLimit(1)
                            Spacer()
                        }
                        Spacer()
                        Text("#"+review.menuName)
                            .font(.system(size: 14))
                            .foregroundColor(Color("CustomBlue"))
                            .padding(.horizontal)
                        Spacer()
                        Spacer()
                    }
                    Spacer()
                    VStack {
                        Spacer()
                        HStack {
                            HStack(spacing: 0) {
                                Image("ThumbsUp")
                                Text("\(review.likes)")
                                    .font(.system(size: 12))
                            }
                            .foregroundColor(.red)
                            HStack(spacing : 0) {
                                Image("ThumbsDown")
                                Text("\(review.unlikes)")
                                    .font(.system(size: 12))
                            }
                            .foregroundColor(Color("CustomBlue"))
                        }
                        .padding()
                    }
                }
            }
        }
    }
}


