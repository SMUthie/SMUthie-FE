//
//  AndamiroView.swift
//  SMUthie
//
//  Created by Phil on 2023/03/01.
//

import SwiftUI

struct AndamiroView: View {
    @ObservedObject var viewModel = AndamiroViewModel()
    
    var body: some View {
        VStack {
            if viewModel.menus.indices.contains(viewModel.currentMenuItemIndex) {
                AndamiroBlockView(menu: viewModel.menus[viewModel.currentMenuItemIndex], viewModel: viewModel)
            } else {
                // 메뉴가 없거나 인덱스가 범위를 벗어난 경우 표시할 뷰
                Text("메뉴가 없습니다.")
            }
        }
        .padding(.horizontal)
    }
}

struct AndamiroBlockView: View {
    let menu: AndamiroResult
    let viewModel : AndamiroViewModel
    var body: some View {
        VStack {
            HStack {
                Text("안다미로")
                    .font(.title2)
                    .foregroundColor(Color("CustomOrange"))
                    .padding(.leading)
                Text("가격 "+String(menu.price)+"원")
                    .foregroundColor(Color("CustomGray"))
                Spacer()
            }
            .padding(.vertical,8)
            .fontWeight(.heavy)
            
            HStack {
                Spacer()
                Spacer()
                AsyncImage(urlString: menu.imageURL)
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 200, height: 200)
                    .padding(.horizontal)
                Spacer()
                
                Button(action: {
                    self.viewModel.showNextMenuItem()
                }) {
                    Image(systemName: "chevron.compact.right")
                        .font(.system(size:40))
                        .accentColor(Color("CustomOrange"))
                }
                .padding(.trailing, 17)
            }
            HStack{
                    Text(menu.menuName)
                        .fontWeight(.heavy)
                        .font(.title3)
                        .multilineTextAlignment(.center)
            }
            HStack{
                ZStack{
                    Image("Vector")
                    HStack(spacing : 0){
                        Image("ThumbsUp.fill")
                        Text("\(menu.likes)")
                            .foregroundColor(.red)
                    }
                }
                Text(menu.comment ?? "")
                    .fontWeight(.heavy)
                    .font(.title3)
                    .padding(.top)
                    .foregroundColor(Color("CustomGray"))
            }
        }
        .padding(.vertical)
        .background(Color.white)
        .cornerRadius(20)
        .overlay(RoundedRectangle(cornerRadius: 20).stroke(Color("BorderLine"), lineWidth: 1))
        .shadow(radius: 4)
    }
}



struct AndamiroView_Previews: PreviewProvider {
    static var previews: some View {
        AndamiroView()
    }
}
