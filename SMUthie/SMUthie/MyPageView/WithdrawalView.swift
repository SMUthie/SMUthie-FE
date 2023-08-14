//
//  WithdrawalView.swift
//  SMUthie
//
//  Created by Phil on 2023/03/02.
//

import SwiftUI

struct WithdrawalView: View {
    var body: some View {
        VStack {
            Spacer()
            Text("그동안 슴우디와 함께해주셔서 감사합니다 :) \n\n더이상 슴우디를 이용하지 \n않으시나요?")
                .font(.system(size: 24))
            Spacer()
        }
    }
}

struct WithdrawalView_Previews: PreviewProvider {
    static var previews: some View {
        WithdrawalView()
    }
}
