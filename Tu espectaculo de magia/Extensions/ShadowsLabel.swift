//
//  ShadowsLabel.swift
//  Tu espectaculo de magia
//
//  Created by Miguel Alarcon on 31/3/21.
//

import UIKit

extension UILabel {
    
    func shadowLabel() {
        self.layer.shadowColor = UIColor.systemGray2.cgColor
        self.layer.shadowRadius = 3.0
        self.layer.shadowOpacity = 1.0
        self.layer.shadowOffset = CGSize(width: 2, height: 2)
        self.layer.masksToBounds = false
    }
}

