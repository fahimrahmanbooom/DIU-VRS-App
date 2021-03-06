//
//  AdminTabView.swift
//  DIU VRS
//
//  Created by Fahim Rahman on 12/10/21.
//

import SwiftUI

// MARK: - Admin Tab View
struct AdminTabView: View {
    
    // MARK: - Properties
    
    // body
    var body: some View {
        // tab view
        TabView {
            AdminLogView()
                .tabItem { Label("Venues", systemImage: "list.bullet.rectangle") }
            UserStatusView()
                .tabItem { Label("Status", systemImage: "text.redaction") }
            AdminCreateVenueView(createVenueCredentials: .init())
                .tabItem { Label("Create Venue", systemImage: "calendar.badge.plus") }
            AdminReserveView()
                .tabItem { Label("Reserve", systemImage: "pin.fill") }
            AdminProfileView()
                .tabItem { Label("Profile", systemImage: "person.text.rectangle.fill") }
        } //: tab view
        .accentColor(.customGreen)
    } //: body
}


// MARK: - Preview
struct AdminTabView_Previews: PreviewProvider {
    static var previews: some View {
        AdminTabView()
    }
}
