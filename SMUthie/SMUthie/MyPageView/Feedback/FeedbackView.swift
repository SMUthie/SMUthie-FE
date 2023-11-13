//
//  FeedbackView.swift
//  SMUthie
//
//  Created by Phil on 2023/03/02.
//

import SwiftUI

/*
struct FeedbackView: View {
    @StateObject private var viewModel = FeedbackViewModel()
    @State private var title: String = ""
    @State private var content: String = ""

    var body: some View {
        VStack {
            Text("제안하고 싶은 기능이나, 개선요청 사항이 있다면 언제든 작성 해 주세요")
                .font(.headline)
                .padding()
            
            TextField("제목", text: $title)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
            
            TextEditor(text: $content)
                .frame(height: 200)
                .padding()
            
            Button(action: {
                viewModel.sendFeedback(title: title, content: content) { success in
                    if success {
                        title = ""
                        content = ""
                        viewModel.showAlert = true
                    }
                }
            }) {
                Text("보내기")
                    .padding(.horizontal, 30)
                    .padding(.vertical, 10)
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(10)
            }
            .alert(isPresented: $viewModel.showAlert) {
                Alert(title: Text("감사합니다. 피드백이 전송되었습니다!"))
            }
        }
    }
}

struct FeedbackView_Previews: PreviewProvider {
    static var previews: some View {
        FeedbackView()
    }
}
*/
