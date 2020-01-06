//
//  CommentModel.swift
//  LennyMessaging
//
//  Created by The Spiridon's on 06/01/2020.
//  Copyright © 2020 The Spiridon's. All rights reserved.
//

import Foundation

/// A model to represent the data for our comment view cell in the comments list view

struct CommentModel: Codable {
    let id: Int
    let name: String
    let email: String
    let body: String

    init(id: Int, name: String, email: String, body: String) {
        self.id = id
        self.name = name
        self.email = email
        self.body = body
    }
}

/// provide default preview values

extension CommentModel {
    static func sample() -> CommentModel {
        return CommentModel(id: 1,
                            name: "id labore ex et quam laborum",
                            email: "Eliseo@gardner.biz",
                            body: "laudantium enim quasi est quidem magnam voluptate ipsam eos\ntempora quo necessitatibus\ndolor quam autem quasi\nreiciendis et nam sapiente accusantium")
    }

    static func allSamples() -> [CommentModel] {
        return [sample(),
                sample(),
                sample(),
                sample(),
                sample(),
                sample()]
    }
}
