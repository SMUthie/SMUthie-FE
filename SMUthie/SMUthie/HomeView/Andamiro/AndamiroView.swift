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
            HStack {
                Text("안다미로")
                    .font(.title2)
                Spacer()
            }
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
            Image(systemName: menu.image)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 200, height: 200)
            HStack{
                Spacer()
                Spacer()
                VStack{
                    Text(menu.name)
                        .font(.largeTitle)
                    Text(menu.price)
                        .font(.title)
                }
                Spacer()
                Button(action: {
                    self.viewModel.showNextMenuItem()
                }) {
                    Image(systemName: "chevron.right")
                }
                Spacer()
            }
        }
        .padding(.vertical)
        .background(Color.white)
        .cornerRadius(20)
        .shadow(radius: 5)
    }
}



struct AndamiroView_Previews: PreviewProvider {
    static var previews: some View {
        AndamiroView()
    }
}
