//
//  PostListView.swift
//  LennyMessaging
//
//  Created by The Spiridon's on 05/01/2020.
//  Copyright © 2020 The Spiridon's. All rights reserved.
//

import SwiftUI

struct PostListView: View {
    
    @ObservedObject var viewModel:PostListViewModel
    
    var body: some View {
        List {
            ForEach(self.viewModel.posts, id: \.id) { post in
                PostView(model: post)
            }
        }
    }
}

struct PostListView_Previews: PreviewProvider {
    static var previews: some View {
        PostListView(viewModel: PostListViewModel(posts: PostModel.allSamples()))
    }
}
