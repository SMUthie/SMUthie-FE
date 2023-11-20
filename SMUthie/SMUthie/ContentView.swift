//
//  ContentView.swift
//  SMUthie
//
//  Created by 김유빈 on 2023/02/26.
//

import SwiftUI

struct ContentView: View {
    @State public var selectedTab: Int = 0
    @State private var smoongSelected: Bool = false
    @State private var showOnboarding = true
    @State private var showLoginPage = false
    @State private var isLoggedin = false
    @State private var schoolID: Int = 0
    @State private var username: String = ""

    var body: some View {
        OnboardingView()
            .onAppear {
                DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                    showLoginPage = true
                }
            }
            .fullScreenCover(isPresented: $showLoginPage) {
                LoginView(isLoggedin: $isLoggedin, showLoginPage: $showLoginPage, studentID: $schoolID, username: $username)
            }
            .fullScreenCover(isPresented: $isLoggedin) {
                MainTabView(selectedTab: $selectedTab, smoongSelected: $smoongSelected, studentID: $schoolID, isPresented: $isLoggedin, showingLoginView: $showLoginPage, username: $username)
            }
    }
}

struct OnboardingView: View {
    var body: some View {
        VStack {
            Image("Login")
                .padding()
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

struct MainTabView: View {
    @Binding var selectedTab: Int
    @Binding var smoongSelected: Bool
    @Binding var studentID: Int
    @Binding var isPresented: Bool
    @Binding var showingLoginView: Bool
    @Binding var username: String
    
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
            RecommendationView()
                .tabItem {
                    CustomTabItemView(imageName: smoongSelected ? "Smoong" : "SmoongBlack", imageSize: 40)
                }
                .tag(2)
            BoardView()
                .tabItem {
                    Label("가게 리스트", systemImage: "list.bullet")
                }
                .tag(3)
            MyPageView(goBackLoginView: $isPresented, showingLoginView: $showingLoginView, username: $username, schoolId: studentID)
                .tabItem {
                    Label("내 정보", systemImage: "person.crop.circle.fill")
                }
                .tag(4)
        }
        .accentColor(Color("CustomOrange"))
        .onChange(of: selectedTab) { newTab in
            if newTab == 2 {
                smoongSelected = true
            } else {
                smoongSelected = false
            }
        }
    }
}
