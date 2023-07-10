//
//  ContentView.swift
//  SMUthie
//
//  Created by 김유빈 on 2023/02/26.
//

import SwiftUI


struct ContentView: View {
    @State private var selectedTab: Int = 0
    @State private var smoongSelected: Bool = false
    
    var body: some View {
        TabView(selection: $selectedTab) {
            HomeView()
                .tabItem {
                    Label("홈 화면", systemImage: "fork.knife")
                }
                .tag(0)
            MapView()
                .tabItem {
                    Label("지도로 보기", systemImage: "signpost.right")
                }
                .tag(1)
            PlusView()
                .tabItem {
                    CustomTabItemView(imageName: smoongSelected ? "Smoong" : "SmoongBlack", imageSize: 40)
                }
                .tag(2)
            
            BoardView()
                .tabItem {
                    Label("가게 리스트", systemImage: "list.bullet")
                }
                .tag(3)
            MyPageView()
                .tabItem {
                    Label("내 정보", systemImage: "person.crop.circle.fill")
                }
                .tag(4)
        }
        .accentColor(Color("CustomOrange"))
        .onChange(of: selectedTab) { newTab in
            if newTab == 2 {
                // The third tab was pressed
                smoongSelected = true
            } else {
                smoongSelected = false
            }
        }
    }
}

struct CustomTabItemView: View {
    let imageName: String
    let imageSize: CGFloat
    
    var body: some View {
        VStack {
            Image(imageName)
                .resizable()
                .frame(width: imageSize, height: imageSize)
            Text("수뭉이의 추천!")
                
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
