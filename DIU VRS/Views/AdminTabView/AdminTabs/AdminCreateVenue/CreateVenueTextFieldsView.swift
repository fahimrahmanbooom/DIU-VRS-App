//
//  CreateVenueTextFieldsView.swift
//  DIU VRS
//
//  Created by Fahim Rahman on 12/11/21.
//

import SwiftUI

// MARK: - Enum Field
private enum Field: Hashable {
    case rentAmount, seatingCapacity, venueInfo, venueLocation, venueName
}


// MARK: - Create Venue TextFields View
struct CreateVenueTextFieldsView: View {
    
    // MARK: Properties
    @FocusState private var focusedField: Field?
    
    @ObservedObject var createVenueCredentials: CreateVenueCredentials
    
    // body
    var body: some View {
        // group box
        GroupBox {
            // vstack
            VStack {
                // hstack
                HStack {
                    // icon
                    Image(systemName: "note.text")
                        .resizable()
                        .foregroundColor(.customGreen)
                        .frame(width: 25, height: 25)
                    
                    // text input field
                    TextField("Venue Name", text: $createVenueCredentials.venueName)
                        .padding([.top, .bottom, .trailing], 20)
                        .padding(.leading, 10)
                        .keyboardType(.default)
                        .focused($focusedField, equals: .venueName)
                    
                } //: hstack
                .padding(.top, 0)
                
                // hstack
                HStack {
                    // icon
                    Image(systemName: "location.circle")
                        .resizable()
                        .foregroundColor(.customGreen)
                        .frame(width: 25, height: 25)
                    
                    // text input field
                    TextField("Venue Location", text: $createVenueCredentials.venueLocation)
                        .padding([.top, .bottom, .trailing], 20)
                        .padding(.leading, 10)
                        .keyboardType(.default)
                        .focused($focusedField, equals: .venueLocation)
                    
                } //: hstack
                .padding(.top, 0)
                
                // hstack
                HStack {
                    // icon
                    Image(systemName: "info.circle.fill")
                        .resizable()
                        .foregroundColor(.customGreen)
                        .frame(width: 25, height: 25)
                    
                    // text input field
                    TextField("Venue Info", text: $createVenueCredentials.venueInfo)
                        .padding([.top, .bottom, .trailing], 20)
                        .padding(.leading, 10)
                        .keyboardType(.default)
                        .focused($focusedField, equals: .venueInfo)
                    
                } //: hstack
                .padding(.top, 0)
                
                // hstack
                HStack {
                    // icon
                    Image(systemName: "square.grid.3x3.square")
                        .resizable()
                        .foregroundColor(.customGreen)
                        .frame(width: 25, height: 25)
                    
                    // text input field
                    TextField("Seating Capacity", text: $createVenueCredentials.seatingCapacity)
                        .padding([.top, .bottom, .trailing], 20)
                        .padding(.leading, 10)
                        .keyboardType(.namePhonePad)
                        .focused($focusedField, equals: .seatingCapacity)
                        
                } //: hstack
                .padding(.bottom, 0)
                
                // hstack
                HStack {
                    // icon
                    Image(systemName: "coloncurrencysign.circle.fill")
                        .resizable()
                        .foregroundColor(.customGreen)
                        .frame(width: 25, height: 25)
                    
                    // text input field
                    TextField("Rent Amount", text: $createVenueCredentials.rentAmount)
                        .padding([.top, .bottom, .trailing], 20)
                        .padding(.leading, 10)
                        .keyboardType(.namePhonePad)
                        .focused($focusedField, equals: .rentAmount)
                        
                } //: hstack
                .padding(.bottom, 0)
                
            } //: vstack
            .task  {
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                    self.focusedField = .venueName
                } //: DispatchQueue
            } //: task
        } //: group box
        .padding([.leading, .trailing], 10)
    }
}



// MARK: Preview
struct CreateVenueTextFieldsView_Previews: PreviewProvider {
    static var previews: some View {
        CreateVenueTextFieldsView(createVenueCredentials: .init())
            .previewLayout(.sizeThatFits)
    }
}

