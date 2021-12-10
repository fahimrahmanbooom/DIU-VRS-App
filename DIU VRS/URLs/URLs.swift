//
//  URLs.swift
//  DIU VRS
//
//  Created by Fahim Rahman on 12/10/21.
//

import Foundation

extension URL {

    // base URL
    private static let baseURLString = "https://diu-vrs-alpha-q.herokuapp.com/swagger-ui.html#/"

    // login url
    
    
    // register url
    static let registerURL = URL(string: "\(baseURLString)/auth/signUp")
}
