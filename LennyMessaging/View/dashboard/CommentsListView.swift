//
//  CommentsListView.swift
//  LennyMessaging
//
//  Created by The Spiridon's on 06/01/2020.
//  Copyright © 2020 The Spiridon's. All rights reserved.
//

import SwiftUI

struct CommentsListView: View {
    @ObservedObject var viewModel: CommentsListViewModel
    var body: some View {
        VStack {
            PostView(model: viewModel.post).padding()
            List {
                ForEach(viewModel.comments, id: \.id) { comment in
                    CommentView(commentModel: comment)
                }
            }
        }.onAppear(perform: fetch)
            .navigationBarTitle("Comments")
    }

    private func fetch() {
        viewModel.fetchComents()
    }
}

struct CommentsListView_Previews: PreviewProvider {
    static var previews: some View {
        CommentsListView(viewModel: CommentsListViewModel(post: PostModel.sample(), comments: CommentModel.allSamples()))
    }
}
