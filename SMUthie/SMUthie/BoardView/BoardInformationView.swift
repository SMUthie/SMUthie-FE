//
//  BoardInformationView.swift
//  SMUthie
//
//  Created by Phil on 2023/07/16.
//

import SwiftUI

struct BoardInformationView: View {
    @StateObject var vm = BoardViewModel()
    @State private var isInfOpened = false
    @State private var showAllDishes = false
    
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
                                Text("09: 00 ~ 21: 00")
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
                                Text("02 - 287 - 1384")
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
                                ForEach(showAllDishes ? vm.dishes.indices : (0..<min(2, vm.dishes.count)), id: \.self) { index in
                                    HStack {
                                        Spacer()
                                        Text(vm.dishes[index].name)
                                        
                                        Spacer()
                                        Spacer()
                                        Text("\(vm.dishes[index].price)원")
                                            .foregroundColor(Color("CustomOrange"))
                                        Button(action: {vm.dishes[index].isLiked.toggle()}) {
                                            RoundedRectangle(cornerRadius: 5)
                                                .strokeBorder(Color("LightGray"))
                                                .frame(width: 60, height: 30)
                                                .background(Color.white)
                                                .overlay(
                                                    HStack {
                                                        Image(systemName: vm.dishes[index].isLiked ? "heart.fill" : "heart")
                                                        Text("\(vm.dishes[index].likes)")
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
                                if vm.dishes.count > 2 {
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
                        NavigationLink(destination: {}) {
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






struct BoardInformationView_Previews: PreviewProvider {
    static var previews: some View {
        BoardInformationView()
    }
}
