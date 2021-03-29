//
//  UIImageExtension.swift
//  Tu espectaculo de magia
//
//  Created by Miguel Alarcon on 15/3/21.
//

import UIKit

extension UIImageView {
    func roundedImage(value: Int) {
        self.layer.cornerRadius = CGFloat(value)
        self.layer.shadowColor = UIColor.gray.cgColor
        self.layer.shadowOffset = CGSize.zero
        self.clipsToBounds = true
    }
    
    func borderColorWhite(value: Int) {
        self.layer.borderColor = UIColor.white.cgColor
        self.layer.borderWidth = CGFloat(value)
    }
}
