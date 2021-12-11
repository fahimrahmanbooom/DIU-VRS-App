//
//  GetReservationsModel.swift
//  DIU VRS
//
//  Created by Fahim Rahman on 12/11/21.
//

import Foundation

// MARK: - Get Reservation Model
struct GetReservationModel: Codable {
    var status: Int?
    var message: String?
    var data: [GetReservationData]?
}

// MARK: - GetReservationData
struct GetReservationData: Codable {
    var date, month: Int?
    var venueName: String?
    var venueID: Int?
    var morning, allDay, afternoon: Bool?

    enum CodingKeys: String, CodingKey {
        case date, month, venueName
        case venueID = "venueId"
        case morning, allDay, afternoon
    }
}
