//
//  HomeView.swift
//  SMUthie
//
//  Created by Phil on 2023/02/28.
//
import SwiftUIPullToRefresh
import SwiftUI

struct HomeView: View {
    var body: some View {
        NavigationView {
            GeometryReader { geometry in
                ScrollView{
                    VStack(spacing: 20) {
                    CafeteriaView()
                    AndamiroView()
                    CampusCafeView()
                    }
                }
            }
            .navigationBarTitle("슴우디")
        }
    }
}






struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
