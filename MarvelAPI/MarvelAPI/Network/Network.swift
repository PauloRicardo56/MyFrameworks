//
//  Network.swift
//  MarvelAPI
//
//  Created by Paulo Ricardo de Araujo Vieira on 20/12/22.
//

protocol NetworkProtocol {
    func request(scheme: String, host: String, path: String, queryItems: [URLQueryItem])
}

final class NetworkDefault: NetworkProtocol {

    func request(scheme: String = "https", host: String, path: String, queryItems: [URLQueryItem] = []) {

        var components = URLComponents()
        components.scheme = scheme
        components.host = host
        components.path = path
        components.queryItems = queryItems
        
        URLSession.shared.dataTask(with: components.url!) { data, response, error in
            if let response = response {

            } else {

            }
        }.resume()
    }
}
