//
//  API.swift
//
//  Created by Bliss on 14/04/2020.
//  Copyright © 2020 nimble. All rights reserved.
//
import Foundation

protocol API {

    func url(forEndpoint endpoint: String) -> String
    func performRequest(
        with configuration: RequestConfiguration,
        completion: @escaping RequestCompletion<Data>
    ) -> Request
}
