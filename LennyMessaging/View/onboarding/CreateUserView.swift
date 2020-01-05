//
//  CreateUserView.swift
//  LennyMessaging
//
//  Created by The Spiridon's on 23/12/2019.
//  Copyright © 2019 The Spiridon's. All rights reserved.
//

import SwiftUI

struct CreateUserView: View {
    
    @ObservedObject var createUserVM = CreateUserViewModel()
    
    var body: some View {
        VStack {
            /// Title label
            Text("Let's give you a face")
                .font(.title)
                .foregroundColor(Color.pink)
                .padding()
                .multilineTextAlignment(.center)
            
            // Avatar Image
            URLImage(url: self.createUserVM.imageURL)
                .aspectRatio(contentMode: .fill)
                .frame(width:200, height:200)
                .clipShape(Circle())
            
            //input
            TextField("Enter your username", text: self.$createUserVM.name)
                .font(.title)
                .foregroundColor(Color.white)
                .multilineTextAlignment(.center)
                .padding([.top], 100)
            
        }.frame(minWidth: 9, idealWidth: .infinity, maxWidth: .infinity, minHeight: 0, idealHeight: .infinity, maxHeight: .infinity, alignment: .center)
            .background(Image("background")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .clipShape(Rectangle()))
            .edgesIgnoringSafeArea(.all)
    }}

struct CreateUserView_Previews: PreviewProvider {
    static var previews: some View {
        CreateUserView()
    }
}
