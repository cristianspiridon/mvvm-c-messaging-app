//
//  DashboardDataSource.swift
//  LennyMessaging
//
//  Created by The Spiridon's on 06/01/2020.
//  Copyright © 2020 The Spiridon's. All rights reserved.
//

import Foundation

final class DashboardDataSource {
    private let network: Network
    private var allposts: [PostReponse]?

    init(networkManager: Network = Network()) {
        network = networkManager
    }

    func loadAllPostsData(forced: Bool = false, completion: @escaping (Result<[PostReponse], NetworkError>) -> Void) {
        if let posts = allposts, !forced {
            completion(.success(posts))
            return
        }

        network.fetchPosts { [weak self] result in
            guard let self = self else {
                completion(.failure(.unknown(nil)))
                return
            }

            if case let Result.success(downloadedPosts) = result {
                self.allposts = downloadedPosts
            }

            completion(result)
        }
    }
}

extension Network {
    func fetchPosts(completion: @escaping (Result<[PostReponse], NetworkError>) -> Void) {
        fetchModel(endpoint: .posts, completion: completion)
    }
}
