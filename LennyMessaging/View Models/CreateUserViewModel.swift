//
//  CreateUserViewModel.swift
//  LennyMessaging
//
//  Created by The Spiridon's on 23/12/2019.
//  Copyright © 2019 The Spiridon's. All rights reserved.
//

import Combine
import Foundation
import SwiftUI

class CreateUserViewModel: ObservableObject {
    @Published var name: String = "" {
        didSet {
            if name.contains(" ") {
                name = name.replacingOccurrences(of: " ", with: "")
            }
        }
    }

    var imageURL: String {
        return "https://api.adorable.io/avatars/150/\(name)"
    }
}
