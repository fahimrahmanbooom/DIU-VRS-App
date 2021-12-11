//
//  UserReserveView.swift
//  DIU VRS
//
//  Created by Fahim Rahman on 12/10/21.
//

import SwiftUI

struct UserReserveView: View {
    
    @State private var getVenueResponseModel = GetVenueResponseModel()
    
    var body: some View {
        // navigation
        NavigationView {
            // scroll view
            ScrollView(.vertical, showsIndicators: false) {
                // vstack
                VStack {
                    CreatedVenueTextViewForUser()
                    Spacer()
                    CreatedVenueListForUser(getVenueResponseModel: $getVenueResponseModel)
                    Spacer()
                } //: vstack
            } //: scroll view
            .clipped()
            .navigationBarHidden(true)
        } //: navigation
        .task {
            loadCreatedVenues()
        }
    }
    
    // loadCreatedVenues
    private func loadCreatedVenues() {
        Networking.getRequest(url: URL.getVenuesURLForUser, expecting: GetVenueResponseModel.self, completion: { result in
            
            do {
                try self.getVenueResponseModel = result.get()
            } catch {
                print(error)
            }
        })
    }
}


struct UserReserveView_Previews: PreviewProvider {
    static var previews: some View {
        UserReserveView()
    }
}
