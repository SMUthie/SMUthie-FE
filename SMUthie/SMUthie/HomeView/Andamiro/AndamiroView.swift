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
            AndamiroBlockView(menu: viewModel.menu[viewModel.currentMenuItemIndex],viewModel: viewModel)
        }
        .padding(.horizontal)
    }
}

struct AndamiroBlockView: View {
    let menu: AndamiroMenu
    let viewModel : AndamiroViewModel
    var body: some View {
        VStack {
            HStack {
                Text("안다미로")
                    .font(.title2)
                    .foregroundColor(Color("CustomOrange"))
                    .padding(.horizontal)
                Text(menu.price)
                    .foregroundColor(.gray)
                Spacer()
            }
            .padding(.vertical,8)
            .fontWeight(.heavy)
            
            HStack {
                Spacer()
                Spacer()
                Image(systemName: menu.image)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 150, height: 150)
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
                    Text(menu.name)
                        .fontWeight(.heavy)
                        .font(.title3)
                        .multilineTextAlignment(.center)
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
