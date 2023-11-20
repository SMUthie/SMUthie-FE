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
            HStack {
                if viewModel.cafeteriaMenus.indices.contains(viewModel.currentMenuItemIndex),
                   let firstMenuDate = viewModel.cafeteriaMenus[viewModel.currentMenuItemIndex].first?.date {
                    Text(firstMenuDate.convertDateFormat(from: "yyyy-MM-dd", to: "MM/dd"))
                        .padding(.leading,5)
                } else {
                    Text("날짜 정보 없음")
                }
                Spacer()
                Text("오늘의 학식")
                    .padding(.horizontal)
                Spacer()
                Button(action: {
                    self.viewModel.showNextMenuItem()
                }) {
                    Image(systemName: "chevron.right")
                }
                .padding(.horizontal)
            }
            
            .fontWeight(.heavy)
            .font(.title3)
            .frame(minWidth: 345, minHeight: 30)
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
                let parts = splitMealName(cafeteria.mealName)
                Text(parts.0)
                    .font(.title2)
                    .foregroundColor(Color("CustomOrange"))
                    .padding(.leading)
                Text("가격 "+cafeteria.price)
                    .foregroundColor(.gray)
                Spacer()
                Text(parts.1)
                    .foregroundColor(Color("LightGray"))
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
    private func splitMealName(_ mealName: String) -> (String, String) {
            let numberIndex = mealName.firstIndex(where: { $0.isNumber }) ?? mealName.endIndex
            let firstPart = String(mealName[..<numberIndex])
            let secondPart = String(mealName[numberIndex...])
            return (firstPart, secondPart)
        }
}

struct CafeteriaView_Previews: PreviewProvider {
    static var previews: some View {
        CafeteriaView()
    }
}
