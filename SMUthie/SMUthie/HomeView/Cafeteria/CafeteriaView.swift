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
                Text("오늘의 학식")
                    .font(.title2)
                Spacer()
            }
            ForEach(viewModel.cafeteria, id: \.classification) { cafeteria in
                CafeteriaBlockView(cafeteria: cafeteria)
            }
        }
        .padding(.horizontal)
    }
}

struct CafeteriaBlockView: View {
    let cafeteria: Cafeteria

    var body: some View {
        VStack {
            HStack {
                Spacer()
                Text(cafeteria.classification)
                    .font(.title2)
                    .bold()
                Spacer()
                Text(cafeteria.price)
                    .foregroundColor(.gray)
                Spacer()
            }
            Text(cafeteria.menu)
            Spacer()
        }
        .padding(.vertical)
        .background(Color.white)
        .cornerRadius(20)
        .shadow(radius: 5)
    }
}

struct CafeteriaView_Previews: PreviewProvider {
    static var previews: some View {
        CafeteriaView()
    }
}
