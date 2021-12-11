//
//  LoginView.swift
//  DIU VRS
//
//  Created by Fahim Rahman on 12/10/21.
//

import SwiftUI

struct LoginView: View {
    
    // MARK: Properties
    @ObservedObject var loginCredentials = LoginCredentials()
    
    // body
    var body: some View {
        NavigationView {
            // vstack
            VStack {
                
                TopLogoView()
                
                Spacer()
                
                LoginTextView()
                
                Spacer()
                
                LoginCredentialsView(loginCredentials: loginCredentials)
                
                Spacer()
                
                LoginRegisterButtonView(loginCredentials: loginCredentials)
                
                Spacer()
            } //: vstack
            .navigationBarHidden(true)
        }
    }
}


// MARK: - Preview
struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
