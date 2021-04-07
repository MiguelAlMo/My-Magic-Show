//
//  NavigationControllerExtension.swift
//  Tu espectaculo de magia
//
//  Created by Miguel Alarcon on 7/4/21.
//

import UIKit

extension UINavigationController {
    func hideNavigationController() {
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        navigationController?.navigationBar.shadowImage = UIImage()
        navigationController?.navigationBar.isTranslucent = true
        navigationController?.view.backgroundColor = .clear
    }
}
