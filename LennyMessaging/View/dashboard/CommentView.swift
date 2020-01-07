//
//  CommentView.swift
//  LennyMessaging
//
//  Created by The Spiridon's on 06/01/2020.
//  Copyright © 2020 The Spiridon's. All rights reserved.
//

import SwiftUI

struct CommentView: View {
    let commentModel: CommentModel

    var body: some View {
        VStack {
            HStack {
                URLImage(url: "https://api.adorable.io/avatars/150/\(self.commentModel.email)")
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 45, height: 45)
                    .clipShape(Circle())
                    .padding([.top, .bottom], 30)
                    .padding()
                Text(self.commentModel.name)
                Spacer()
            }
            VStack {
                Text(self.commentModel.body)
                    .padding()
                HStack {
                    Spacer()
                }
            }
        }
    }
}

struct CommentView_Previews: PreviewProvider {
    static var previews: some View {
        CommentView(commentModel: CommentModel.sample())
    }
}
