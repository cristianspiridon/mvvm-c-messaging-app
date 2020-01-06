//
//  PostListViewModel.swift
//  LennyMessaging
//
//  Created by The Spiridon's on 05/01/2020.
//  Copyright © 2020 The Spiridon's. All rights reserved.
//

import Combine
import Foundation
import SwiftUI

class PostListViewModel: ObservableObject {
    @Published var posts = [PostModel]()

    private let dataSource: DashboardDataSource = DashboardDataSource(networkManager: Network())

    init() {}

    convenience init(posts: [PostModel]) {
        self.init()
        self.posts = posts
    }

    func fetchPosts() {
        dataSource.loadAllPostsData { [weak self] result in
            switch result {
            case let .success(response):
                DispatchQueue.main.async {
                    self?.posts = response.compactMap { PostModel(id: $0.id, title: $0.title, body: $0.body) }
                }
            case let .failure(error):
                print("We have an error, ", error)
            }
        }
    }
}
