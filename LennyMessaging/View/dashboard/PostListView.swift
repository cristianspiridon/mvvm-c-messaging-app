//
//  PostListView.swift
//  LennyMessaging
//
//  Created by The Spiridon's on 05/01/2020.
//  Copyright © 2020 The Spiridon's. All rights reserved.
//

import SwiftUI

struct PostListView: View {
    @ObservedObject var viewModel: PostListViewModel

    init(viewModel: PostListViewModel) {
        self.viewModel = viewModel
    }

    var body: some View {
        VStack {
            List {
                ForEach(self.viewModel.posts, id: \.id) { post in
                    PostView(model: post)
                }
            }
        }.onAppear(perform: fetch)
    }

    private func fetch() {
        viewModel.fetchPosts()
    }
}

struct PostListView_Previews: PreviewProvider {
    static var previews: some View {
        PostListView(viewModel: PostListViewModel(posts: PostModel.allSamples(), dataSource: DashboardDataSource(networkManager: Network())))
    }
}
