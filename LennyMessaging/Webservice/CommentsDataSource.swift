//
//  CommentsDataSource.swift
//  LennyMessaging
//
//  Created by The Spiridon's on 06/01/2020.
//  Copyright © 2020 The Spiridon's. All rights reserved.
//

import Foundation

final class CommentsDataSource {
    private let network: Network

    init(networkManager: Network = Network()) {
        network = networkManager
    }

    func loadAllComments(for _: Int, completion: @escaping (Result<[PostReponse], NetworkError>) -> Void) {
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
    func fetchComments(for postId: Int, completion: @escaping (Result<[PostReponse], NetworkError>) -> Void) {
        fetchModel(endpoint: .comments(postId: "\(postId)"), completion: completion)
    }
}
