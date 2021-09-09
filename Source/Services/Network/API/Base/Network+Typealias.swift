//  swiftlint:disable:this file_name
//  Network+Typealias.swift
//  Nimblehq
//
//  Created by Bliss on 14/10/20.
//

import Alamofire

typealias HTTPMethod = Alamofire.HTTPMethod
typealias URLConvertible = Alamofire.URLConvertible
typealias Headers = [String: String]
typealias Parameters = [String: Any]
typealias ParameterEncoding = Alamofire.ParameterEncoding
typealias URLEncoding = Alamofire.URLEncoding
typealias JSONEncoding = Alamofire.JSONEncoding
typealias RequestAdapterProtocol = Alamofire.RequestAdapter
typealias RequestRetrierProtocol = Alamofire.RequestRetrier
typealias RequestCompletion<T> = (Result<T, Error>) -> Void
typealias CompletionHandler = () -> Void
typealias ResultWithErrorCompletion<Response: Decodable, ErrorResponse: Decodable> =
    (Result<(Response, ErrorResponse), Error>) -> Void
typealias ValueHandler<T> = (T) -> Void
typealias SpecialErrorType<T: Decodable> = [Int: T.Type]
