//
//  DIU_VRSApp.swift
//  DIU VRS
//
//  Created by Fahim Rahman on 12/9/21.
//

import SwiftUI

@main
struct DIU_VRSApp: App {
    
    @AppStorage("adminLoggedIn") var adminLoggedIn: Bool = false
    @AppStorage("userLoggedIn") var userLoggedIn: Bool = false
    
    var body: some Scene {
        WindowGroup {
            if !adminLoggedIn && !userLoggedIn {
                LoginView()
            }
            else if adminLoggedIn {
                // admin's tab view
                AdminTabView()
            }
            else if userLoggedIn {
                // user's tab view
                UserTabView()
            }
        }
    }
}
