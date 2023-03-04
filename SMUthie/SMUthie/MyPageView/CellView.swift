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
            Divider()
            NavigationLink(destination:{
                if title == "공지사항" {
                    AnnouncementView()
                } else if title == "피드백 작성" {
                    FeedbackView()
                } else if title == "회원탈퇴" {
                    WithdrawalView()
                }
            }){
                HStack {
                    Text(title)
                        .font(.headline)
                        .foregroundColor(.primary)
                    Spacer()
                    Image(systemName: "chevron.right")
                        .foregroundColor(.secondary)
                }
                .padding(.horizontal)
            }
            .frame(height: 50)
            .background(Color.white)
            .cornerRadius(10)
            .padding(.horizontal)
            .padding(.vertical, 5)
        Divider()
        }
}

