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
                } else if title == "회원탈퇴" {
                    WithdrawalView()
                } else if title == "현재 버전 11.40.1" {
                    
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
            .frame(height: 40)
            .background(Color.white)
            .cornerRadius(10)
            .padding(.horizontal)
            .padding(.vertical, 5)
        Divider()
        }
}
