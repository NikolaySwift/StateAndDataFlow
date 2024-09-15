//
//  LoginViewViewModel.swift
//  StateAndDataFlow
//
//  Created by NikolayD on 14.09.2024.
//

import Foundation
import Combine

final class LoginViewViewModel: ObservableObject {
    @Published var user = StorageManager.shared.fetchUser()
    
    var nameLength: Int {
        user.name.count
    }
    
    private let storageManager = StorageManager.shared
    private let minimumLength = 3
    
    func isCorrectName() -> Bool {
        nameLength < minimumLength ? false : true
    }
    
    func login() {
        if !user.name.isEmpty {
            user.isLoggedIn.toggle()
            storageManager.save(user: user)
        }
    }
    
    func logout() {
        user.name = ""
        user.isLoggedIn.toggle()
        storageManager.deleteUser()
    }
}
