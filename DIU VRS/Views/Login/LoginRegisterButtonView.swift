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
    
    @ObservedObject var loginCredentials: LoginCredentials
    @State private var loginResponseModel = LoginResponseModel()
    @State private var errorMessage = String()
    @State private var registrationButtonPressed = false
    @State private var showAlert = false
    
    // body
    var body: some View {
        // groupbox
        GroupBox {
            // vstack
            VStack {
                // button
                Button {
                    // login action
                    Networking.loginRequest(url: URL.loginURL, expecting: LoginResponseModel.self, email: self.loginCredentials.email, password: self.loginCredentials.password) { result in
                        
                        do {
                            try self.loginResponseModel = result.get()
                            
                            DispatchQueue.main.async {
                                
                                if self.loginResponseModel.status! >= 200 && self.loginResponseModel.status! <= 299 {
                                    // check if admin
                                    if self.loginResponseModel.data?.admin ?? false {
                                        
                                        UserDefaults.standard.set(self.loginCredentials.email, forKey: "email")
                                        UserDefaults.standard.set(self.loginResponseModel.data?.token, forKey: "token")
                                        
                                        self.adminLoggedIn = true
                                    }
                                    else {
                                        
                                        UserDefaults.standard.set(self.loginCredentials.email, forKey: "email")
                                        UserDefaults.standard.set(self.loginResponseModel.data?.token, forKey: "token")
                                        
                                        self.userLoggedIn = true
                                    }
                                }
                                else {
                                    self.errorMessage = self.loginResponseModel.message ?? ""
                                    self.showAlert = true
                                }
                            }

                        } catch {
                            print(error)
                        }
                    }
                    
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
        LoginRegisterButtonView(loginCredentials: .init())
            .previewLayout(.sizeThatFits)
    }
}
