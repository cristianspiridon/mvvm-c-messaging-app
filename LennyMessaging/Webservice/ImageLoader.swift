//
//  ImageLoader.swift
//  Xcode-Previews
//
//  Created by The Spiridon's on 22/12/2019.
//  Copyright © 2019 The Spiridon's. All rights reserved.
//

import Foundation
import SwiftUI
import Combine

class ImageLoader:ObservableObject {
    
    @Published var downloadedImage: UIImage?
    
    func load(url:String) {
        guard let imageURL = URL(string: url) else {
            return
        }
        
        URLSession.shared.dataTask(with: imageURL) { (data, response, error) in
            
            guard let data = data, error == nil else {
                return
            }
            
            if let image = UIImage(data: data) {
                DispatchQueue.main.async {
                    self.downloadedImage = image
                }
                
            }
            
        }.resume()
    }
}
