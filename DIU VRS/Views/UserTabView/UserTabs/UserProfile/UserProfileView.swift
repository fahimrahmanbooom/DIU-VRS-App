//
//  UserProfileView.swift
//  DIU VRS
//
//  Created by Fahim Rahman on 12/10/21.
//

import SwiftUI

// MARK: - User Profile View
struct UserProfileView: View {
    
    // MARK: - Properties
    @State private var getProfileResponseModel = GetProfileResponseModel()
    
    // body
    var body: some View {
        // navigation
        NavigationView {
            // vstack
            VStack {
                TopLogoView()
                AdminImageAndNameView(getProfileResponseModel: $getProfileResponseModel)
            } //: vstack
            .navigationBarHidden(true)
        } //: navigation
        .task {
            // get profile data
            loadProfileData()
        }
    } //: body
    
    
    // load profile data
    private func loadProfileData() {
        Networking.getRequest(url: URL.getProfileURL, token: "\(UserDefaults.standard.string(forKey: "token") ?? "")", expecting: GetProfileResponseModel.self, completion: { result in
            do {
                try self.getProfileResponseModel = result.get()
                print(self.getProfileResponseModel)
            } catch {
                print(error)
            }
        })
    }
}


// MARK: - Preview
struct UserProfileView_Previews: PreviewProvider {
    static var previews: some View {
        AdminProfileView()
    }
}

