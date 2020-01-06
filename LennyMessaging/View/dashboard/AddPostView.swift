//
//  AddPostView.swift
//  LennyMessaging
//
//  Created by The Spiridon's on 06/01/2020.
//  Copyright © 2020 The Spiridon's. All rights reserved.
//

import SwiftUI

struct AddPostView: View {
    @Binding var isPresented: Bool
    @ObservedObject private var viewModel = AddPostViewModel()

    var body: some View {
        NavigationView {
            VStack {
                Form {
                    Section(header: Text("Title")) {
                        TextField("Enter your title", text: self.$viewModel.title)
                    }
                    Section(header: Text("Body")) {
                        TextField("Enter your body", text: self.$viewModel.body)
                    }
                    HStack {
                        Spacer()
                        Button("Add Post") {
                            self.viewModel.addNewPost()
                            self.isPresented = false
                        }.frame(height: 40)
                        Spacer()
                    }
                    .background(Color(red: 244 / 255, green: 47 / 255, blue: 130 / 255))
                    .foregroundColor(Color.white)
                    .cornerRadius(24)
                    .padding(20)
                }.padding(.top, 60)

                    .navigationBarTitle("Create new post")
            }
        }
    }
}

struct AddPostView_Previews: PreviewProvider {
    static var previews: some View {
        AddPostView(isPresented: .constant(false))
    }
}
