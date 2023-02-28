//
//  ContentView.swift
//  SMUthie
//
//  Created by 김유빈 on 2023/02/26.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            HomeView()
                .tabItem {
                    Label("Home", systemImage: "house.fill")
                }
            MapView()
                .tabItem {
                    Label("Map", systemImage: "map.fill")
                }
            PlusView()
                .tabItem {
                    Label("Plus", systemImage: "plus.circle.fill")
                }
            ListView()
                .tabItem {
                    Label("List", systemImage: "list.bullet")
                }
            MyPageView()
                .tabItem {
                    Label("My Page", systemImage: "person.crop.circle.fill")
                }
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
