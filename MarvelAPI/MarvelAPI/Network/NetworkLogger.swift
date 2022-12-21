//
//  NetworkLogger.swift
//  MarvelAPI
//
//  Created by Paulo Ricardo de Araujo Vieira on 20/12/22.
//

import os.log

final class NetworkLoggerDecorator: NetworkProtocol {

    let network: NetworkProtocol

    init(network: NetworkProtocol = NetworkDefault()) {
        self.network = network
    }

    func request(scheme: String = "https", host: String, path: String, queryItems: [URLQueryItem] = []) {

        var components = URLComponents()
        components.scheme = scheme
        components.host = host
        components.path = path
        components.queryItems = queryItems

        if #available(iOS 10.0, *) {
            os_log("%@", format(curlRequestFor: components.url, method: "GET", headers: parseQueryItems(queryItems), body: ["Ecample": true]))
            network.request(scheme: scheme, host: host, path: path, queryItems: queryItems)
        }
    }

    private func parseQueryItems(_ queryItems: [URLQueryItem]) -> [String: String] {
        var headers: [String: String] = [:]

        queryItems.forEach { item in
            headers[item.name] = item.value
        }

        return headers
    }

    private func format(
        curlRequestFor url: URL?,
        method: String,
        headers: [String: String],
        body: [String: Any]?
    ) -> String {
        var curlRequest = "\n🔗 curl -X \(method) \\\n"
        for (header, value) in headers {
            curlRequest += "\t-H '\(header): \(value)' \\\n"
        }
        if let body = body,
           let jsonBody = try? JSONSerialization.data(withJSONObject: body),
           let formattedBody = String(data: jsonBody, encoding: .utf8) {
            curlRequest += "\t-d '\(formattedBody)' \\\n"
        }
        curlRequest += "\t'\(url?.absoluteString ?? "")'"

        return curlRequest
    }
}
