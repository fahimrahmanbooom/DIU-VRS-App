//
//  CreateVenueTextView.swift
//  DIU VRS
//
//  Created by Fahim Rahman on 12/11/21.
//

import SwiftUI

// MARK: Create Venue Text View
struct CreateVenueTextView: View {
    var body: some View {
        // hstack
        HStack {
            // text
            Text("Create Venue")
                .foregroundColor(.customGreen)
                .font(.system(size: 35, weight: .bold, design: .default))

            Spacer()
        } //: hstack
        .padding()
    }
}



// MARK: - Preview
struct CreateVenueTextView_Preview: PreviewProvider {
    static var previews: some View {
        CreateVenueTextView()
            .previewLayout(.sizeThatFits)
    }
}
