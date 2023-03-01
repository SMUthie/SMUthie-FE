//
//  CampusCafeModalView.swift
//  SMUthie
//
//  Created by Phil on 2023/03/01.
//

import SwiftUI

struct CampusCafeMenuModalView: View {
    let cafeIndex: Int
    @ObservedObject var viewModel = CampusCafeMenuModalViewModel()
    
    var body: some View {
        Text(viewModel.cafeMenus[cafeIndex].name)
        Text(viewModel.cafeMenus[cafeIndex].image)
    }
}

