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
        NavigationView {
            List {
                ForEach(viewModel.announcements.indices, id: \.self) { index in
                    Section {
                        DisclosureGroup(
                            isExpanded: $viewModel.announcements[index].isExpanded,
                            content: {
                                Text(viewModel.announcements[index].content)
                                    .padding(.vertical, 8)
                            }
                        ) {
                            Text(viewModel.announcements[index].title)
                                .padding(.vertical, 8)
                        }
                        .accentColor(.black)
                    }
                }
            }
            .listStyle(PlainListStyle())
            .navigationBarTitle("공지사항")
        }
    }
}

struct AnnouncementView_Previews: PreviewProvider {
    static var previews: some View {
        AnnouncementView()
    }
}
