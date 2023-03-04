//
//  HomeView.swift
//  SMUthie
//
//  Created by Phil on 2023/02/28.
//

import SwiftUI

struct HomeView: View {
    @Environment(\.font) var font
    var body: some View {
        NavigationView {
            GeometryReader { geometry in
                ScrollView{
                    VStack(spacing: 20) {
                        CafeteriaView()
                        Divider()
                        AndamiroView()
                        CampusCafeView()
                    }.padding(.vertical,20)
                }
            } .toolbar {
                    ToolbarItem(placement: .navigationBarLeading) {
                        Image("logo")
                            .scaledToFit()
                    }
                }
        }
    }
}


struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
