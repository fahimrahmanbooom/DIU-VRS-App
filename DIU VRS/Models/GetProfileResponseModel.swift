//
//  GetProfileResponseModel.swift
//  DIU VRS
//
//  Created by Fahim Rahman on 12/11/21.
//

import Foundation

// MARK: - Get Profile Response Model
struct GetProfileResponseModel: Codable {
    var status: Int?
    var message: String?
    var data: ProfileData?
}

// MARK: - DataClass
struct ProfileData: Codable {
    var name, email, phoneNo: String?
}
