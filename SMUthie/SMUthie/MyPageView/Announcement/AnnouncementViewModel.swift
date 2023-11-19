//
//  AnnouncementViewModel.swift
//  SMUthie
//
//  Created by Phil on 2023/03/02.
//

import Combine

class AnouncementViewModel : ObservableObject {
    @Published var announcements : [Announcement] = [
        Announcement(title: "개인정보처리방침 개정 안내(3월 2일 시행)", content: "안녕하세요. 슴우디입니다.\n슴우디 개인정보처리방침 일부가 아래와 같이 개정될 예정임을 안내드립니다.\n\n*주요 개정 사유\n수집하는 개인정보 항목 현행화\n개인정보 처리 위탁 업무 현행화\n자동수집장치의 설치/운영 및 거부에 관한 내용 추가\n\n*개정 일정\n공고 일자: 2022년 10월 21일(목)\n시행 일자: 2022년 10월 28일(금)"),
        Announcement(title: "서비스 이용약관 개정 안내(2월 7일 시행)", content: "서비스 이용약관 개정 안내(2월 7일 시행)"),
        Announcement(title: "슴우디 리뷰운영정책 제정 안내", content: "슴우디 리뷰운영정책 제정 안내"),
        Announcement(title: "위치기반서비스 이용약관 개정 안내", content: "위치기반서비스 이용약관 개정 안내")
    ]
}
