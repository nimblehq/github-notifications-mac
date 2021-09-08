//
//  Errorable.swift
//  Nimblehq
//
//  Created by Bliss on 17/3/21.
//  Copyright © 2021 Nimble. All rights reserved.
//

protocol Errorable: Decodable {

    var error: Error? { get }
    var statusCode: Int? { get set }
}
