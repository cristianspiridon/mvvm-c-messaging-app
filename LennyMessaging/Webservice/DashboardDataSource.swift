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

    init(networkManager: Network = Network()) {
        network = networkManager
    }

    func loadAllPostsData(forced _: Bool = false, completion: @escaping (Result<[PostReponse], NetworkError>) -> Void) {
        network.fetchPosts { [weak self] result in
            guard self != nil else {
                completion(.failure(.unknown(nil)))
                return
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
