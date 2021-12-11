//
//  AdminLogView.swift
//  DIU VRS
//
//  Created by Fahim Rahman on 12/10/21.
//

import SwiftUI

// MARK: - Admin Log View

struct AdminLogView: View {
    
    // MARK: - Properties
    @State private var getVenueResponseModel = GetVenueResponseModel()
    
    var body: some View {
        // navigation
        NavigationView {
            // scroll view
            ScrollView(.vertical, showsIndicators: false) {
                // vstack
                VStack {
                    CreatedVenueTextViewForAdmin()
                    Spacer()
                    CreatedVenueListForAdmin(getVenueResponseModel: $getVenueResponseModel)
                    Spacer()
                } //: vstack
            } //: scroll view
            .clipped()
            .navigationBarHidden(true)
        } //: navigation
        .task {
            // load created venues data
            loadCreatedVenues()
        }
    }
    
    
    // loadCreatedVenues
    private func loadCreatedVenues() {
        Networking.getRequest(url: URL.getVenuesURLForAdmin, expecting: GetVenueResponseModel.self, completion: { result in
            
            do {
                try self.getVenueResponseModel = result.get()
            } catch {
                print(error)
            }
        })
    }
}


// MARK: - Preview
struct AdminLogView_Previews: PreviewProvider {
    static var previews: some View {
        AdminLogView()
    }
}
