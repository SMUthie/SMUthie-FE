//
//  ListView.swift
//  SMUthie
//
//  Created by Phil on 2023/02/28.
//

import SwiftUI

struct ListView: View {
    @State var imageChanged = true
    var body: some View {
        VStack{
            Button(action: {
                imageChanged = !imageChanged
            }) {
                Image(imageChanged ? "ListViewEx" : "ListViewEx2")
                    .resizable()
                        .aspectRatio(contentMode: .fill)
            }
        }
    }
}

struct ListView_Previews: PreviewProvider {
    static var previews: some View {
        ListView()
    }
}
