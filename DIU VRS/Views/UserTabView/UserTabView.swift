//
//  UserTabView.swift
//  DIU VRS
//
//  Created by Fahim Rahman on 12/10/21.
//

import SwiftUI

// MARK: - User Tab View
struct UserTabView: View {
    // body
    var body: some View {
        // tab view
        TabView {
            UserStatusView()
                .tabItem { Label("Status", systemImage: "text.redaction") }
            UserReserveView()
                .tabItem { Label("Reserve", systemImage: "pin.fill") }
            UserProfileView()
                .tabItem { Label("Profile", systemImage: "person.text.rectangle.fill") }
        } //: tab view
        .accentColor(.customGreen)
    } //: body
}


// MARK: - Preview
struct UserTabView_Previews: PreviewProvider {
    static var previews: some View {
        UserTabView()
    }
}
