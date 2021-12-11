//
//  AdminCreateVenueView.swift
//  DIU VRS
//
//  Created by Fahim Rahman on 12/10/21.
//

import SwiftUI

// MARK: - Admin Create Venue View
struct AdminCreateVenueView: View {
    
    // MARK: - Properties
    @ObservedObject var createVenueCredentials: CreateVenueCredentials
    
    var body: some View {
        // navigation
        NavigationView {
            // scroll view
            ScrollView {
                // vstack
                VStack {
                    TopLogoView()
                    Spacer()
                    CreateVenueTextView()
                    Spacer()
                    CreateVenueTextFieldsView(createVenueCredentials: createVenueCredentials)
                    Spacer()
                    CreateVenueButtonView(createVenueCredentials: createVenueCredentials)
                    Spacer()
                } //: vstack
            } //: scroll view
            .clipped()
            .navigationBarHidden(true)
        } //: navigation
    }
}


// MARK: - Preview
struct AdminCreateVenueView_Previews: PreviewProvider {
    static var previews: some View {
        AdminCreateVenueView(createVenueCredentials: .init())
    }
}
