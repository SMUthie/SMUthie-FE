//
//  AnnouncementView.swift
//  SMUthie
//
//  Created by Phil on 2023/03/02.
//

import SwiftUI

struct AnnouncementView: View {
    @ObservedObject var viewModel = AnouncementViewModel()
    
    var body: some View {
        List(viewModel.announcements.indices, id: \.self) { index in
            DisclosureGroup(isExpanded: $viewModel.announcements[index].isExpanded) {
                Text(viewModel.announcements[index].content)
            } label: {
                Text(viewModel.announcements[index].title)
            }
            .accentColor(.black)
        }
        .listStyle(PlainListStyle())
        .navigationTitle("공지사항")
    }
}

struct AnnouncementView_Previews: PreviewProvider {
    static var previews: some View {
        AnnouncementView()
    }
}
