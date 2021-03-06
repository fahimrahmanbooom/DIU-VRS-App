//
//  RegistrationButtonView.swift
//  DIU VRS
//
//  Created by Fahim Rahman on 12/10/21.
//

import SwiftUI

// MARK: - Registration Register Button View
struct RegistrationButtonView: View {
    
    // MARK: - Properties
    @State private var registerationResponseModel = RegistrationResponseModel()
    @ObservedObject var registrationCredentials: RegistrationCredentials
    @State private var showAlert = false
    @State private var errorMessage = String()
    
    // body
    var body: some View {
        // groupbox
        GroupBox {
            // vstack
            VStack {
                // button
                Button {
                    // registation action
                    Networking.registrationRequest(url: URL.registerURL, expecting: RegistrationResponseModel.self, name: self.registrationCredentials.name, email: self.registrationCredentials.email, phone: self.registrationCredentials.phone, password: self.registrationCredentials.password, completion: { result in
                        do {
                            try self.registerationResponseModel = result.get()
                            
                            DispatchQueue.main.async {
                                if self.registerationResponseModel.status! >= 200 && self.registerationResponseModel.status! <= 299 {
                                    
                                    UserDefaults.standard.set(self.registrationCredentials.name, forKey: "name")
                                    UserDefaults.standard.set(self.registrationCredentials.phone, forKey: "phone")
                                    
                                    self.errorMessage = self.registerationResponseModel.message ?? ""
                                    self.showAlert = true
                                }
                                else {
                                    self.errorMessage = self.registerationResponseModel.message ?? ""
                                    self.showAlert = true
                                }
                            }
                        } catch {
                            print(error)
                        }
                    })
                } label: {
                    // hstack
                    HStack {
                        
                        Spacer()
                        
                        Text("Register")
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
                .alert(errorMessage, isPresented: $showAlert) {
                    Button("OK", role: .cancel) { }
                }
            } //: vstack
        } //: groupbox
        .padding(10)
    } //: body
}


struct RegistrationButtonView_Previews: PreviewProvider {
    static var previews: some View {
        RegistrationButtonView(registrationCredentials: .init())
            .previewLayout(.sizeThatFits)
    }
}
