//
//  RequestConfiguration.swift
//
//  Created by Bliss on 14/04/2020.
//  Copyright © 2020 nimble. All rights reserved.
//

import Alamofire

final class RequestConfiguration {

    let method: HTTPMethod
    let url: URLConvertible
    let headers: HTTPHeaders
    let parameters: Parameters?
    let parameterEncoding: ParameterEncoding

    init(
        method: HTTPMethod,
        url: URLConvertible,
        headers: [String: String] = [:],
        testHeaders: [String: String] = [:],
        parameters: Parameters? = nil,
        parameterEncoding: ParameterEncoding = JSONEncoding.default
    ) {
        self.method = method
        self.url = url
        self.headers = HTTPHeaders(headers)
        self.parameters = parameters
        self.parameterEncoding = parameterEncoding
    }
}
