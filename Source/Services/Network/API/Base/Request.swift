//
//  Request.swift
//
//  Created by Bliss on 14/04/2020.
//  Copyright © 2020 nimble. All rights reserved.
//

import Alamofire

public protocol Request: AnyObject {

    @discardableResult
    func cancel() -> Self
}

extension Alamofire.Request: Request {}
