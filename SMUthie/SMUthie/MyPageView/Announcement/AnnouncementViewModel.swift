//
//  AnnouncementViewModel.swift
//  SMUthie
//
//  Created by Phil on 2023/03/02.
//

import Combine

class AnouncementViewModel : ObservableObject {
    @Published var announcements : [Announcement] = [
        Announcement(title: "개인정보처리방침 개정 안내(3월 2일 시행)", content: "1번 공지내용"),
        Announcement(title: "서비스 이용약관 개정 안내(2월 7일 시행)", content: "2번 공지내용"),
        Announcement(title: "슴우디 리뷰운영정책 제정 안내", content: "3번 공지내용"),
        Announcement(title: "위치기반서비스 이용약관 개정 안내", content: "4번 공지내용")
    ]
}
