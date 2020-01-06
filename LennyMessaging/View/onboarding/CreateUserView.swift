//
//  CreateUserView.swift
//  LennyMessaging
//
//  Created by The Spiridon's on 23/12/2019.
//  Copyright © 2019 The Spiridon's. All rights reserved.
//

import SwiftUI

//  This View should be resopnsible for the creation of the users's avatar.
//  At the moment it's only a working example of what I would do, complete with
//  a webservice example, I'm not saving the username nor the image respons
//  and I'm not passing it to the next screen as it will not be used in the
//  app anymore at this stage

struct CreateUserView: View {
    @ObservedObject var createUserVM = CreateUserViewModel()
    @ObservedObject var keyboard = KeyboardResponder()

    private let postListVM = PostListViewModel(dashboardDataSource: DashboardDataSource(networkManager: Network()))

    var body: some View {
        NavigationView {
            VStack {
                /// Title label
                Text("Let's give you a face")
                    .font(.system(size: 28, weight: .bold, design: Font.Design.default))
                    .foregroundColor(Color.pink)
                    .padding()
                    .multilineTextAlignment(.center)

                // Avatar Image
                URLImage(url: self.createUserVM.imageURL)
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 200, height: 200)
                    .clipShape(Circle())
                    .padding([.top, .bottom], 30)

                // User name Input
                TextField("Enter your username", text: self.$createUserVM.name)
                    .font(.title)
                    .foregroundColor(Color.white)
                    .multilineTextAlignment(.center)
                    .padding(.bottom, keyboard.currentHeight / 2)

                // After we have a valid username let's show the continue button
                NavigationLink(destination: PostListView(viewModel: postListVM)) {
                    Text("Continue")
                }

                .padding([.top], 60)
                .disabled(self.createUserVM.name == "")

            }.frame(minWidth: 9, idealWidth: .infinity, maxWidth: .infinity, minHeight: 0, idealHeight: .infinity, maxHeight: .infinity, alignment: .center)
                .background(Image("background")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .clipShape(Rectangle()))
                .edgesIgnoringSafeArea(.all)
                // tap outside resign first responder
                .onTapGesture {
                    UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
                }
        }
    }
}

struct CreateUserView_Previews: PreviewProvider {
    static var previews: some View {
        CreateUserView()
    }
}
