//
//  DigestViewController.swift
//  MarvelAPI
//
//  Created by Paulo Ricardo de Araujo Vieira on 20/12/22.
//

import UIKit

public final class DigestViewController: UIViewController {

    let digest: Digest = .init()
    var network: NetworkProtocol?

    public override func viewDidLoad() {
        super.viewDidLoad()
        view?.backgroundColor = .orange
        let hash = digest.md5(value: "1671577603ca508899f62ba9fd471b4dc7c7f469ecf888cf275442bbc64af8843fade9914bfcc9228f")

        makeRequest(hash: hash)
    }

    func makeRequest(hash: String) {
        network = NetworkLoggerDecorator(network: NetworkDefault())
        let queryItems = [
            URLQueryItem(name: "apikey", value: "5442bbc64af8843fade9914bfcc9228f"),
            URLQueryItem(name: "ts", value: "1671577603"),
            URLQueryItem(name: "hash", value: hash)
        ]
        network?.request(scheme: "https", host: "gateway.marvel.com", path: "/v1/public/characters", queryItems: queryItems)
    }
}
