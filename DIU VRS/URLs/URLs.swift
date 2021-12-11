//
//  URLs.swift
//  DIU VRS
//
//  Created by Fahim Rahman on 12/10/21.
//

import Foundation

extension URL {

    // base URL
//    private static let baseURLString = "http://192.168.225.157:8083"
    private static let baseURLString = "https://diu-vrs-alpha-q.herokuapp.com"

    // register url
    static let registerURL = URL(string: "\(baseURLString)/auth/signUp")
    
    // login url
    static let loginURL = URL(string: "\(baseURLString)/auth/signIn")
    
    // get profile
    static let getProfileURL = URL(string: "\(baseURLString)/auth/profile")
    
    // create venue
    static let createVenueURL = URL(string: "\(baseURLString)/api/venues")
    
    // get venues for admin
    static let getVenuesURLForAdmin = URL(string: "\(baseURLString)/api/venues")
    
    // get venues for admin
    static let getVenuesURLForUser = URL(string: "\(baseURLString)/api/venues?isUser=true")
    
    // get reservations
    static func getReservationsURL(venueId: Int) -> URL? {
        let url = URL(string: "\(baseURLString)/api/reservations/reservation-dates/\(venueId)")
        return url
    }
    
    // post reservation
    static let postReservationURL = URL(string: "\(baseURLString)/api/reservations")
    
    // get reservation
    static let getReservationURL = URL(string: "\(baseURLString)/api/reservations")
}
