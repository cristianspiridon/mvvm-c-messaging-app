//
//  CommentsListViewModel.swift
//  LennyMessaging
//
//  Created by The Spiridon's on 06/01/2020.
//  Copyright © 2020 The Spiridon's. All rights reserved.
//

import Foundation
import SwiftUI

class CommentsListViewModel: ObservableObject {
    let post: PostModel
    private let dataSource: CommentsDataSource = CommentsDataSource(networkManager: Network())
    @Published var comments = [CommentModel]()

    init(post: PostModel, comments: [CommentModel]) {
        self.post = post
        self.comments = comments
    }

    func fetchComents() {
        dataSource.loadAllComments(for: post.id) { [weak self] result in
            switch result {
            case let .success(response):
                DispatchQueue.main.async {
                    self?.comments = response.compactMap { CommentModel(id: $0.id,
                                                                        name: $0.name,
                                                                        email: $0.email,
                                                                        body: $0.body) }
                }
            case let .failure(error):
                print("We have an error ", error)
            }
        }
    }
}
