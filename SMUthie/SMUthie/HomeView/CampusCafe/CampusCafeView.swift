//
//  CafeBlockView.swift
//  SMUthie
//
//  Created by Phil on 2023/02/28.
//

import SwiftUI
struct CampusCafeView: View {
    @ObservedObject var viewModel = CampusCafeViewModel()
    
    var body: some View {
        VStack {
            HStack {
                Text("교내 카페 정보")
                    .font(.title2)
                    .foregroundColor(Color("customOrange"))
                    .fontWeight(.heavy)
                Spacer()
            }.padding(.vertical,8)
            ForEach(Array(viewModel.cafes.enumerated()), id: \.element.name) { (index, cafe) in
                CampusCafeBlockView(cafe: cafe, cafeIndex: index)
            }
        }
        .padding()
        .background(Color.white)
        .cornerRadius(20)
        .overlay(RoundedRectangle(cornerRadius: 20).stroke(Color("borderLine"), lineWidth: 1))
        .shadow(radius: 4)
        .padding(.horizontal)
    }
}


struct CampusCafeBlockView: View {
    let cafe: CampusCafe
    let cafeIndex: Int
    @State private var showingModal = false
    
    var body: some View {
        HStack {
            Spacer()
            VStack {
                Text(cafe.name)
                    .bold()
                Text(cafe.description)
            }
            Spacer()
            Button(action: {
                showingModal = true
            }) {
                Image("menuButton")
            }
            .sheet(isPresented: $showingModal) {
                CampusCafeMenuModalView(cafeIndex:cafeIndex)
            }
        }
        .font(.title3)
        .padding(10)
    }
}




struct CampusCafeView_Previews: PreviewProvider {
    static var previews: some View {
        CampusCafeView()
    }
}
