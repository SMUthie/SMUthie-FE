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
                    ///큰 플러스 버튼
//                    let image = UIImage(systemName: "plus.circle.fill")?
//                        .withConfiguration(UIImage.SymbolConfiguration(pointSize: 40))
//                    Image(uiImage: image ?? UIImage())
//                        .resizable()
//                        .scaledToFit()
//                        .foregroundColor(Color("CustomOrange"))
                    
                    ///작은 플러스 버튼
                    Image("PlusCircle")
                        .resizable()
                        .scaledToFit()

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


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
