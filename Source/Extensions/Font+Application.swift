//
//  Font+Application.swift
//  GithubNotifications
//
//  Created by Chananchida F. on 9/8/21.
//  Copyright © 2021 Nimblehq. All rights reserved.
//

import SwiftUI

extension Font {

    static let headlineTitle: Font = { Font.system(size: 22, weight: .bold) }()
    static let title: Font = { Font.system(size: 17, weight: .medium) }()
    static let smallTitle: Font = { Font.system(size: 15, weight: .bold) }()
    static let headlineDescription: Font = { Font.system(size: 17, weight: .regular) }()
    static let description: Font = { Font.system(size: 15, weight: .regular) }()
    static let smallDescription: Font = { Font.system(size: 13, weight: .regular) }()
}
