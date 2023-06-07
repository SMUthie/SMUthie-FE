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
                    Label("홈 화면", systemImage: "fork.knife")
                }
            MapView()
                .tabItem {
                    Label("지도로 보기", systemImage: "signpost.right")
                }
            PlusView()
                .tabItem {
                    CustomTabItemView(imageName: "Smoong", imageSize: 40)
                }
            ListView()
                .tabItem {
                    Label("가게 리스트", systemImage: "list.bullet")
                }
            MyPageView()
                .tabItem {
                    Label("내 정보", systemImage: "person.crop.circle.fill")
                }
        }.accentColor(Color("CustomOrange"))
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
