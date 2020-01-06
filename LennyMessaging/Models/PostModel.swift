//
//  PostModel.swift
//  LennyMessaging
//
//  Created by The Spiridon's on 05/01/2020.
//  Copyright © 2020 The Spiridon's. All rights reserved.
//

import Combine
import Foundation
import SwiftUI

/// A model to represent the data for our post view cells in the dashboard

struct PostModel {
    var id: Int
    var title: String
    var body: String

    init(id: Int, title: String, body: String) {
        self.id = id
        self.title = title
        self.body = body
    }
}

/// provide default preview values

extension PostModel {
    static func sample() -> PostModel {
        return PostModel(id: 1,
                         title: "ea molestias quasi exercitationem repellat qui ipsa sit aut",
                         body: "et iusto sed quo iure\nvoluptatem occaecati omnis eligendi aut ad\nvoluptatem doloribus vel accusantium quis pariatur\nmolestiae porro eius odio et labore et velit aut")
    }

    static func allSamples() -> [PostModel] {
        return [PostModel.sample(),
                PostModel.sample(),
                PostModel.sample(),
                PostModel.sample(),
                PostModel.sample(),
                PostModel.sample(),
                PostModel.sample(),
                PostModel.sample(),
                PostModel.sample(),
                PostModel.sample()]
    }
}
