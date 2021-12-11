//
//  CreatedVenueListForUser.swift
//  DIU VRS
//
//  Created by Fahim Rahman on 12/11/21.
//

import SwiftUI

// MARK: - Created Venue List
struct CreatedVenueListForUser: View {
    
    // MARK: - Properties
    @Binding var getVenueResponseModel: GetVenueResponseModel
    @ObservedObject var venueIdSelection = VenueIdSelection()
    @State private var goToCalenderView: Bool = false
    
    var body: some View {
        // foreach
        ForEach(self.getVenueResponseModel.data ?? []) { item in
            // groupbox
            GroupBox {
                // vstack
                VStack {
                    // hstack
                    HStack {
                        // vstack
                        VStack(alignment: .leading, spacing: 1) {
                            // hstack
                            HStack {
                                // logo
                                Image(systemName: "person.2.crop.square.stack.fill")
                                    .resizable()
                                    .frame(width: 25, height: 25)
                                    .foregroundColor(.customGreen)
                                
                                // miner name
                                Text(item.venueName ?? "")
                                    .foregroundColor(.black)
                                    .font(.title2)
                                    .bold()
                                    .padding(.vertical, 5)
                            } //: hstack
                            
                            // Location
                            Text("Location: \(item.venueLocation ?? "")")
                                .foregroundColor(.black)
                                .font(.subheadline)
                                .bold()
                                .padding(.vertical, 5)
                            
                            // Venue Info
                            Text("Venue Info: \(item.venueInfo ?? "")")
                                .foregroundColor(.black)
                                .font(.subheadline)
                                .bold()
                                .padding(.vertical, 5)
                            
                            // rent amount
                            Text("Rent Amount: ৳\(item.rentAmount ?? 0)")
                                .foregroundColor(.black)
                                .font(.subheadline)
                                .bold()
                                .padding(.vertical, 5)
                            
                            // Seat Capacity
                            Text("Seat Capacity: \(item.seatingCapacity ?? "")")
                                .foregroundColor(.black)
                                .font(.subheadline)
                                .bold()
                                .padding(.vertical, 5)
                            
                        } //: vstack
                        
                        Spacer()
                        
                    } //: hstack
                    .frame(maxWidth: .infinity)
                    .padding()
                    .cornerRadius(10)
                } //: vstack
            } //: groupbox
            .onTapGesture {
                self.venueIdSelection.venueId = item.id ?? 0
                self.goToCalenderView.toggle()
            }
            .padding(10)
        } //: foreach
        
        NavigationLink(
            LocalizedStringKey("goToCalenderView"), destination: ReserveCalenderView(venueIdSelection: venueIdSelection, reserveVenueCredentials: ReserveVenueCredentials.init()), isActive: $goToCalenderView)
            .navigationBarTitle("Pick Date", displayMode: .inline)
            .navigationBarHidden(true)
            .hidden()
    }
}


// MARK: - Preview
struct CreatedVenueListForUser_Previews: PreviewProvider {
    static var previews: some View {
        CreatedVenueListForUser(getVenueResponseModel: .constant(GetVenueResponseModel.init()))
    }
}

