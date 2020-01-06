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
        UITableView.appearance().separatorColor = .clear
    }

    var body: some View {
        VStack(alignment: .leading) {
            List {
                ForEach(self.viewModel.posts, id: \.id) { post in
                    PostView(model: post)
                }
            }
        }.onAppear(perform: fetch)
            .navigationBarTitle("Posts")
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
