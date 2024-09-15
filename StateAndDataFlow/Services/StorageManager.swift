//
//  StorageManager.swift
//  StateAndDataFlow
//
//  Created by NikolayD on 15.09.2024.
//

import SwiftUI

final class StorageManager {
    static let shared = StorageManager()
    
    @AppStorage("user") var data: Data?
    
    private init() {}
    
    func fetchUser() -> User {
        guard let data, let user = try? JSONDecoder().decode(User.self, from: data) else {
            return User(name: "", isLoggedIn: false)
        }
        
        return user
    }
    
    func save(user: User) {
        data = try? JSONEncoder().encode(user)
    }
    
    func deleteUser() {
        data = nil
    }
}
