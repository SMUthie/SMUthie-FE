//
//  AnnouncementViewModel.swift
//  SMUthie
//
//  Created by Phil on 2023/03/02.
//

import Combine

class AnouncementViewModel : ObservableObject {
    @Published var announcements : [Announcement] = [
        Announcement(title: "1번 공지", content: "1번 공지내용"),
        Announcement(title: "2번 공지", content: "2번 공지내용"),
        Announcement(title: "3번 공지", content: "3번 공지내용"),
        Announcement(title: "4번 공지", content: "4번 공지내용")
    ]
}
