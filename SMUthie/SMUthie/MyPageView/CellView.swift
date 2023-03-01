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
            Button(action: {
                if title == "공지사항" {
                    // 공지사항 버튼 클릭 시 처리할 로직
                } else if title == "피드백 작성" {
                    // 피드백 작성 버튼 클릭 시 처리할 로직
                } else if title == "회원탈퇴" {
                    // 회원탈퇴 버튼 클릭 시 처리할 로직
                }
            }) {
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

