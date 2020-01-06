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
    private var allPosts: AllPosts?

    init(networkManager: Network = Network()) {
        network = networkManager
    }

    func loadAllPostsData(forced: Bool = false, completion: @escaping (Result<AllPosts, NetworkError>) -> Void) {
        if let posts = allPosts, !forced {
            completion(.success(posts))
            return
        }

        network.fetchAllPosts { [weak self] result in
            guard let self = self else {
                completion(.failure(.unknown(nil)))
                return
            }

            if case let Result.success(downloadedPosts) = result {
                self.allPosts = downloadedPosts
            }

            completion(result)
        }
    }
}

extension Network {
    func fetchAllPosts(completion: @escaping (Result<AllPosts, NetworkError>) -> Void) {
        fetchModel(endpoint: .posts, completion: completion)
    }
}
