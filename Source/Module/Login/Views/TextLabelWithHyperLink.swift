//
//  TextLabelWithHyperLink.swift
//  GithubNotifications
//
//  Created by Chananchida F. on 9/9/21.
//  Copyright © 2021 Nimblehq. All rights reserved.
//

import SwiftUI
import UIKit

enum TextContent {
    
    case text(_ text: String, style: FontStyle = FontStyle.regular)
    case link(_ text: String, link: String)
    
    enum FontStyle {

        case regular
        case bold
        case italic
    }
}

struct TextLabelWithHyperlink: UIViewRepresentable {
    
    var content: [TextContent]
    
    private func preferredFont(_ style: TextContent.FontStyle) -> UIFont {
        var font: UIFont
        switch style {
        case .regular:
            font = UIFont.systemFont(ofSize: 13)
        case .bold:
            font = UIFont.boldSystemFont(ofSize: 13)
        case .italic:
            font = UIFont.italicSystemFont(ofSize: 13)
        }
        return font
    }
    
    func makeUIView(context: Context) -> UITextView {
        let standartTextAttributes: [NSAttributedString.Key : Any] = [
            NSAttributedString.Key.foregroundColor: UIColor.gray
        ]
        
        let hyperlinkTextAttributes: [NSAttributedString.Key : Any] = [
            NSAttributedString.Key.font: UIFont.systemFont(ofSize: 13),
            NSAttributedString.Key.foregroundColor: UIColor.gray,
            NSAttributedString.Key.underlineStyle: NSUnderlineStyle.single.rawValue
        ]
        
        let attributedText = NSMutableAttributedString(string: "")
        content.forEach {
            switch $0 {
            case .text(let text, let style):
                let fontAttributed = [NSAttributedString.Key.font: preferredFont(style)]
                let normalAttributedText = NSMutableAttributedString(string: text)
                normalAttributedText.addAttributes(fontAttributed, range: normalAttributedText.range)
                normalAttributedText.addAttributes(standartTextAttributes, range: normalAttributedText.range)
                attributedText.append(normalAttributedText)
            case .link(let text, let link):
                let linkAttribute = [NSAttributedString.Key.link: link]
                let textWithHyperlink = NSMutableAttributedString(string: text)
                textWithHyperlink.addAttributes(linkAttribute, range: textWithHyperlink.range)
                textWithHyperlink.addAttributes(hyperlinkTextAttributes, range: textWithHyperlink.range)
                attributedText.append(textWithHyperlink)
            }
        }
        
        let textView = UITextView()
        textView.attributedText = attributedText
        textView.linkTextAttributes = hyperlinkTextAttributes
        textView.isEditable = false
        textView.textAlignment = .left
        textView.textContainerInset = UIEdgeInsets.zero
        textView.textContainer.lineFragmentPadding = 0
        
        return textView
    }

    func updateUIView(_ uiView: UITextView, context: Context) {}
}
