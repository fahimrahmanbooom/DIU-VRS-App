//
//  ReserveVenueButtonView.swift
//  DIU VRS
//
//  Created by Fahim Rahman on 12/11/21.
//

import SwiftUI

// MARK: - Reserve Venue Button View
struct ReserveVenueButtonView: View {
    
    // MARK: - Properties
    @State private var reserveVenueResponseModel = CreateVenueResponseModel()
    @ObservedObject var reserveVenueCredentials: ReserveVenueCredentials
    @State private var showAlert = false
    @State private var errorMessage = String()
    @Binding var date: Int
    @Binding var month: Int
    @Binding var venueId: Int
    
    // body
    var body: some View {
        // groupbox
        GroupBox {
            // vstack
            VStack {
                // button
                Button {
                    // registation action
                    
                    Networking.reserveVenueRequest(url: URL.postReservationURL, expecting: CreateVenueResponseModel.self, token: UserDefaults.standard.string(forKey: "token"), name: reserveVenueCredentials.name, phone: reserveVenueCredentials.phone, date: date, month: month, venueId: venueId) { result in
                        
                        do {
                            try self.reserveVenueResponseModel = result.get()
                            
                            DispatchQueue.main.async {
                                if self.reserveVenueResponseModel.status! >= 200 && self.reserveVenueResponseModel.status! <= 299 {
                                    self.errorMessage = self.reserveVenueResponseModel.message ?? ""
                                    self.showAlert = true
                                }
                                else {
                                    self.errorMessage = self.reserveVenueResponseModel.message ?? ""
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
                        
                        Text("Reserve")
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


struct ReserveVenueButtonView_Previews: PreviewProvider {
    static var previews: some View {
        ReserveVenueButtonView(reserveVenueCredentials: .init(), date: .constant(0), month: .constant(0), venueId: .constant(0))
            .previewLayout(.sizeThatFits)
    }
}
