//
//  LoginCredentials.swift
//  DIU VRS
//
//  Created by Fahim Rahman on 12/10/21.
//

import Foundation

// Login Credentials Observer
class LoginCredentials: ObservableObject {
    @Published var email: String = String()
    @Published var password: String = String()
}
