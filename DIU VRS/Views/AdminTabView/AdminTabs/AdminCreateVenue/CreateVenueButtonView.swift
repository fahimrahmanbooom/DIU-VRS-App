//
//  CreateVenueButtonView.swift
//  DIU VRS
//
//  Created by Fahim Rahman on 12/11/21.
//

import SwiftUI

// MARK: - Create Venue Button View
struct CreateVenueButtonView: View {
    
    // MARK: - Properties
    @State private var createVenueResponseModel = CreateVenueResponseModel()
    @ObservedObject var createVenueCredentials: CreateVenueCredentials
    @State private var showAlert = false
    @State private var errorMessage = String()
    
    // body
    var body: some View {
        // groupbox
        GroupBox {
            // vstack
            VStack {
                // button
                Button {
                    // registation action
                    Networking.createVenueRequest(url: URL.createVenueURL, expecting: CreateVenueResponseModel.self, rentAmount: self.createVenueCredentials.rentAmount, seatingCapacity: self.createVenueCredentials.seatingCapacity, venueInfo: self.createVenueCredentials.venueInfo, venueLocation: self.createVenueCredentials.venueLocation, venueName: self.createVenueCredentials.venueName) { result in
                        
                        do {
                            try self.createVenueResponseModel = result.get()
                            
                            DispatchQueue.main.async {
                                if self.createVenueResponseModel.status! >= 200 && self.createVenueResponseModel.status! <= 299 {
                                    self.errorMessage = self.createVenueResponseModel.message ?? ""
                                    self.showAlert = true
                                }
                                else {
                                    self.errorMessage = self.createVenueResponseModel.message ?? ""
                                    self.showAlert = true
                                }
                            }
                        } catch {
                            print(error)
                        }
                    }
                } label: {
                    // hstack
                    HStack {
                        
                        Spacer()
                        
                        Text("Create")
                            .font(.title3)
                            .fontWeight(.semibold)
                            .foregroundColor(.white)
                            .frame(height: 20, alignment: .center)
                            .padding()
                        
                        Spacer()
                    } //: hstack
                    .background(Color.customGreen)
                    .cornerRadius(10)
                } //: button
                .alert(errorMessage, isPresented: $showAlert) {
                    Button("OK", role: .cancel) { }
                }
            } //: vstack
        } //: groupbox
        .padding(10)
    } //: body
}


struct CreateVenueButtonView_Previews: PreviewProvider {
    static var previews: some View {
        CreateVenueButtonView(createVenueCredentials: .init())
            .previewLayout(.sizeThatFits)
    }
}
