//
//  StateAndDataFlowApp.swift
//  StateAndDataFlow
//
//  Created by NikolayD on 14.09.2024.
//

import SwiftUI

@main
struct StateAndDataFlowApp: App {
    @State private var contentViewVM = ContentViewViewModel()
    @StateObject private var loginViewVM = LoginViewViewModel()
    
    var body: some Scene {
        WindowGroup {
            RootView()
        }
        .environment(contentViewVM)
        .environmentObject(loginViewVM)
    }
}
