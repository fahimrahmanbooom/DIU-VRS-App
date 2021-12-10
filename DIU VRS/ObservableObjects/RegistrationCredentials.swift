//
//  RegistrationCredentials.swift
//  DIU VRS
//
//  Created by Fahim Rahman on 12/10/21.
//

import Foundation

// Registation Credentials Observer
class RegistrationCredentials: ObservableObject {
    @Published var name: String = String()
    @Published var email: String = String()
    @Published var phone: String = String()
    @Published var password: String = String()
}
