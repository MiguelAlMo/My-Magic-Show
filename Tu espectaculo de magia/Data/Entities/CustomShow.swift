//
//  CustomShow.swift
//  Tu espectaculo de magia
//
//  Created by Miguel Alarcon on 15/3/21.
//

import Foundation

// MARK: - AMedida
class CustomShow: Codable {
    let name, image, type: String
    let durationTime, price: Int
    var tricks: [MagicTricks]?

    init(name: String, image: String, type: String, durationTime: Int, price: Int, tricks: [MagicTricks]?) {
        self.name = name
        self.image = image
        self.type = type
        self.durationTime = durationTime
        self.price = price
        self.tricks = tricks
    }
}

