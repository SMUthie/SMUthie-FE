//
//  AddPostView.swift
//  SMUthie
//
//  Created by Phil on 2023/09/24.
//

import SwiftUI

struct AddReviewView: View {
    @Environment(\.dismiss) private var dismiss
    @State private var text: String = ""
    @State private var hashtag: String = ""
    @State private var hasContent = false
    @State private var showActionSheet = false
    @State private var showImagePicker = false
    @State private var pickerSourceType: UIImagePickerController.SourceType = .photoLibrary
    @State private var images: [UIImage] = []
    let storeIdx : Int
    @ObservedObject var vm : BoardPageViewModel
    
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
                Button(action: {
                    self.showActionSheet = true
                }) {
                    Image(systemName: "camera")
                        .bold()
                        .foregroundColor(Color("CustomOrange"))
                }
                .actionSheet(isPresented: $showActionSheet) {
                    ActionSheet(title: Text("이미지 선택"), message: Text("사진을 찍거나 앨범에서 선택하세요"), buttons: [
                        .default(Text("카메라")) {
                            self.pickerSourceType = .camera
                            self.showImagePicker = true
                        },
                        .default(Text("앨범")) {
                            self.pickerSourceType = .photoLibrary
                            self.showImagePicker = true
                        },
                        .cancel()
                    ])
                }
                .sheet(isPresented: $showImagePicker) {
                    ImagePicker(selectedImages: $images, sourceType: pickerSourceType)
                }
                .padding(.horizontal)
            }
            Divider()
                .background(.black)
                .frame(height: 7)
                .padding(.horizontal,7)
            TextField("내용을 입력하세요", text: $text)
                .padding()
                .textFieldStyle(.plain)
                .padding(.bottom, 200)
                .frame(minHeight: 250)
                .onChange(of: text) { newValue in
                    hasContent = newValue.count >= 5
                }
            ScrollView(.horizontal, showsIndicators: false) {
                HStack {
                    ForEach(images.indices, id: \.self) { index in
                        ZStack(alignment: .topTrailing) {
                            Image(uiImage: images[index])
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(width: 100, height: 100)
                                .clipped()
                                .cornerRadius(10)
                            
                            // 삭제 버튼
                            Button(action: {
                                images.remove(at: index)
                            }) {
                                Image(systemName: "xmark.circle.fill")
                                    .foregroundColor(Color("CustomOrange"))
                                    .padding(5)
                            }
                        }
                    }
                }
                .padding(.horizontal)
            }
            Divider()
                .background(Color("DividerGray"))
                .frame(height: 5)
                .padding(.horizontal,7)
            Picker(hashtag.isEmpty ? "해시태그를 선택하세요" : hashtag, selection: $hashtag) {
                if let boardDetailInfo = vm.boardDetailInfo {
                    ForEach(boardDetailInfo.menus, id: \.menuIndex) { menuInfo in
                        Text(menuInfo.menuName).tag(menuInfo.menuName)
                    }
                }
            }.pickerStyle(MenuPickerStyle())
                .padding(.horizontal,7)
            
            Divider()
                .background(.gray)
                .frame(height: 7)
                .padding(.horizontal,7)
            Text("슴우디는 상명대학교 재학생 누구나 유용하게 사용할 수 있는 리뷰 문화를 만들기 위해 일부 게시판에 한해 커뮤니티 이용규칙을 제정하여 운영하고 있습니다. \n\n위반 시 게시물이 삭제 되고 서비스 이용이 일정 기간 제한될 수 있습니다. \n\n아래의 이 게시판에 해당하는 핵심 내용에 대한 사항이 존재하니 게시물 작성 전 커뮤니티 이용규칙을 반드시 확인하시길 바랍니다.\n\n리뷰 게시판은 사진 첨부 필수입니다. 무분별한 리뷰를 막기 위함이니 해당 음식점 및 카페와 관련된 사진 첨부를 부탁드립니다.\n\n")
                .font(.system(size: 12,weight: .bold))
                .foregroundColor(Color("LightGray"))
                .frame(width: 360, height: 165, alignment: .topLeading)
            Spacer()
            Button(action: {
                vm.postReview(storeIdx, content: text, images: images, menuTag: hashtag)
                dismiss()
            }){
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
        .onTapGesture {
            dismissKeyboard()
        }
        .navigationBarBackButtonHidden(true)
    }
    private func dismissKeyboard() {
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}

