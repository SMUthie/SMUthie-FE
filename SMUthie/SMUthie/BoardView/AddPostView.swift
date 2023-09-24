//
//  AddPostView.swift
//  SMUthie
//
//  Created by Phil on 2023/09/24.
//

import SwiftUI

struct AddPostView: View {
    @Environment(\.dismiss) private var dismiss
    @State private var text: String = ""
    @State private var hashtag: String = ""
    @State private var hasContent = false
    
    var body: some View {
        VStack{
            HStack{
                Button(action: {dismiss()}){
                    Image(systemName: "chevron.left")
                        .foregroundStyle(.black)
                        .font(.system(size: 20))
                }
                Spacer()
                Text("게시글 쓰기")
                    .font(.system(size: 24,weight: .heavy))
                    .foregroundColor(Color("CustomOrange"))
                Spacer()
                Button(action: {}){
                    Image(systemName: "camera")
                        .bold()
                        .foregroundColor(Color("CustomOrange"))
                }
            }
            .padding(.horizontal)
            Divider()
                .background(.black)
                .frame(height: 7)
                .padding(.horizontal,7)
            TextField("내용을 입력하세요", text: $text)
                           .padding()
                           .textFieldStyle(.plain)
                           .padding(.bottom, 200)
                           .frame(minHeight: 250)
            Divider()
                .background(Color("DividerGray"))
                .frame(height: 5)
                .padding(.horizontal,7)
            TextField("# 해시태그를 추가하세요", text: $hashtag)
                .padding(.horizontal,7)
                .textFieldStyle(.plain)
            Divider()
                .background(.gray)
                .frame(height: 7)
                .padding(.horizontal,7)
            Text("슴우디는 상명대학교 재학생 누구나 유용하게 사용할 수 있는 리뷰 문화를 만들기 위해 일부 게시판에 한해 커뮤니티 이용규칙을 제정하여 운영하고 있습니다. \n\n위반 시 게시물이 삭제 되고 서비스 이용이 일정 기간 제한될 수 있습니다. \n\n아래의 이 게시판에 해당하는 핵심 내용에 대한 사항이 존재하니 게시물 작성 전 커뮤니티 이용규칙을 반드시 확인하시길 바랍니다.\n\n리뷰 게시판은 사진 첨부 필수입니다. 무분별한 리뷰를 막기 위함이니 해당 음식점 및 카페와 관련된 사진 첨부를 부탁드립니다.\n\n")
                .font(.system(size: 12,weight: .bold))
              .foregroundColor(Color("LightGray"))
              .frame(width: 360, height: 165, alignment: .topLeading)
            Spacer()
            Button(action: {}){
                RoundedRectangle(cornerRadius: 5)
                    .foregroundColor(hasContent ? Color("CustomOrange") : Color("LightGray") )
                    .frame(height:60)
                    .overlay(
                        Text("작성 완료")
                            .font(.system(size: 20,weight:.heavy))
                            .foregroundColor(hasContent ? Color(.white) : Color("CustomGray") )
                    )
            }.disabled(!hasContent)
        }
            .navigationBarBackButtonHidden(true)
    }
}

#Preview {
    AddPostView()
}
