//
//  Digest.swift
//  MarvelAPI
//
//  Created by Paulo Ricardo de Araujo Vieira on 20/12/22.
//

import Foundation
import CryptoKit

final class Digest {

    func md5(value: String) -> String {
        if #available(iOS 13.0, *) {
            let digest = Insecure.MD5.hash(data: value.data(using: .utf8)!)
            return digest.map { String(format: "%02hhx", $0) }.joined()
        } else {
            return ""
        }
    }
}
