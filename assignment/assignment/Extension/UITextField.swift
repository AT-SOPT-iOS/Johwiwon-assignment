//
//  UITextField.swift
//  assignment
//
//  Created by 조휘원 on 4/25/25.
//

import UIKit

extension UITextField {
    func setLeftPaddingPoints(_ amount: CGFloat) {
        let paddingView = UIView(
            frame: CGRect(x: 0, y: 0, width: amount, height: self.frame.height)
        )
        self.leftView = paddingView
        self.leftViewMode = .always
    }
    func applyTvingStyle(placeholder: String) {
        self.backgroundColor = .tv_gray4
        self.textColor = .tv_white
        self.font = .systemFont(ofSize: 15, weight: .medium)
        self.layer.cornerRadius = 3
        self.clipsToBounds = true
        self.setLeftPaddingPoints(22)
        self.attributedPlaceholder = NSAttributedString(
            string: placeholder,
            attributes: [.foregroundColor: UIColor.tv_gray2]
        )
    }
}
