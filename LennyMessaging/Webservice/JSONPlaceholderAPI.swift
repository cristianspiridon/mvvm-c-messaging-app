//
//  JSONPlaceholderAPI.swift
//  LennyMessaging
//
//  Created by The Spiridon's on 06/01/2020.
//  Copyright © 2020 The Spiridon's. All rights reserved.
//

import Foundation

let baseURL = URL(string: "https://jsonplaceholder.typicode.com")!

enum Endpoint {
    case posts
    case comments(postId: String)

    var path: String {
        switch self {
        case .posts: return "/posts"
        case let .comments(postId): return "/posts/\(postId)/comments"
        }
    }
}

enum NetworkError: Error {
    case badURL
    case noData
    case decoding(Error)
    case unknown(Error?)
}

final class Network {
    private let session: URLSession

    init(session: URLSession = .shared) {
        self.session = session
    }

    func fetchModel<T: Decodable>(endpoint: Endpoint, completion: @escaping (Result<
        T, NetworkError
    >) -> Void) {
        guard let url = URL(string: endpoint.path, relativeTo: baseURL) else {
            completion(.failure(.badURL))
            return
        }

        session.dataTask(with: url) { data, _, error in
            if let error = error {
                completion(.failure(.unknown(error)))
                return
            }

            let decoder = JSONDecoder()

            guard let jsonData = data else {
                completion(.failure(.noData))
                return
            }

            do {
                let model = try decoder.decode(T.self, from: jsonData)
                completion(.success(model))
            } catch {
                completion(.failure(.decoding(error)))
            }
        }.resume()
    }
}
