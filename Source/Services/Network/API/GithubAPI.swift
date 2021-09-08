//
//  NimblehqAPI.swift
//  Nimblehq
//
//  Created by Bliss on 14/10/20.
//
// swiftlint:disable closure_body_length

import Alamofire
import Foundation

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

    func url(forEndpoint endpoint: String, baseURL: String) -> String {
        let url = try? baseURL.asURL().appendingPathComponent(endpoint, isDirectory: false)
        return url?.absoluteString ?? baseURL
    }

    func performRequest(
        with configuration: RequestConfiguration,
        completion: @escaping RequestCompletion<Data>
    ) -> Request {
        return performRequest(with: configuration, specialErrors: [.min: EmptyAPIResponse.self], completion: completion)
    }

    func performRequest<T: Decodable>(
        with configuration: RequestConfiguration,
        specialErrors: SpecialErrorType<T>,
        completion: @escaping RequestCompletion<Data>
    ) -> Request {
        session.request(
            configuration.url,
            method: configuration.method,
            parameters: configuration.parameters,
            encoding: configuration.parameterEncoding,
            headers: configuration.headers
        )
        .validate(statusCode: 200...599)
        .responseData { dataResponse in
            switch dataResponse.result {
            case .success(let data):
                guard let statusCode = dataResponse.response?.statusCode else {
                    return completion(.failure(NimbleAPIError.genericError))
                }
                if 200 ... 299 ~= statusCode {
                    completion(.success(data))
                } else {
                    completion(.failure(NimbleAPIError.genericError))
                }
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}
