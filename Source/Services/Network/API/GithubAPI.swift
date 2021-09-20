//
//  NimblehqAPI.swift
//  Nimblehq
//
//  Created by Bliss on 14/10/20.
//
// swiftlint:disable closure_body_length

import Alamofire
import Foundation
import Combine

final class GithubAPI: API {

    let baseURL: String
    let session: Session

    private let parser: JSONDecoder

    init(
        baseURL: String,
        parser: JSONDecoder
    ) {
        self.baseURL = baseURL
        self.parser = parser
        let sessionConfiguration = URLSessionConfiguration.af.default
        sessionConfiguration.timeoutIntervalForRequest = 60.0
        sessionConfiguration.timeoutIntervalForResource = 120.0

        session = Session(configuration: sessionConfiguration)
    }

    func url(forEndpoint endpoint: String) -> String {
        let url = try? baseURL.asURL().appendingPathComponent(endpoint, isDirectory: false)
        return url?.absoluteString ?? baseURL
    }

    func performRequest<T: Decodable>(with configuration: RequestConfiguration) -> AnyPublisher<T, Error> {
        Future { promise in
            self.session.request(
                configuration.url,
                method: configuration.method,
                parameters: configuration.parameters,
                encoding: configuration.encoding,
                headers: configuration.headers,
                interceptor: configuration.interceptor
            )
            .responseDecodable(
                decoder: self.parser,
                completionHandler: { (response: DataResponse<T, AFError>) in
                    switch response.result {
                    case .success(let value):
                        promise(.success(value))
                    case .failure(let error):
                        promise(.failure(error))
                    }
            })
        }
        .eraseToAnyPublisher()
    }
}
