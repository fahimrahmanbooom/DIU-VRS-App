//
//  LoginCredentialsView.swift
//  DIU VRS
//
//  Created by Fahim Rahman on 12/10/21.
//

import SwiftUI

// MARK: - Enum Field
private enum Field: Hashable {
    case email, password
}


// MARK: - Login Credential View
struct LoginCredentialsView: View {
    
    // MARK: Properties
    @FocusState private var focusedField: Field?
    
    @ObservedObject var loginCredentials: LoginCredentials
    
    // body
    var body: some View {
        // group box
        GroupBox {
            // vstack
            VStack {
                // hstack
                HStack {
                    // icon
                    Image(systemName: "person.fill")
                        .resizable()
                        .foregroundColor(.customGreen)
                        .frame(width: 25, height: 25)
                    
                    // text input field
                    TextField("Email", text: $loginCredentials.email)
                        .padding([.top, .bottom, .trailing], 20)
                        .padding(.leading, 10)
                        .keyboardType(.emailAddress)
                        .focused($focusedField, equals: .email)
                    
                } //: hstack
                .padding(.top, 0)
                
                // hstack
                HStack {
                    // icon
                    Image(systemName: "lock.fill")
                        .resizable()
                        .foregroundColor(.customGreen)
                        .frame(width: 20, height: 26)
                    
                    // text input field
                    SecureField("Password", text: $loginCredentials.password)
                        .padding([.top, .bottom, .trailing], 20)
                        .padding(.leading, 15)
                        .focused($focusedField, equals: .password)
                        
                } //: hstack
                .padding(.bottom, 0)
            } //: vstack
            .task  {
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                    self.focusedField = .email
                } //: DispatchQueue
            } //: task
        } //: group box
        .padding([.leading, .trailing], 10)
    }
}



// MARK: Preview
struct LoginCredentialView_Previews: PreviewProvider {
    static var previews: some View {
        LoginCredentialsView(loginCredentials: .init())
            .previewLayout(.sizeThatFits)
    }
}
