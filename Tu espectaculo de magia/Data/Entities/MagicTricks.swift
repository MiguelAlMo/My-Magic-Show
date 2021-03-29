//
//  MagicTricks.swift
//  Tu espectaculo de magia
//
//  Created by Miguel Alarcon on 14/3/21.
//

import Foundation

// MARK: - JuegoDeMagia
class MagicTricks: Codable {
    let name, image: String
    let durationTime, price: Int
    let synopsis: String

    init(name: String, image: String, durationTime: Int, price: Int, synopsis: String) {
        self.name = name
        self.image = image
        self.durationTime = durationTime
        self.price = price
        self.synopsis = synopsis
    }
}

