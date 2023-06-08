//
//  CafeteriaViewModel.swift
//  SMUthie
//
//  Created by Phil on 2023/02/28.
//

import Combine

class CafeteriaViewModel: ObservableObject {
    @Published var cafeteria: [(Cafeteria,Cafeteria)] = [
        (Cafeteria(date: "6/2 (금)", classification: "자율한식", price: "가격 6000원", menu: " [탄탄멘&오꼬노미만두]\n후리가케밥\n탄탄멘\n오꼬노미만두\n미역줄기볶음\n오복지무침\n배추김치\n그린샐러드&드레싱"),
        Cafeteria(date: "6/2 (금)", classification: "푸드코트", price: "가격 4500원~", menu: "오므라이스\n오므라이스&생선까스 \n오므라이스&소시지\n오므라이스&치킨까스")),
        
        (Cafeteria(date: "6/5 (월)", classification: "자율한식", price: "가격 6000원", menu: " [돼지장터국밥&데리야끼고기산적]\n쌀밥/잡곡밥\n돼지장터국밥\n데리야끼고기산적\n매콤두부조림\n도시락김\n배추김치\n그린샐러드&드레싱"),
        Cafeteria(date: "6/5 (월)", classification: "푸드코트", price: "가격 4500원~", menu: "등심돈까스\n눈꽃치즈돈까스\n오꼬노미까스")),
        
         (Cafeteria(date: "6/6 (화)", classification: "자율한식", price: "가격 6000원", menu: "현충일"),
         Cafeteria(date: "6/6 (화)", classification: "푸드코트", price: "가격 4500원~", menu: "현충일")),
        
        (Cafeteria(date: "6/7 (수)", classification: "자율한식", price: "가격 6000원", menu: "[매콤제육볶음&옛날핫도그]\n쌀밥/잡곡밥\n오이미역냉국\n매콤제육볶음\n옛날핫도그(1인1개씩)\n콩나물무침\n배추김치\n그린샐러드&드레싱 "),
        Cafeteria(date: "6/7 (수)", classification: "푸드코트", price: "가격 4500원~", menu: "등심돈까스\n눈꽃치즈돈까스\n오꼬노미까스참치야채비빔밥\n참치야채비빔밥&설탕꽈배기")),
         
        (Cafeteria(date: "6/8 (목)", classification: "자율한식", price: "가격 6000원", menu: " [치킨까스&들기름막국수]\n쌀밥/잡곡밥\n김치콩나물국\n치킨까스&칠리소스\n들기름막국수\n오이양파쌈장무침\n배추김치\n그린샐러드&드레싱"),
        Cafeteria(date: "6/8 (목)", classification: "푸드코트", price: "가격 4500원~", menu: "등심돈까스\n눈꽃치즈돈까스\n오꼬노미까스\n참치야채비빔밥\n참치야채비빔밥&설탕꽈배기")),
         
        (Cafeteria(date: "6/9 (금)",classification: "자율한식", price: "가격 6000원", menu: "[닭칼국수&찐손만두]\n쌀밥/잡곡밥\n닭칽국수\n찐손만두*초간장\n후랑크어묵볶음\n오징어야채초무침\n배추김치\n그린샐러드&드레싱"),
        Cafeteria(date: "6/9 (금)",classification: "푸드코트", price: "가격 4500원~", menu: "등심돈까스\n눈꽃치즈돈까스\n오꼬노미까스"))
    ]
    @Published var currentMenuItemIndex = 0
    
    func showNextMenuItem() {
        currentMenuItemIndex += 1
        if currentMenuItemIndex >= cafeteria.count {
            currentMenuItemIndex = 0
        }
    }
}

