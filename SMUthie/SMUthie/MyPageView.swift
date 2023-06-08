//
//  MyPageView.swift
//  SMUthie
//
//  Created by Phil on 2023/02/28.
//

import SwiftUI

struct MyPageView: View {
    @State var imageChanged = true
    var body: some View {
        VStack{
            Button(action: {
                imageChanged = !imageChanged
            }) {
                Image(imageChanged ? "MyPageEx" : "MyPageEx2")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
            }
        }
    }
}

struct MyPageView_Previews: PreviewProvider {
    static var previews: some View {
        MyPageView()
    }
}
