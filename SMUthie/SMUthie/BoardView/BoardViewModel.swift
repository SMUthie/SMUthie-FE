//
//  BoardViewModel.swift
//  SMUthie
//
//  Created by Phil on 2023/08/02.
//

import Foundation

class BoardViewModel : ObservableObject {
    @Published var posts : [Post] = [Post(name :"나는야 슴우",date: "15:34", place: "부대통령",
                                          content:  "부대통령 혼밥하기 좋음 순두부찌개 진짜 너무 맛있지 않나? 계란 넣어먹는 거 국룰이고 밥도둑이라 매일먹어도 안질림 사장님 친절해서 더 좋아요 다들 부대통령 와라 ㅋㅋ",
                                          hashtag: "#순두부찌개", ImageNum: 2, like :13, unlike: 8),
                                     Post(name :"나는야 슴우", date: "15: 29", place: "부대통령",
                                          content:  "부대통령은 부대찌개가 국룰이지 ㄹㅇ ㅋㅋ",
                                          hashtag: "#부대찌개",ImageNum: 1, like: 10, unlike: 4),
                                     Post(name :"나는야 슴우", date: "19: 29", place: "부대통령",
                                          content:  "여러분 치즈 안동찜닭 드셔보세요 ㅋㅋ",
                                          hashtag: "#치즈안동찜닭", ImageNum: 0, like: 6, unlike: 0),
                                     Post(name :"나는야 슴우", date: "19: 29", place: "부대통령",
                                          content:  "여러분 치즈 안동찜닭 드셔보세요 ㅋㅋ",
                                          hashtag: "#치즈안동찜닭", ImageNum: 0, like: 6, unlike: 0)]
}
