//
//  RegistrationView.swift
//  DIU VRS
//
//  Created by Fahim Rahman on 12/10/21.
//

import SwiftUI

// MARK: - Registration View
struct RegistrationView: View {
    
    // MARK: Properties
    @ObservedObject var registrationCredentials = RegistrationCredentials()
    
    // body
    var body: some View {
        // navigation view
        NavigationView {
            // scroll View
            ScrollView(.vertical, showsIndicators: false) {
                // vstack
                VStack(spacing: 10) {
                    RegistrationTextView()
                    Spacer()
                    RegistrationCredentialsView(registrationCredentials: registrationCredentials)
                    Spacer()
                    RegistrationButtonView(registrationCredentials: registrationCredentials)
                    Spacer()
                } //: vstack
                .padding(.vertical)
            } //: scroll View
            .clipped()
            .navigationBarTitle("", displayMode: .inline)
            .navigationBarHidden(true)
        } //: navigation view
    } //: body
}



// MARK: - Preview
struct RegistrationView_Previews: PreviewProvider {
    static var previews: some View {
        RegistrationView()
    }
}
