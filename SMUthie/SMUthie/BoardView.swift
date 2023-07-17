//
//  ListView.swift
//  SMUthie
//
//  Created by Phil on 2023/02/28.
//

import SwiftUI

struct BoardView: View {
    @State var imageChanged = true
    @State private var isCafeSelected = false

    
    var body: some View {
        NavigationView {
            ScrollView{
                VStack{
                    Text("리뷰게시판")
                        .font(.system(size: 24))
                        .foregroundColor(Color("CustomOrange"))
                        .padding(1)
                    Text("자유롭게 리뷰를 달아주세요 :)")
                        .font(.system(size: 15))
                        .foregroundColor(Color("LightGray"))
                    HStack {
                        Spacer()
                        Button(action: {isCafeSelected = false}){
                            RoundedRectangle(cornerRadius: 5)
                                .strokeBorder(Color("BorderLine"))
                                .frame(width: 80,height: 30)
                                .background(isCafeSelected ? .white : Color("BorderLine"))
                                .cornerRadius(5)
                                .overlay(
                                    Text("음식점")
                                        .foregroundColor(Color("CustomOrange"))
                                )
                        }
                        Button(action: {isCafeSelected = true}){
                            RoundedRectangle(cornerRadius: 5)
                                .strokeBorder(Color("BorderLine"))
                                .frame(width: 80,height: 30)
                                .background(isCafeSelected ? Color("BorderLine") : .white)
                                .cornerRadius(5)
                                .foregroundColor(isCafeSelected ? Color("BorderLine") : .white )
                                .overlay(
                                    Text("카페")
                                        .foregroundColor(Color("CustomOrange"))
                                )
                            
                        }
                    }
                    .padding(.horizontal)
                    RoundedRectangle(cornerRadius: 5)
                        .strokeBorder(Color("BorderLine"))
                        .background(.white)
                        .frame(minHeight: 50)
                        .overlay(
                            HStack {
                                Text("#학교식당")
                                    .font(.system(size: 16))
                                    .foregroundColor(Color("CustomBlue"))
                                    .padding(.horizontal)
                                Button(action: {}){
                                    Text("학식 게시판")
                                        .font(.system(size: 16))
                                        .foregroundColor(Color("CustomGray"))
                                        .underline()
                                }
                                .padding(.horizontal)
                            }
                        )
                        .padding(.horizontal)
                    
                    RoundedRectangle(cornerRadius: 5)
                        .strokeBorder(Color("BorderLine"))
                        .background(.white)
                        .frame(minHeight: 50)
                        .overlay(
                            HStack {
                                Text("#부대찌개")
                                    .font(.system(size: 16))
                                    .foregroundColor(Color("CustomBlue"))
                                    .padding(.horizontal)
                                NavigationLink(destination: BoardPageView()) {
                                    Text("부대통령 게시판")
                                        .font(.system(size: 16))
                                        .foregroundColor(Color("CustomGray"))
                                        .underline()
                                }
                                .padding(.horizontal)
                            }
                        )
                        .padding(.horizontal)
                }
                .fontWeight(.semibold)
            }
        }
    }
}

struct ListView_Previews: PreviewProvider {
    static var previews: some View {
        BoardView()
    }
}
