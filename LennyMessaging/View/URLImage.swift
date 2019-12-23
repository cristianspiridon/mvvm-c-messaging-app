//
//  URLImage.swift
//  Xcode-Previews
//
//  Created by The Spiridon's on 22/12/2019.
//  Copyright © 2019 The Spiridon's. All rights reserved.
//

import Foundation
import SwiftUI
import Combine

struct URLImage: View {
    
    @ObservedObject private var imageLoader = ImageLoader()
    let placeHolder: Image
    
    init(url:String, placeholder:Image = Image(systemName: "photo")){
        self.placeHolder = placeholder
        self.imageLoader.load(url: url)
    }
    
    var body: some View {
            if let image = imageLoader.downloadedImage {
                return Image(uiImage:image).resizable()
            } else {
                return placeHolder
            }
    }
}

struct URLImage_Previews:PreviewProvider {
    static var previews:some View {
        
        Group {
        // preview for when we show the placeholder
        URLImage(url: "somebadurl")
            .previewLayout(.sizeThatFits)
        
        // with valid image url
        URLImage(url: "ps://api.adorable.io/avatars/285/abott@adorable.png")
            .previewLayout(.sizeThatFits)
        }
    }
}

