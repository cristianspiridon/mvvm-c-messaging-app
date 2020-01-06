//
//  ResponseModels.swift
//  LennyMessaging
//
//  Created by The Spiridon's on 06/01/2020.
//  Copyright © 2020 The Spiridon's. All rights reserved.
//

import Foundation

struct PostReponse: Codable {
    let userId: Int
    let id: Int
    let title: String
    let body: String
}

struct CommentResponse: Codable {
    let postId: Int
    let id: Int
    let name: String
    let email: String
    let body: String
}
