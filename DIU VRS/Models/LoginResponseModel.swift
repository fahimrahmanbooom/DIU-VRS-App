//
//  LoginResponseModel.swift
//  DIU VRS
//
//  Created by Fahim Rahman on 12/10/21.
//

import Foundation

// MARK: - LoginResponseModel
struct LoginResponseModel: Codable {
    var status: Int?
    var message: String?
    var data: LoginData?
}

// MARK: - DataClass
struct LoginData: Codable {
    var token, type: String?
    var admin: Bool?
}
