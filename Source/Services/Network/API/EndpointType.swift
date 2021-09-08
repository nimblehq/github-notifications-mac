//
//  EndpointType.swift
//  Nimblehq
//
//  Created by Minh Pham on 04/02/2021.
//  Copyright © 2021 Nimble. All rights reserved.
//

import Foundation

enum EndpointType {
    
    var endpoint: String {
        switch self {
        #warning("remove default when this enum has real case")
        default: return ""
        }
    }
}
