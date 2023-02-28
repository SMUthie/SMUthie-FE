//
//  HomeView.swift
//  SMUthie
//
//  Created by Phil on 2023/02/28.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        NavigationView {
            GeometryReader { geometry in
                ScrollView{
                    VStack(spacing: 20) {
                    CafeTeriaBlockView()
                        .frame( height: geometry.size.height / 2)
                    AndamiroBlockView()
                        .frame(width: geometry.size.width , height: geometry.size.height / 4)
                    CampusCafeBlockView()
                        .frame(width: geometry.size.width , height: geometry.size.height / 4)
                    }
                }
            }
            .navigationBarTitle("슴우디")
        }
    }
}

struct CafeTeriaBlockView: View {
    let title: String = "오늘의 학식"
    var body: some View {
        VStack {
            HStack {
                Text(title)
                    .alignmentGuide(.leading, computeValue: { _ in 0 })
                    .font(.headline)
                    .padding(.top)
                Spacer()
            }
            Spacer()
        }
        .background(Color.white)
        .cornerRadius(20)
        .shadow(radius: 5)
    }
}
struct AndamiroBlockView: View {
    var title: String = "안다미로                                "
    var body: some View {
        VStack {
            HStack {
                Text(title)
                    .alignmentGuide(.leading, computeValue: { _ in 0 })
                    .font(.headline)
                    .padding(.top)
                Spacer()
            }
            Spacer()
        }
        .background(Color.white)
        .cornerRadius(20)
        .shadow(radius: 5)
    }
}
struct CampusCafeBlockView: View {
    var title: String = "교내 카페 정보"
    var body: some View {
        VStack {
            HStack {
                Text(title)
                    .alignmentGuide(.leading, computeValue: { _ in 0 })
                    .font(.headline)
                    .padding(.top)
                Spacer()
            }
            Spacer()
        }
        .background(Color.white)
        .cornerRadius(20)
        .shadow(radius: 5)
    }
}


struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
