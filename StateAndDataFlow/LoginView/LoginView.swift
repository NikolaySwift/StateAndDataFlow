//
//  LoginView.swift
//  StateAndDataFlow
//
//  Created by NikolayD on 14.09.2024.
//

import SwiftUI

struct LoginView: View {
    @EnvironmentObject private var loginViewVM: LoginViewViewModel
    
    var body: some View {
        VStack {
            LoginTextFieldView(loginViewVM: loginViewVM)
                
            Button(action: loginViewVM.login) {
                Label("OK", systemImage: "checkmark.circle")
                    .font(.title)
                    .disabled(!loginViewVM.isCorrectName())
            }
        }
    }
}

#Preview {
    LoginView()
        .environmentObject(LoginViewViewModel())
}

struct LoginTextFieldView: View {
    @ObservedObject var loginViewVM: LoginViewViewModel
    
    var body: some View {
        HStack {
            TextField("Enter your name", text: $loginViewVM.user.name)
                .multilineTextAlignment(.center)
                .font(.title)
            Text(loginViewVM.nameLength.formatted())
                .font(.title)
                .foregroundStyle(
                    loginViewVM.isCorrectName() ? .green : .red
                )
            
        }
        .padding(EdgeInsets(top: 0, leading: 32, bottom: 0, trailing: 32))
    }
}
