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
                Spacer()
            }
            ForEach(Array(viewModel.cafes.enumerated()), id: \.element.name) { (index, cafe) in
                CampusCafeBlockView(cafe: cafe, cafeIndex: index)
            }
        }
        .padding(.horizontal)
    }
}


struct CampusCafeBlockView: View {
    let cafe: CampusCafe
    let cafeIndex: Int
    @State private var showingModal = false
    
    var body: some View {
        VStack {
            HStack {
                Spacer()
                Spacer()
                Text(cafe.name)
                    .font(.headline)
                Spacer()
                Button(action: {
                    showingModal = true
                }) {
                    Image(systemName: "info.circle")
                }
                .sheet(isPresented: $showingModal) {
                    CampusCafeMenuModalView(cafeIndex:cafeIndex)
                }
                Spacer()
            }
            Text(cafe.description)
        }
        .padding(.vertical)
        .background(Color.white)
        .cornerRadius(20)
        .shadow(radius: 5)
    }
}




struct CampusCafeView_Previews: PreviewProvider {
    static var previews: some View {
        CampusCafeView()
    }
}
