//
//  HomeView.swift
//  SMUthie
//
//  Created by Phil on 2023/02/28.
//
import SwiftUIPullToRefresh
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
                            .frame(minHeight: 2)
                            .background(Color("DividerGray"))
                        AndamiroView()
                        CampusCafeView()
                    }.padding(.vertical,20)
                }
            } .toolbar {
                    ToolbarItem(placement: .navigationBarLeading) {
                        Image("Logo")
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
