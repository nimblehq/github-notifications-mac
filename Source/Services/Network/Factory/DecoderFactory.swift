//
//  DecoderFactory.swift
//  Nimblehq
//
//  Created by Bliss on 17/12/20.
//  Copyright © 2020 Nimble. All rights reserved.
//

import Foundation

enum DecoderFactory {

    static func defaultJsonDecoder() -> JSONDecoder {
        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = .iso8601
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        return decoder
    }
}
