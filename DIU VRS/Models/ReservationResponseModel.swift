//
//  ReservationResponseModel.swift
//  DIU VRS
//
//  Created by Fahim Rahman on 12/11/21.
//

import Foundation

// MARK: - ReservationResponseModel
struct ReservationResponseModel: Codable {
    var data: [ReservationResponseData]?
    var message: String?
    var status: Int?
}


// MARK: - ReservationResponseData
struct ReservationResponseData: Codable, Identifiable {
    var id: Int?
    var paid: Bool?
    var paymentAmount: Int?
    var reservationDate, reserversName, reserversPhoneNo, status: String?
    var venueName: String?
}
