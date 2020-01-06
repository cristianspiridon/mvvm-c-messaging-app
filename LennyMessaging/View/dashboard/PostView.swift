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
            HStack {
                Spacer()
            }
            /// Post title
            Text(model.title)
                .font(.title)
                .lineLimit(Int.max)
                .padding()
                .fixedSize(horizontal: false, vertical: true)

            /// Post body
            Text(model.body)
                .padding([.leading, .trailing, .bottom])
        }.background(Color.black.opacity(0.1))
            .cornerRadius(12)
    }
}

struct PostView_Previews: PreviewProvider {
    static var previews: some View {
        PostView(model: PostModel.sample())
            .previewLayout(.sizeThatFits)
    }
}
