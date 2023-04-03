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
                    ///큰 플러스 버튼
//                    let image = Image("")
//                        .withConfiguration(UIImage.SymbolConfiguration(pointSize: 30))
//                    Image(uiImage: image ?? UIImage())
//                        .resizable()
//                        .scaledToFit()
//                        .foregroundColor(Color("CustomOrange"))
                    
                    CustomTabItemView(imageName: "Smoong", imageSize: 40)
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
