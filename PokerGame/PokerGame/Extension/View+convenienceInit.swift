//
//  UIStackView.swift
//  PokerGame
//
//  Created by 신한섭 on 2021/01/02.
//

import UIKit

extension UIStackView {
    convenience init(axis: NSLayoutConstraint.Axis = .horizontal, distribution: UIStackView.Distribution = .fill, spacing: CGFloat = 0) {
        self.init()
        self.axis = axis
        self.distribution = distribution
        self.spacing = spacing
    }
}

extension UILabel {
    convenience init(textColor: UIColor = .label, text: String? = nil) {
        self.init()
        self.textColor = textColor
        self.text = text
    }
}
