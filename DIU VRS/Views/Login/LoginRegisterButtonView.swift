//
//  LoginRegisterButtonView.swift
//  DIU VRS
//
//  Created by Fahim Rahman on 12/10/21.
//

import SwiftUI

// MARK: - Login Register Button View
struct LoginRegisterButtonView: View {
    
    // MARK: - Properties
    @AppStorage("adminLoggedIn") var adminLoggedIn: Bool?
    @AppStorage("userLoggedIn") var userLoggedIn: Bool?
    
    @State private var registrationButtonPressed = false
    
    // body
    var body: some View {
        // groupbox
        GroupBox {
            // vstack
            VStack {
                // button
                Button {
                    // login action
                    //adminLoggedIn = true or userLoggedIn = true
                    
                } label: {
                    // hstack
                    HStack {
                        
                        Spacer()
                        
                        Text("Login")
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
                
                // button
                Button {
                    self.registrationButtonPressed = true
                } label: {
                    // hstack
                    HStack {
                        
                        Spacer()
                        
                        Text("Register")
                            .fontWeight(.semibold)
                            .foregroundColor(.customGreen)
                            .frame(height: 20, alignment: .center)
                            .padding([.horizontal, .top])
                            .padding(.bottom, 10)
                        
                        Spacer()
                    } //: hstack
                    .cornerRadius(10)
                } //: button
                
                // button
                Button {
                    // forgot password
                } label: {
                    // hstack
                    HStack {
                        
                        Spacer()
                        
                        Text("Forgot Password?")
                            .fontWeight(.regular)
                            .font(.caption)
                            .foregroundColor(.customGreen)
                            .frame(height: 30, alignment: .center)
                            .padding(.horizontal)
                        
                        Spacer()
                    } //: hstack
                    .cornerRadius(10)
                } //: button
                
            } //: vstack
        } //: groupbox
        .padding(10)
        
        // go to registration
        NavigationLink(destination: RegistrationView(), isActive: $registrationButtonPressed) {
        }
        .navigationBarTitle("Venue Reservation System", displayMode: .inline)
        .navigationBarHidden(true)
    } //: body
}


struct LoginRegisterButtonView_Previews: PreviewProvider {
    static var previews: some View {
        LoginRegisterButtonView()
            .previewLayout(.sizeThatFits)
    }
}
