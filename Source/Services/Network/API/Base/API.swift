//
//  API.swift
//
//  Created by Bliss on 14/04/2020.
//  Copyright © 2020 nimble. All rights reserved.
//
import Foundation
import Combine

protocol API {

    func url(forEndpoint endpoint: String) -> String
    func performRequest<T: Decodable>(with configuration: RequestConfiguration) -> AnyPublisher<T, Error>
}
