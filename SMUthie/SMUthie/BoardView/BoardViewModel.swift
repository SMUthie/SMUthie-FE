//
//  BoardViewModel.swift
//  SMUthie
//
//  Created by Phil on 2023/08/02.
//

import Foundation

class BoardViewModel : ObservableObject {
    @Published var posts : [Post] = [Post(date: "15:34", place: "부대통령", content:  "부대통령 혼밥하기 좋음 순두부찌개 먹었는데 맛있음",
                                          hashtag: "#순두부찌개", ImageNum: 2, like :13, unlike: 8),
                                     Post(date: "15: 29", place: "부대통령", content:  "부대통령은 부대찌개가 국룰이지 ㄹㅇ ㅋㅋ", hashtag: "#부대찌개", ImageNum: 1, like: 10, unlike: 4),
                                     Post(date: "19: 29", place: "부대통령", content:  "여러분 치즈 안동찜닭 드셔보세요 ㅋㅋ", hashtag: "#치즈안동찜닭", ImageNum: 0, like: 6, unlike: 0),
                                     Post(date: "19: 29", place: "부대통령", content:  "여러분 치즈 안동찜닭 드셔보세요 ㅋㅋ", hashtag: "#치즈안동찜닭", ImageNum: 0, like: 6, unlike: 0)]
}
