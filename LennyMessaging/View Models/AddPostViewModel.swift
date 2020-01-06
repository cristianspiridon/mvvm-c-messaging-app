//
//  AddPostViewModel.swift
//  LennyMessaging
//
//  Created by The Spiridon's on 06/01/2020.
//  Copyright © 2020 The Spiridon's. All rights reserved.
//

import Foundation
import SwiftUI

class AddPostViewModel: ObservableObject {
    var title: String = ""
    var body: String = ""

    func addNewPost() {
        print("Add new post")
    }
}
