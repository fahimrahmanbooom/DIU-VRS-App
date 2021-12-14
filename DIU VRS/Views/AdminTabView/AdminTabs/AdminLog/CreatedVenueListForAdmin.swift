//
//  CreatedVenueList.swift
//  DIU VRS
//
//  Created by Fahim Rahman on 12/11/21.
//

import SwiftUI

// MARK: - Created Venue List
struct CreatedVenueListForAdmin: View {
    
    // MARK: - Properties
    @Binding var getVenueResponseModel: GetVenueResponseModel
    
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
                            
//                            // Venue Info
//                            Text("Venue Info: \(item.venueInfo ?? "")")
//                                .foregroundColor(.black)
//                                .font(.subheadline)
//                                .bold()
//                                .padding(.vertical, 5)
                            
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
                            
                            // reservation activation
                            Text("Reservation Activated: \(String(item.active ?? false))")
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
            .padding(10)
        } //: foreach
    }
}


// MARK: - Preview
struct CreatedVenueList_Previews: PreviewProvider {
    static var previews: some View {
        CreatedVenueListForAdmin(getVenueResponseModel: .constant(GetVenueResponseModel.init()))
    }
}
