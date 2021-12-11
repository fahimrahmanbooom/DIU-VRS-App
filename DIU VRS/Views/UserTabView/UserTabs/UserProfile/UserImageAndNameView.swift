//
//  UserImageAndNameView.swift
//  DIU VRS
//
//  Created by Fahim Rahman on 12/11/21.
//

import SwiftUI

// MARK: - User Image and Name View
struct UserImageAndNameView: View {
    
    // MARK: - Properties
    @AppStorage("adminLoggedIn") var adminLoggedIn: Bool?
    @AppStorage("userLoggedIn") var userLoggedIn: Bool?
    @Binding var getProfileResponseModel: GetProfileResponseModel
    
    // body
    var body: some View {
        // vstack
        VStack {
            
            Spacer()
            
            // groupbox
            GroupBox {
                // vstack
                VStack {
                    // image
                    Image(systemName: "person.crop.circle")
                        .resizable()
                        .frame(width: 70, height: 70)
                        .font(Font.title.weight(.thin))
                        .foregroundColor(.customGreen)
                        .padding()
                    
                    // text
                    Text(getProfileResponseModel.data?.name ?? "")
                        .font(.title)
                        .fontWeight(.semibold)
                        .foregroundColor(.black)
                        .padding()
                    
                    // text
                    Text(getProfileResponseModel.data?.email ?? "")
                        .font(.title2)
                        .fontWeight(.semibold)
                        .foregroundColor(.black)
                        .padding()
                    
                    // text
                    Text(getProfileResponseModel.data?.phoneNo ?? "")
                        .font(.title2)
                        .fontWeight(.semibold)
                        .foregroundColor(.black)
                        .padding()
                    
                } //: vstack
                .frame(maxWidth: .infinity)
            } //: groupbox
            .padding(10)
            
            // groupbox
            GroupBox {
                // vstack
                VStack(spacing: 25) {
                    // button
                    Button {
                        // show sheet from bottom
                    } label: {
                        // hstack
                        HStack {
                            
                            Spacer()
                            
                            Text("About")
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
                        // logout
                        self.adminLoggedIn = false
                        self.userLoggedIn = false
                    } label: {
                        // hstack
                        HStack {
                            
                            Spacer()
                            
                            Text("Logout")
                                .font(.title3)
                                .fontWeight(.semibold)
                                .foregroundColor(.customGreen)
                                .frame(height: 20, alignment: .center)
                                .padding()
                            
                            Spacer()
                        } //: hstack
                        .cornerRadius(10)
                    } //: button
                } //: vstack
                .frame(maxWidth: .infinity)
            } //: groupbox
            .padding(10)
            
            Spacer()
            
            // hstack
            HStack {
                // vstack
                VStack {
                    
                    Text("Made by Alpha Q")
                        .font(.caption)
                        .fontWeight(.semibold)
                        .foregroundColor(.black)
                        .frame(height: 20, alignment: .center)
                        .padding([.horizontal, .top])
                    Text("🇧🇩")
                        .font(.caption)
                        .padding([.horizontal])
                    
                } //: vstack
            } //: hstack
            .frame(maxWidth: .infinity)
            .padding(10)
        } //: vstack
    } //: body
}


// MARK: - Preview
struct UserImageAndNameView_Previews: PreviewProvider {
    static var previews: some View {
        AdminImageAndNameView(getProfileResponseModel: .constant(GetProfileResponseModel.init()))
    }
}
