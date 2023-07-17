//
//  BoardPageView.swift
//  SMUthie
//
//  Created by Phil on 2023/07/10.
//

import SwiftUI

struct BoardPageView: View {
    var body: some View {
        ScrollView{
            VStack{
                HStack(spacing:1) {
                    Image("Food1")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                    
                    VStack(spacing:1){
                        Image("Food2")
                            .resizable()
                            .frame(height: 122)
                        Image("Food3")
                            .resizable()
                            .frame(height: 122)
                    }
                }
                Text("부대통령 게시판")
                    .font(.system(size: 24))
                    .foregroundColor(Color("CustomOrange"))
                    .padding(.top)
                
                BoardInformationView()
                HStack {
                    Button(action: {}){
                        
                            Image("AddReviewBtn")
   
                    }
                    Spacer()
                }
            }
        }
    }
}

struct BoardPageView_Previews: PreviewProvider {
    static var previews: some View {
        BoardPageView()
    }
}
