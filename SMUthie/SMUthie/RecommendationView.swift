//
//  PlusView.swift
//  SMUthie
//
//  Created by Phil on 2023/02/28.
//

import SwiftUI

struct RecommendationView: View {
    @ObservedObject var viewModel = RecommendationViewModel()
    @State var selectComplete = false 
    var body: some View {
        VStack {
            HStack {
                Image("Logo")
                    .resizable()
                    .scaledToFit()
                    .frame(width: UIScreen.main.bounds.width/3, height: 35.5)
                Spacer()
            }
            Text("상명대에서 뭐먹지?")
                .fontWeight(.bold)
                .font(.system(size: 28))
                .foregroundColor(Color("CustomOrange"))
            Text("수뭉이가 메뉴를 추천해드려요 :)")
                .fontWeight(.bold)
                .font(.system(size: 20))
                .foregroundColor(Color("CustomBlue").opacity(0.5))
            
            ZStack{
                Rectangle()
                    .fill(Color("BorderLine50"))
                    .border(Color("BorderLine"))
                    .cornerRadius(20)
                    .padding(.horizontal)
                    .shadow(color: Color.black.opacity(0.25), radius: 4, x: 2, y: 2)
                
                VStack{
                    // Composition groups need to live inside some a stack. (VStack, ZStack, or HStack)
                    if !selectComplete {
                        OXSwitchView(posText: "상명부초\n       위", negText: "상명부초\n     아래", tag: 0, viewModel: viewModel)
                        OXSwitchView(posText: "밥 O", negText: "밥 X", tag: 1, viewModel: viewModel)
                        OXSwitchView(posText: "국물 O", negText: "국물 X", tag: 2, viewModel: viewModel)
                        OXSwitchView(posText: "고기 O", negText: "고기 X", tag: 3, viewModel: viewModel)
                        OXSwitchView(posText: "맵고수", negText: "맵찔이", tag: 4, viewModel: viewModel)
                    }
                    else {
                        MenuListView(viewModel: viewModel)
                    }
                    SearchBtnView(viewModel: viewModel, selectComplete : $selectComplete)
                }
                .padding()
            }
            
        }
    }
}


struct OXSwitchView: View {
    @State var isOSelected = false
    @State var isXSelected = false
    let posText: String
    let negText: String
    let tag : Int
    @ObservedObject var viewModel : RecommendationViewModel
    
    var body: some View {
        
        HStack {
            OXSwitchCellView(isSelected: $isOSelected,titleText: posText)
                .onTapGesture {
                    if self.isOSelected {
                        self.isOSelected = false
                        viewModel.switchState[tag] = -1
                    }
                    else {
                        self.isOSelected = true
                        self.isXSelected = false
                        viewModel.switchState[tag] = 1
                    }
                    viewModel.fetchRecommendation()
                    print(viewModel.switchState)
                }
            OXSwitchCellView(isSelected: $isXSelected,titleText: negText)
                .onTapGesture {
                    if self.isXSelected {
                        self.isXSelected = false
                        viewModel.switchState[tag] = -1
                    }
                    else {
                        self.isXSelected = true
                        self.isOSelected = false
                        viewModel.switchState[tag] = 0
                    }
                    viewModel.fetchRecommendation()
                    print(viewModel.switchState)
                }
        }
        .padding(.vertical,10)
        .padding(.horizontal,20)
    }
}

struct OXSwitchCellView : View {
    @Binding var isSelected: Bool
    let titleText : String
    var body : some View {
        Rectangle()
            .fill(isSelected ? Color("ClickedOrange") : Color("UnClickedOrange"))
            .border(Color("BorderLine"))
            .cornerRadius(10)
            .shadow(color: Color.black.opacity(0.25), radius: 4, x: 2, y: 2)
            .overlay(Text(titleText)
                .font(.system(size: 24, weight: .bold, design: .rounded))
                .foregroundColor(isSelected ? .white : .black)
            )
    }
}


struct MenuListView : View {
    let viewModel : RecommendationViewModel
    var body : some View {
        ScrollView {
            VStack {
                ForEach(Array(viewModel.allMenu.enumerated()), id: \.element.menuName) { index, menu in
                    MenuListCellView(rank: index + 1, menuName: menu.menuName, placeName: menu.name)
                }
            }
        }
    }
}
struct MenuListCellView :View {
    let rank : Int
    let menuName : String
    let placeName : String
    var body : some View {
        ZStack {
            RoundedRectangle(cornerRadius: 5)
                .fill(Color.white )
            
            RoundedRectangle(cornerRadius: 5)
                .strokeBorder(Color("BorderLine"))
        }
        .compositingGroup()
        .frame(width: 320, height: 50)
        .shadow(color: Color.black.opacity(0.25), radius: 4, x: 2, y: 2)
        .overlay(
            HStack{
                Text("\(rank)위")
                    .font(.system(size: 24, weight: .bold, design: .rounded))
                    .foregroundColor(Color("CustomOrange"))
                Spacer()
                Text(menuName)
                    .font(.system(size: 18, weight: .bold, design: .rounded))
                    .foregroundColor(Color.black)
                Spacer()
                Spacer()
                Text(placeName)
                    .font(.system(size: 16, weight: .bold, design: .rounded))
                    .foregroundColor(Color("CustomGray"))
            }
            
                .padding()
        )
    }
}



struct SearchBtnView : View {
    @ObservedObject var viewModel : RecommendationViewModel
    @Binding var selectComplete : Bool
    
    var body : some View {
        ZStack {
            RoundedRectangle(cornerRadius: 5)
                .fill(viewModel.allMenu.count != 0 ? Color("CustomOrange") : Color.white )
            
            RoundedRectangle(cornerRadius: 5)
                .strokeBorder(Color("BorderLine"))
        }
        .compositingGroup()
        .frame(width: 320, height: 40)
        .shadow(color: Color.black.opacity(0.25), radius: 4, x: 2, y: 2)
        .overlay(
            HStack{
                if !selectComplete {
                    Spacer()
                    Spacer()
                    Spacer()
                    Spacer()
                    Text("인기순 메뉴 리스트 보기")
                    Spacer()
                    Spacer()
                    Text("(\(viewModel.allMenu.count))")
                    Spacer()
                }
                else {
                    Text("메뉴 다시 고르기")
                }
            }
                .font(.system(size: 20, weight: .heavy, design: .rounded))
                .foregroundColor(viewModel.allMenu.count != 0 ? Color(.white) : Color("LightGray"))
        )
        .onTapGesture {
            //메뉴 다시 고르기
            if selectComplete {
                selectComplete = !selectComplete
                viewModel.switchRefresh()
            }
            // 식당 리스트 보기 0이 아닐때
            else if viewModel.allMenu.count != 0 {
                selectComplete = !selectComplete
            }
        }
    }
}


struct PlusView_Previews: PreviewProvider {
    static var previews: some View {
        RecommendationView()
    }
}
