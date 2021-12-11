//
//  GetVenueResponseModel.swift
//  DIU VRS
//
//  Created by Fahim Rahman on 12/11/21.
//

import Foundation


// MARK: - Get Venue Response Model
struct GetVenueResponseModel: Codable {
    var status: Int?
    var message: String?
    var data: [VenueData]?
}

// MARK: - VenueData
struct VenueData: Codable, Identifiable {
    var id: Int?
    var isDeleted: Bool?
    var venueName, venueLocation, seatingCapacity: String?
    var rentAmount: Int?
    var venueInfo: String?
    var active: Bool?
}
