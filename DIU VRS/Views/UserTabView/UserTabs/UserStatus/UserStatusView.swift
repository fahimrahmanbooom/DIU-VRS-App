//
//  UserStatusView.swift
//  DIU VRS
//
//  Created by Fahim Rahman on 12/10/21.
//

import SwiftUI

// MARK: - User Status View
struct UserStatusView: View {

    // MARK: - Properties
    @State private var reservationResponseModel = ReservationResponseModel()
    @Environment(\.openURL) var openURL
    
    var body: some View {
        // navigation
        NavigationView {
            // scroll view
            ScrollView(.vertical, showsIndicators: false) {
                // vstack
                VStack {
                    // hstack
                    HStack {
                        // text
                        Text("Reserved venue(s)")
                            .foregroundColor(.customGreen)
                            .font(.system(size: 35, weight: .bold, design: .default))

                        Spacer()
                        
                    } //: hstack
                    .padding()

                    Spacer()
                    
                    // foreach
                    ForEach(self.reservationResponseModel.data ?? []) { item in
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
                                        Text("Name: \(item.reserversName ?? "")")
                                            .foregroundColor(.black)
                                            .font(.subheadline)
                                            .bold()
                                            .padding(.vertical, 5)

                                        // Venue Info
                                        Text("Phone: \(item.reserversPhoneNo ?? "")")
                                            .foregroundColor(.black)
                                            .font(.subheadline)
                                            .bold()
                                            .padding(.vertical, 5)

                                        // rent amount
                                        Text("Payment Amount: ৳\(item.paymentAmount ?? 0)")
                                            .foregroundColor(.black)
                                            .font(.subheadline)
                                            .bold()
                                            .padding(.vertical, 5)

                                        // Seat Capacity
                                        Text("Status: \(item.status ?? "")")
                                            .foregroundColor(.black)
                                            .font(.subheadline)
                                            .bold()
                                            .padding(.vertical, 5)

                                        // reservation activation
                                        Text("Paid: \(String(item.paid ?? false))")
                                            .foregroundColor(.black)
                                            .font(.subheadline)
                                            .bold()
                                            .padding(.vertical, 5)

                                        
                                        // pay now button
                                        Button {
                                            openURL((URL(string: "https://sandbox.sslcommerz.com/gwprocess/v3/gw.php?Q=PAY&SESSIONKEY=67384298A54EC4983CBAB2B6438039F1") ?? URL(string:"https://fahimrahman.tech/"))!)
                                        } label: {
                                            Text("Pay Now")
                                                .font(.caption)
                                                .fontWeight(.semibold)
                                                .foregroundColor(.white)
                                                .frame(width: 60, height: 5,  alignment: .center)
                                                .padding()
                                        }
                                        .background(Color.customGreen)
                                        .cornerRadius(10)

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
                    
                    Spacer()
                    
                } //: vstack
            } //: scroll view
            .clipped()
            .navigationBarHidden(true)
        } //: navigation
        .task {
            // load created venues data
            loadReservedVenues()
        }
    } //: body
    
    // loadCreatedVenues
    private func loadReservedVenues() {
        Networking.getRequest(url: URL.getReservationURL, token: UserDefaults.standard.string(forKey: "token"), expecting: ReservationResponseModel.self, completion: { result in
            do {
                try self.reservationResponseModel = result.get()
                print(self.reservationResponseModel)
            } catch {
                print(error)
            }
        })
    }
}


// MARK: - Previews
struct UserStatusView_Previews: PreviewProvider {
    static var previews: some View {
        UserStatusView()
    }
}
