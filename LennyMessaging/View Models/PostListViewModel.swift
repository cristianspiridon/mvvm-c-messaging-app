//
//  PostListViewModel.swift
//  LennyMessaging
//
//  Created by The Spiridon's on 05/01/2020.
//  Copyright © 2020 The Spiridon's. All rights reserved.
//

import Foundation
import SwiftUI
import Combine

class PostListViewModel:ObservableObject {
    @Published var posts:[PostModel]
    init(posts:[PostModel]){
        self.posts = posts
    }
}
