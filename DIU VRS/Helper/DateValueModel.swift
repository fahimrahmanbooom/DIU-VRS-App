//
//  DateValueModel.swift
//  DIU VRS
//
//  Created by Fahim Rahman on 12/11/21.
//

import Foundation

struct DateValueModel: Identifiable {
    var id = UUID().uuidString
    var day: Int
    var date: Date
}
