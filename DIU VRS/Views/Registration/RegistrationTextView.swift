//
//  RegistrationTextView.swift
//  DIU VRS
//
//  Created by Fahim Rahman on 12/10/21.
//

import SwiftUI

struct RegistrationTextView: View {
    var body: some View {
        // hstack
        HStack {
            // text
            Text("Registration")
                .foregroundColor(.customGreen)
                .font(.system(size: 35, weight: .bold, design: .default))
            
            Spacer()
        } //: hstack
        .padding([.leading, .trailing], 10)
    }
}

// MARK: - Preview
struct RegistrationTextView_Preview: PreviewProvider {
    static var previews: some View {
        RegistrationTextView()
            .previewLayout(.sizeThatFits)
    }
}
