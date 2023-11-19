//
//  BoardInformationView.swift
//  SMUthie
//
//  Created by Phil on 2023/07/16.
//

import SwiftUI

struct BoardDetailView: View {
    @ObservedObject var vm : BoardPageViewModel
    @State private var isInfOpened = false
    @State private var showAllDishes = false
    let storeId : Int
    var body: some View {
        ZStack{
            RoundedRectangle(cornerRadius: 25)
                .strokeBorder(Color("LightGray"))
                .background(.white)
            VStack(spacing: 10){
                Button(action: {withAnimation{ isInfOpened.toggle()}}) {
                    RoundedRectangle(cornerRadius: 50)
                        .fill(Color("CustomOrange"))
                        .frame(height: 50)
                        .overlay(
                            HStack{
                                Spacer()
                                Spacer()
                                Text("영업정보 보기")
                                    .foregroundColor(.white)
                                    .underline()
                                    .fontWeight(.bold)
                                Spacer()
                                Image(systemName: isInfOpened ? "chevron.down" : "chevron.up" )
                                    .font(.system(size: 20))
                                    .fontWeight(.semibold)
                                    .foregroundColor(.white)
                                    .padding(.trailing)
                                    .padding(.horizontal)
                            }
                        )
                }.buttonStyle(PlainButtonStyle())
                if isInfOpened {
                    if let boardDetailResult = vm.boardDetailInfo {
                        RoundedRectangle(cornerRadius: 5)
                            .strokeBorder(Color("LightGray"))
                            .frame(height: 70)
                            .background(.white)
                            .overlay(
                                VStack{
                                    HStack(spacing: 2){
                                        Image(systemName: "clock")
                                        Text("이용시간")
                                            .fontWeight(.bold)
                                        Spacer()
                                    }
                                    .padding(.horizontal)
                                    Text(boardDetailResult.storeTime)
                                        .padding(.bottom)
                                }
                            )
                            .padding(.horizontal)
                        RoundedRectangle(cornerRadius: 5)
                            .strokeBorder(Color("LightGray"))
                            .frame(height: 70)
                            .background(.white)
                            .overlay(
                                VStack{
                                    HStack(spacing: 2){
                                        Image(systemName: "phone")
                                        Text("전화번호")
                                            .fontWeight(.bold)
                                        Spacer()
                                    }
                                    .padding(.horizontal)
                                    Text(boardDetailResult.storeTel)
                                        .padding(.bottom)
                                }
                            )
                            .padding(.horizontal)
                        ZStack{
                            RoundedRectangle(cornerRadius: 5)
                                .strokeBorder(Color("LightGray"))
                                .frame(minHeight: 150)
                                .background(.white)
                                .padding(.horizontal)
                            VStack{
                                HStack{
                                    Text("메뉴")
                                        .fontWeight(.bold)
                                        .padding(.horizontal)
                                        .padding(.top)
                                    Spacer()
                                }
                                VStack {
                                    ForEach(showAllDishes ? boardDetailResult.menus : Array(boardDetailResult.menus.prefix(2)), id: \.menuIndex) { menu in
                                        
                                        HStack {
                                            Spacer()
                                            Text(menu.menuName)
                                            Spacer()
                                            Spacer()
                                            Text("\(menu.menuPrice)원")
                                                .foregroundColor(Color("CustomOrange"))
                                            Button(action: {
                                                vm.fetchMenuLike(menu.menuIndex)
                                            }) {
                                                RoundedRectangle(cornerRadius: 5)
                                                    .strokeBorder(Color("LightGray"))
                                                    .frame(width: 60, height: 30)
                                                    .background(Color.white)
                                                    .overlay(
                                                        HStack {
                                                            Image(systemName: menu.isLiked ? "heart.fill" : "heart")
                                                            Text("\(menu.menuLikes)")
                                                        }
                                                            .foregroundColor(Color("CustomOrange"))
                                                    )
                                            }
                                            .padding(.horizontal)
                                        }
                                    } 
                                }
                                HStack{
                                    Spacer()
                                    if boardDetailResult.menus.count > 2 {
                                        Button(action: {showAllDishes.toggle()}){
                                            Text (showAllDishes ? "닫기" : "더보기")
                                                .font(.system(size: 12))
                                                .foregroundColor(.black)
                                                .underline()
                                            
                                        }
                                        .padding(.horizontal)
                                        .padding(.bottom)
                                    }
                                }
                            }
                            .padding(.horizontal)
                        }
                        HStack{
                            NavigationLink(destination: {ReportView()}) {
                                HStack(spacing: 0){
                                    Image("HandPalm")
                                    Text("제보하러가기")
                                        .underline()
                                        .foregroundColor(.black)
                                }
                            }.padding()
                            Spacer()
                        }
                        .padding()
                    }
                }
            }
        }
    }
}
