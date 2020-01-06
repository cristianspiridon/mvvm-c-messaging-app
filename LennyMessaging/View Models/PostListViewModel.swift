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

    private let dataSource: DashboardDataSource

    init(dashboardDataSource: DashboardDataSource) {
        dataSource = dashboardDataSource
    }

    convenience init(posts: [PostModel], dataSource: DashboardDataSource) {
        self.init(dashboardDataSource: dataSource)
        self.posts = posts
    }

    func fetchPosts() {
        print("fetch data")
    }
}
