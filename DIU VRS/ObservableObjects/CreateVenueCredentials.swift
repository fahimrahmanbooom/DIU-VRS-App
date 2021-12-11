//
//  CreateVenueCredentials.swift
//  DIU VRS
//
//  Created by Fahim Rahman on 12/11/21.
//

import Foundation

class CreateVenueCredentials: ObservableObject {
    @Published var rentAmount: String = String()
    @Published var seatingCapacity: String = String()
    @Published var venueInfo: String = String()
    @Published var venueLocation: String = String()
    @Published var venueName: String = String()
}
