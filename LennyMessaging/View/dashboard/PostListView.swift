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
    @State private var showModal: Bool = false

    init(viewModel: PostListViewModel) {
        self.viewModel = viewModel
        UITableView.appearance().separatorColor = .clear
    }

    var body: some View {
        OrderedPostListView(posts: self.viewModel.posts)

            .onAppear(perform: fetch)
            .navigationBarTitle("Posts")
            .navigationBarItems(trailing: Button(action: showAddPost) {
                Text("New Post")
                Image(systemName: "plus")
            })

            .sheet(isPresented: $showModal) {
                AddPostView(isPresented: self.$showModal)
            }
    }

    private func fetch() {
        viewModel.fetchPosts()
    }

    private func showAddPost() {
        print("set showModal to true")
        showModal = true
    }
}

struct PostListView_Previews: PreviewProvider {
    static var previews: some View {
        PostListView(viewModel: PostListViewModel(posts: PostModel.allSamples()))
    }
}

struct OrderedPostListView: View {
    let posts: [PostModel]
    var body: some View {
        List {
            ForEach(posts, id: \.id) { post in
                NavigationLink(destination: CommentsListView(viewModel: CommentsListViewModel(post: post, comments: []))) {
                    PostView(model: post)
                }
            }
        }
    }
}
