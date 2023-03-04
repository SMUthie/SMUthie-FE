//
//  RecommendView.swift
//  SMUthie
//
//  Created by Phil on 2023/03/02.
//

import SwiftUI

struct RecommendView: View {
    
    @ObservedObject var viewModel = RecommendViewModel()
    
    var body: some View {
        HStack{
            ForEach(viewModel.placeDB.shuffled().prefix(3),id: \.name) { place in
                HStack{
                    VStack {
                        Image(systemName: place.image)
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 100, height: 100)
                        Text(place.name)
                            .font(.caption)
                    }
                }
            }
        }
    }
}

struct RecommendView_Previews: PreviewProvider {
    static var previews: some View {
        RecommendView()
    }
}
