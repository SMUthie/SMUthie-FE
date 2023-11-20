//
//  CampusCafeModalView.swift
//  SMUthie
//
//  Created by Phil on 2023/03/01.
//

import SwiftUI

struct MenuModalView: View {
    let cafeIndex: Int
    let cafeName: String
    let cafeLocation: String
    let cafeOperatingTime : String
//    let cafeImage : String = ""
    let imageUrl : String
    
    @State private var scale: CGFloat = 1.0
    @State private var offset = CGSize.zero
    @StateObject var middleItemVM = MiddleItemViewModel()
    
    var body: some View {
        VStack{
            CampusCafeInfView(cafeName: cafeLocation+" "+cafeName, cafeOperatingTime: cafeOperatingTime)
                .padding(.vertical)
            // 중간 바
            HStack(spacing: 0) {
                ForEach (Array(middleItemVM.items.enumerated()),id: \.element.title) { (tag,item) in
                    Rectangle()
                        .stroke(Color("BorderLine"),lineWidth: 2)
                        .frame(height: 60)
                        .overlay(
                            MiddleItemView (image: item.image, title: item.title, tag: tag , middleItemVM : middleItemVM )
                        )
                }
            }
            Spacer()
            AsyncImage(urlString: imageUrl)
                .scaledToFit()
                .scaleEffect(scale)
                .offset(offset)
                .gesture(
                    SimultaneousGesture(
                        MagnificationGesture()
                            .onChanged { value in
                                scale = value.magnitude
                            },
                        DragGesture()
                            .onChanged { value in
                                offset = value.translation
                            }
                    )
                )
        }
    }
}

struct CampusCafeInfView : View {
    let cafeName: String
    let cafeOperatingTime : String
    var body : some View {
        VStack{
            HStack {
                Text("교내 카페 정보")
                    .font(.title2)
                    .foregroundColor(Color("CustomOrange"))
                    .fontWeight(.heavy)
                Spacer()
            }.padding(.vertical,8)
            
            Text(cafeName)
                .fontWeight(.heavy)
            Text(cafeOperatingTime)
                .padding(.bottom)
        }
        .padding()
        .background(Color.white)
        .cornerRadius(20)
        .overlay(RoundedRectangle(cornerRadius: 20).stroke(Color("BorderLine"), lineWidth: 1))
        .shadow(radius: 4)
        .padding(.horizontal)
    }
}





struct MiddleItemView : View {
    let image : String
    let title : String
    let tag : Int
    let middleItemVM : MiddleItemViewModel
    
    var body: some View {
        Spacer()
        Button(action: {
            switch tag {
            case 0 :
                print("case 1")
            case 1 :
                print("case 2")
            case 2 :
                print("case 3")
            case 3 :
                middleItemVM.heartClicked()
                print("case 4")
            default :
                print("none")

            }
        }){
            VStack {
                Image(image)
                Text(title)
                    .foregroundColor(Color("CustomOrange"))
                    .font(.system(size: 11))
            }
        }
    }
}



struct MenuModalView_Previews: PreviewProvider {
    static var previews: some View {
        CampusCafeView()
    }
}
