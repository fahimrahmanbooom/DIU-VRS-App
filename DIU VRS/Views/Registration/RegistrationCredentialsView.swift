//
//  RegistrationCredentialsView.swift
//  DIU VRS
//
//  Created by Fahim Rahman on 12/10/21.
//

import SwiftUI

// // MARK: - Enum Field
private enum Field: Hashable {
    case name, email, phone, password
}


// MARK: - Registration Credential View
struct RegistrationCredentialsView: View {
    
    // MARK: Properties
    @FocusState private var focusedField: Field?
    
    @ObservedObject var registrationCredentials: RegistrationCredentials
    
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
                    TextField("Name", text: $registrationCredentials.name)
                        .padding([.top, .bottom, .trailing], 20)
                        .padding(.leading, 10)
                        .keyboardType(.namePhonePad)
                        .focused($focusedField, equals: .name)
                    
                } //: hstack
                .padding(.top, 0)
                
                // hstack
                HStack {
                    // icon
                    Image(systemName: "phone.fill")
                        .resizable()
                        .foregroundColor(.customGreen)
                        .frame(width: 25, height: 25)
                    
                    // text input field
                    TextField("Phone", text: $registrationCredentials.phone)
                        .padding([.top, .bottom, .trailing], 20)
                        .padding(.leading, 10)
                        .keyboardType(.phonePad)
                        .focused($focusedField, equals: .phone)
                    
                } //: hstack
                .padding(.top, 0)
                
                // hstack
                HStack {
                    // icon
                    Image(systemName: "person.fill")
                        .resizable()
                        .foregroundColor(.customGreen)
                        .frame(width: 25, height: 25)
                    
                    // text input field
                    TextField("Email", text: $registrationCredentials.email)
                        .padding([.top, .bottom, .trailing], 20)
                        .padding(.leading, 10)
                        .keyboardType(.namePhonePad)
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
                    SecureField("Password", text: $registrationCredentials.password)
                        .padding([.top, .bottom, .trailing], 20)
                        .padding(.leading, 15)
                        .focused($focusedField, equals: .password)
                        
                } //: hstack
                .padding(.bottom, 0)
                
            } //: vstack
            .task  {
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                    self.focusedField = .name
                } //: DispatchQueue
            } //: task
        } //: group box
        .padding([.leading, .trailing], 10)
    }
}



// MARK: Preview
struct RegistrationCredentialView_Previews: PreviewProvider {
    static var previews: some View {
        RegistrationCredentialsView(registrationCredentials: .init())
            .previewLayout(.sizeThatFits)
    }
}
