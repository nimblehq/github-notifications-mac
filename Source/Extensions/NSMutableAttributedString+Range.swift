//
//  NSMutableAttributedString+Range.swift
//  GithubNotifications
//
//  Created by Chananchida F. on 9/9/21.
//  Copyright © 2021 Nimblehq. All rights reserved.
//

import Foundation

extension NSMutableAttributedString {
    
    var range: NSRange {
        NSRange(location: 0, length: self.length)
    }
}
