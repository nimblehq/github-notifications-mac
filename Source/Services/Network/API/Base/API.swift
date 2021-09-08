//
//  API.swift
//
//  Created by Bliss on 14/04/2020.
//  Copyright © 2020 nimble. All rights reserved.
//
import Foundation

protocol API {

    func url(forEndpoint endpoint: String) -> String
    func url(forEndpoint endpoint: String, baseURL: String) -> String
    func performRequest(
        with configuration: RequestConfiguration,
        completion: @escaping RequestCompletion<Data>
    ) -> Request
    func performRequest<T: Decodable>(
        with configuration: RequestConfiguration,
        specialErrors: SpecialErrorType<T>,
        completion: @escaping RequestCompletion<Data>
    ) -> Request
}
