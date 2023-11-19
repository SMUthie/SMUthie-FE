//
//  CellView.swift
//  SMUthie
//
//  Created by Phil on 2023/03/02.
//

import SwiftUI

struct CellView: View {
    var title: String
    var body: some View {
        NavigationLink(destination:{
            if title == "공지사항" {
                AnnouncementView()
            } else {
            }
        }){
            HStack {
                Text(title)
                  .font(Font.custom("NanumSquareRoundOTF", size: 15))
                  .foregroundColor(.black)
                Spacer()
                Image(systemName: "chevron.right")
                    .foregroundColor(.primary)
            }
            .padding(.horizontal)
        }
        .frame(height: 40)
        .padding(.horizontal)
        .padding(.vertical, 5)
        Divider()
    }
}
