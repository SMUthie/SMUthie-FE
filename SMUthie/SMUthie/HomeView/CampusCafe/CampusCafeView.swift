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
            ForEach(viewModel.cafes, id: \.name) { cafe in
                CampusCafeBlockView(cafe: cafe)
            }
        }
        .padding(.horizontal)
    }
}


struct CampusCafeBlockView: View {
    let cafe: CampusCafe

    var body: some View {
        VStack {
            HStack {
                Spacer()
                Spacer()
                Text(cafe.name)
                    .font(.headline)
                Spacer()
                Button(action: {
                    // do something
                }) {
                    Image(systemName: "info.circle")
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
