//
//  UIButtonExtension.swift
//  Tu espectaculo de magia
//
//  Created by Miguel Alarcon on 16/3/21.
//

import UIKit
extension UIButton {
    func roundedButtonValue (value: Int) {
        self.layer.cornerRadius = CGFloat(value)
        self.layer.shadowColor = UIColor.gray.cgColor
        self.layer.shadowOffset = CGSize.zero
    }
    
    func borderButtonColorWhite(value: Int) {
        self.layer.borderColor = UIColor.white.cgColor
        self.layer.borderWidth = CGFloat(value)
    }
    
}
