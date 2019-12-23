//
//  CreateUserViewModel.swift
//  LennyMessaging
//
//  Created by The Spiridon's on 23/12/2019.
//  Copyright © 2019 The Spiridon's. All rights reserved.
//

import Foundation
import SwiftUI
import Combine

class CreateUserViewModel:ObservableObject {
    @Published var name:String = ""
    var imageURL:String {
        return "https://api.adorable.io/avatars/150/\(name)"
    }
}
