//
//  NetworkService.swift
//  RandomColors
//
//  Created by Nischal Hada on 7/6/18.
//  Copyright © 2018 NischalHada. All rights reserved.
//

import Foundation

protocol NetworkingDataSource: class {
    func loadData(urlString: String, completion: @escaping (Result<Data, ErrorResult>) -> Void) -> URLSessionTask?
    func loadDataWithParameters(urlString: String, parameters: [String: String]?, completion: @escaping (Result<Data, ErrorResult>) -> Void) -> URLSessionTask?
}

final class NetworkService {

    private var session: URLSession!

    init(_ session: URLSession = URLSession(configuration: .default)) {
        self.session = session
    }

    func loadData(urlString: String, completion: @escaping (Result<Data, ErrorResult>) -> Void) -> URLSessionTask? {
        print("urlString:", urlString)
        guard let url = URL(string: urlString) else {
            completion(.failure(.network(string: "Wrong url format")))
            return nil
        }
        var request = NetworkMethod.request(method: .GET, url: url)
        if let reachability =  try? Reachability(),
            reachability.connection == .unavailable {
            request.cachePolicy = .returnCacheDataDontLoad
        }
        let task = self.session.dataTask(with: request) { (data, _, error) in
            if let error = error {
                completion(.failure(.network(string: "An error occured during request :" + error.localizedDescription)))
                return
            }
            if let data = data {
                completion(.success(data))
            }
        }
        task.resume()
        return task
    }

    func loadDataWithParameters(urlString: String, parameters: [String: String]?, completion: @escaping (Result<Data, ErrorResult>) -> Void) -> URLSessionTask? {
        guard let url = URLComponents(string: urlString) else {
            completion(.failure(.network(string: "Wrong url format")))
            return nil
        }
        var components: URLComponents = url

        if let parameters = parameters {
            components.queryItems = parameters.map { (key, value) in
                URLQueryItem(name: key, value: value)
            }
            components.percentEncodedQuery = components.percentEncodedQuery?.replacingOccurrences(of: "+", with: "%2B")
            print(components.url ?? "nil url")
        }

        var request = NetworkMethod.request(method: .GET, url: components.url!)
        if let reachability =  try? Reachability(),
            reachability.connection == .unavailable {
            request.cachePolicy = .returnCacheDataDontLoad
        }
        let task = self.session.dataTask(with: request) { (data, _, error) in
            if let error = error {
                completion(.failure(.network(string: "An error occured during request :" + error.localizedDescription)))
                return
            }
            if let data = data {
                completion(.success(data))
            }
        }
        task.resume()
        return task
    }
}
