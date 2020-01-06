//
//  PostView.swift
//  LennyMessaging
//
//  Created by The Spiridon's on 05/01/2020.
//  Copyright © 2020 The Spiridon's. All rights reserved.
//

import SwiftUI

struct PostView: View {
    let model: PostModel

    var body: some View {
        VStack(alignment: .leading) {
            /// Post title
            Text(model.title)
                .font(.title)
                .lineLimit(Int.max)
                .padding()
                .fixedSize(horizontal: false, vertical: true)

            /// Post body
            Text(model.body)
                .padding([.leading, .trailing, .bottom])
        }
    }
}

struct PostView_Previews: PreviewProvider {
    static var previews: some View {
        PostView(model: PostModel.sample())
            .previewLayout(.sizeThatFits)
    }
}
