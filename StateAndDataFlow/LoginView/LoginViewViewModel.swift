//
//  LoginViewViewModel.swift
//  StateAndDataFlow
//
//  Created by NikolayD on 14.09.2024.
//

import Foundation
import Combine

final class LoginViewViewModel: ObservableObject {
    var name = ""
    @Published var isLoggedIn = false
    
    
}
