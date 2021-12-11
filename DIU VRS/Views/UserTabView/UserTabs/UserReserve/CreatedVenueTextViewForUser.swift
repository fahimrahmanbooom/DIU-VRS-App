//
//  CreatedVenueTextViewForUser.swift
//  DIU VRS
//
//  Created by Fahim Rahman on 12/11/21.
//

import SwiftUI

// MARK: Create Venue Text View
struct CreatedVenueTextViewForUser: View {
    var body: some View {
        // hstack
        HStack {
            // text
            Text("Venue Selection")
                .foregroundColor(.customGreen)
                .font(.system(size: 35, weight: .bold, design: .default))

            Spacer()
        } //: hstack
        .padding()
    }
}



// MARK: - Preview
struct CreatedVenueTextViewForUser_Preview: PreviewProvider {
    static var previews: some View {
        CreatedVenueTextViewForUser()
            .previewLayout(.sizeThatFits)
    }
}

