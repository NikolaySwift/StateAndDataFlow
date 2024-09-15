//
//  ContentView.swift
//  StateAndDataFlow
//
//  Created by NikolayD on 14.09.2024.
//

import SwiftUI

struct ContentView: View {
    @Environment(ContentViewViewModel.self) private var contentViewVM
    @EnvironmentObject private var loginViewVM: LoginViewViewModel
    
    var body: some View {
        VStack {
            Text("Hi, \(loginViewVM.user.name)!")
                .padding(.top, 100)
                .font(.largeTitle)
            
            Text(contentViewVM.counter.formatted())
                .font(.largeTitle)
                .padding(.top, 100)
            
            Spacer()
            
            ButtonView(
                title: contentViewVM.buttonTitle,
                color: .red,
                action: contentViewVM.startTimer
            )
            
            Spacer()
            
            ButtonView(title: "Logout", color: .blue, action: loginViewVM.logout)
        }
        .padding()
    }
}

#Preview {
    ContentView()
        .environment(ContentViewViewModel())
        .environmentObject(LoginViewViewModel())
}

struct ButtonView: View {
    let title: String
    let color: Color
    let action: () -> Void
    
    var body: some View {
        Button(action: action) {
            Text(title)
                .font(.title)
                .fontWeight(.bold)
                .foregroundStyle(.white)
        }
        .frame(width: 200, height: 60)
        .background(color)
        .clipShape(.rect(cornerRadius: 20))
        .overlay(
            RoundedRectangle(cornerRadius: 20)
                .stroke(.black, lineWidth: 4)
        )
            
        
    }
}
