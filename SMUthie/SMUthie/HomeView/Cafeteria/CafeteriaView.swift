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
                if viewModel.cafeteriaMenus.indices.contains(viewModel.currentMenuItemIndex),
                   let firstMenuDate = viewModel.cafeteriaMenus[viewModel.currentMenuItemIndex].first?.date {
                    Text(firstMenuDate.convertDateFormat(from: "yyyy-MM-dd", to: "MM/dd"))
                } else {
                    Text("날짜 정보 없음")
                }
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
            if viewModel.cafeteriaMenus.indices.contains(viewModel.currentMenuItemIndex) {
                let dayMenus = viewModel.cafeteriaMenus[viewModel.currentMenuItemIndex]
                ForEach(dayMenus, id: \.self) { menu in
                    CafeteriaBlockView(cafeteria: menu)
                }
            }
        }
        
        .padding(.horizontal)
    }
}

struct CafeteriaBlockView: View {
    let cafeteria: CafeteriaResult

    var body: some View {
        VStack {
            HStack {
                Text(cafeteria.mealName)
                    .font(.title2)
                    .foregroundColor(Color("CustomOrange"))
                    .padding(.horizontal)
                Text(cafeteria.price)
                    .foregroundColor(.gray)
                Spacer()
            }
            .padding(.vertical,8)
            .fontWeight(.heavy)
            
            Text(cafeteria.mealDescription)
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
