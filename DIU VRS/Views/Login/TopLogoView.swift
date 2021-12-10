//
//  TopLogoView.swift
//  DIU VRS
//
//  Created by Fahim Rahman on 12/10/21.
//

import SwiftUI

// MARK: Top Logo View
struct TopLogoView: View {
    
    // MARK: - properties
    @State private var isAnimated: Bool = false
    
    // body
    var body: some View {
        // hstack
        HStack(alignment: .center, spacing: 0) {
            // image
            Image("diuLogo")
                .resizable()
                .frame(width: 50, height: 50)
                .padding(.leading, 10)
                .opacity(isAnimated ? 1 : 0)
                .offset(x: isAnimated ? 0 : -25, y: 0)
                .onAppear(perform: {
                    withAnimation(.easeOut(duration: 0.5)) {
                        isAnimated = true
                    }
                })
            
            // text
            Text("Venue Reservation System")
                .foregroundColor(.customBlue)
                .font(.title3)
                .fontWeight(.heavy)
                .padding([.top, .bottom, .leading])
            
            Spacer()
        } //: hstack
        
    } //: body
}


// MARK: - Preview
struct TopLogoView_Previews: PreviewProvider {
    static var previews: some View {
        TopLogoView()
            .previewLayout(.sizeThatFits)
    }
}
