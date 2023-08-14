//
//  CafeteriaView.swift
//  SMUthie
//
//  Created by Phil on 2023/02/28.
//

import SwiftUI

struct CafeteriaView: View {
    @ObservedObject var viewModel = CafeteriaViewModel()
    
    var body: some View {
        VStack {
            HStack(spacing: 62) {
                Text(viewModel.cafeteria[viewModel.currentMenuItemIndex].0.date)
                Text("오늘의 학식")
                Button(action: {
                    self.viewModel.showNextMenuItem()
                }) {
                    Image(systemName: "chevron.right")
                }
            }
            .fontWeight(.heavy)
            .font(.title3)
            .frame(width: 345, height: 30)
            .foregroundColor(.white)
            .background(Color("CustomOrange"))
            .cornerRadius(5)
            .padding(.bottom,20)
            CafeteriaBlockView(cafeteria: viewModel.cafeteria[viewModel.currentMenuItemIndex].0)
                .padding(.bottom,10)
            CafeteriaBlockView(cafeteria: viewModel.cafeteria[viewModel.currentMenuItemIndex].1)
        }
        
        .padding(.horizontal)
    }
}

struct CafeteriaBlockView: View {
    let cafeteria: Cafeteria

    var body: some View {
        VStack {
            HStack {
                Text(cafeteria.classification)
                    .font(.title2)
                    .foregroundColor(Color("CustomOrange"))
                    .padding(.horizontal)
                Text(cafeteria.price)
                    .foregroundColor(.gray)
                Spacer()
            }
            .padding(.vertical,8)
            .fontWeight(.heavy)
            
            Text(cafeteria.menu)
                .multilineTextAlignment(.center)
                .font(.title3)
            Spacer()
        }
        .padding(.vertical)
        .background(Color.white)
        .cornerRadius(20)
        .overlay(RoundedRectangle(cornerRadius: 20).stroke(Color("BorderLine"), lineWidth: 1))
        .shadow(radius: 4)
    }
}

struct CafeteriaView_Previews: PreviewProvider {
    static var previews: some View {
        CafeteriaView()
    }
}
