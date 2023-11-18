//
//  SignView.swift
//  SMUthie
//
//  Created by 김유빈 on 2023/11/17.
//

import SwiftUI

struct SignView: View {
    let schoolId: Int
    @State private var password = ""
    @State private var confirmPassword = ""
    @State private var passwordsMatch = true
    @State private var passwordError = ""
    @State private var nickname = ""
    @State private var isButtonPressed = false
    @State private var isNicknameEnabled = false
    
    @Environment(\.presentationMode) var presentationMode
    @State private var showAlert = false
    @State private var navigateToLogin = false
    
    @ObservedObject private var checknicknameViewModel = CheckNicknameViewModel()
    @ObservedObject private var registerViewModel = RegisterViewModel()
    
    @Binding var navigationPath: NavigationPath
    
    var body: some View {
        VStack {
            Text("이제 회원가입을\n완료해 주세요.")
                .font(
                    Font.custom("NanumSquareRoundOTF", size: 24)
                        .weight(.heavy)
                )
                .foregroundColor(.black)
                .padding(.vertical, 20)
                .padding(.leading, 25)
                .frame(maxWidth: .infinity, alignment: .leading)
            
            Text(String(schoolId) + "@sangmyung.kr")
                .font(
                    Font.custom("NanumSquareRoundOTF", size: 18)
                        .weight(.heavy)
                )
                .multilineTextAlignment(.center)
                .foregroundColor(.black)
                .frame(width: 365, height: 50)
                .overlay(
                    RoundedRectangle(cornerRadius: 5)
                        .stroke(Color("DividerGray"))
                )
                .padding(.bottom, 30)
            
            if !passwordError.isEmpty {
                Text(passwordError)
                    .font(
                        Font.custom("NanumSquareRoundOTF", size: 14)
                            .weight(.bold)
                    )
                    .multilineTextAlignment(.trailing)
                    .foregroundColor(.red)
                    .padding(.trailing, 20)
                    .frame(maxWidth: .infinity, alignment: .trailing)
            }
            
            SecureField("비밀번호", text: $password)
                .padding()
                .frame(width: 365, height: 50)
                .overlay(
                    RoundedRectangle(cornerRadius: 5)
                        .stroke(Color("DividerGray"))
                )
            
            SecureField("비밀번호 재입력", text: $confirmPassword)
                .padding()
                .frame(width: 365, height: 50)
                .overlay(
                    RoundedRectangle(cornerRadius: 5)
                        .stroke(Color("DividerGray"))
                )
            
            Text("비밀번호는 숫자/영문자 \n혼합 6자 이상으로 작성해 주세요.")
                .font(
                    Font.custom("NanumSquareRoundOTF", size: 12)
                        .weight(.bold)
                )
                .foregroundColor(.black)
                .padding(.bottom, 50)
                .padding(.leading, 15)
                .frame(maxWidth: .infinity, alignment: .leading)
            
            if !isNicknameEnabled && isButtonPressed {
                Text("중복된 닉네임입니다.")
                    .font(
                        Font.custom("NanumSquareRoundOTF", size: 14)
                            .weight(.bold)
                    )
                    .multilineTextAlignment(.trailing)
                    .foregroundColor(Color.red)
                    .padding(.trailing, 20)
                    .frame(maxWidth: .infinity, alignment: .trailing)
            }
            
            HStack {
                TextField("닉네임", text: $nickname)
                    .padding()
                    .frame(width: 250, height: 50)
                    .overlay(
                        RoundedRectangle(cornerRadius: 5)
                            .stroke(Color("DividerGray"))
                    )
                Button(action: {
                    checknicknameViewModel.fetchCheckNickname(nickname: nickname, completionHandler: { result in
                        isButtonPressed = true
                        switch result{
                        case .success(let bool):
                            isNicknameEnabled = bool
                        default:
                            isNicknameEnabled = false
                        }
                    })
                }) {
                    Text("중복 확인")
                        .font(
                            Font.custom("NanumSquareRoundOTF", size: 14)
                                .weight(.heavy)
                        )
                        .multilineTextAlignment(.center)
                        .foregroundColor(isNicknameEnabled ? Color.white : Color("CustomGray"))
                        .frame(width: 89, height: 32)
                        .background(
                            RoundedRectangle(cornerRadius: 5)
                                .fill(isNicknameEnabled ? Color("CustomOrange") : Color("DividerGray"))
                        )
                        .overlay(
                            RoundedRectangle(cornerRadius: 5)
                                .stroke(isNicknameEnabled ? Color("CustomOrange") : Color("DividerGray"))
                        )
                }
                .disabled(nickname.isEmpty)
            }
            
            Spacer()
            
            Button(action: {
                validatePasswords()
                
                if shouldEnableConfirmationButton == true {
                    registerViewModel.fetchRegister(studentId: String(schoolId), password: password, nickname: nickname) { success in
                        if success {
                            showAlert = true
                            DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                                showAlert = false
                            }
                            DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                                navigateToLogin = true
                                navigationPath.removeLast(navigationPath.count)
                            }
                        }
                    }
                }
            }) {
                Text("확인")
                    .foregroundColor(shouldEnableConfirmationButton ? Color.white : Color("CustomGray"))
                    .font(
                        Font.custom("NanumSquareRoundOTFB", size: 18)
                    )
                    .frame(width: 365, height: 50)
                    .background(shouldEnableConfirmationButton ? Color("CustomOrange") : Color("DividerGray"))
                    .cornerRadius(10)
            }
            .navigationBarTitle("", displayMode: .inline)
            .padding(.bottom, 10)
        }
        .onAppear(){
            isNicknameEnabled = false
        }
        .alert(isPresented: $showAlert) {
            Alert(
                title: Text("회원가입 성공"),
                message: Text("회원가입이 성공적으로 완료되었습니다!"),
                dismissButton: .default(Text("확인")) {
                    navigateToLogin = true
                }
            )
        }
    }
    
    var shouldEnableConfirmationButton: Bool {
        return passwordsMatch && passwordMeetsCriteria(password) && isNicknameEnabled
    }
    
    func validatePasswords() {
        if password.isEmpty || confirmPassword.isEmpty {
            passwordError = "비밀번호를 입력해 주세요."
        } else if password != confirmPassword {
            passwordsMatch = false
            passwordError = "비밀번호와 재입력한 비밀번호가 일치하지 않습니다."
        } else if !passwordMeetsCriteria(password) {
            passwordError = "비밀번호 규칙을 확인해 주세요."
        } else {
            passwordsMatch = true
            passwordError = ""
        }
    }
    
    func passwordMeetsCriteria(_ password: String) -> Bool {
        // 비밀번호 규칙 - 숫자/영문자 혼합 6자 이상
        let containsNumber = password.rangeOfCharacter(from: .decimalDigits) != nil
        let containsLetter = password.rangeOfCharacter(from: .letters) != nil
        let count = password.count >= 6
        
        return containsNumber && containsLetter && count
    }
}
