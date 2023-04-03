//
//  PlusView.swift
//  SMUthie
//
//  Created by Phil on 2023/02/28.
//

import SwiftUI

struct PlusView: View {
    var body: some View {
        VStack(spacing: 0){
            Text("오늘은 뭐먹지?")
                .fontWeight(.bold)
                .font(.system(size: 20))
            Text("수뭉이가 메뉴를 추천해드려요 :)")
                .foregroundColor(Color("CustomGray"))
            
            OXSwitchView(posText: "에컬 위", negText: "에컬 아래")
            OXSwitchView(posText: "밥 O", negText: "밥 X")
            OXSwitchView(posText: "국물 O", negText: "국물 X")
            OXSwitchView(posText: "맵고수", negText: "맵찔이")
                }
        }
}

struct OXSwitchView: View {
    @State var isOSelected = false
    @State var isXSelected = false
    let posText: String
    let negText: String
    
    var body: some View {
        let buttonWidth = UIScreen.main.bounds.width * 0.9
        
       HStack {
            Rectangle()
                .fill(isOSelected ? Color.blue.opacity(0.3) : Color.gray.opacity(0.3))
                .frame(width: buttonWidth / 2, height: UIScreen.main.bounds.height / 7)
                .overlay(Text(posText)
                            .font(.system(size: 40, weight: .bold, design: .rounded))
                            .foregroundColor(isOSelected ? .white : .black))
                .onTapGesture {
                    if self.isOSelected {
                        self.isOSelected = false
                    }
                    else {
                        self.isOSelected = true
                        self.isXSelected = false
                    }
                }
            
            Rectangle()
                .fill(isXSelected ? Color.blue.opacity(0.3) : Color.gray.opacity(0.3))
                .frame(width: buttonWidth / 2, height: UIScreen.main.bounds.height / 7)
                .overlay(Text(negText)
                            .font(.system(size: 40, weight: .bold, design: .rounded))
                            .foregroundColor(isXSelected ? .white : .black))
                .onTapGesture {
                    if self.isXSelected {
                        self.isXSelected = false
                    }
                    else {
                        self.isXSelected = true
                        self.isOSelected = false
                    }
                }
        }
        .frame(width: buttonWidth)
        .padding()
    }
}



struct PlusView_Previews: PreviewProvider {
    static var previews: some View {
        PlusView()
    }
}
