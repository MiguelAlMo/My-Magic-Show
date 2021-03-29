//
//  Predesigned.swift
//  Tu espectaculo de magia
//
//  Created by Miguel Alarcon on 13/3/21.
//
import Foundation

// MARK: - Predisenado
class Predesigned: Codable {
    let name, image,type, dataSheet: String
    let durationTime, price, numberTricks: Int
    let synopsis: String

    init(name: String, image: String, type: String, dataSheet: String, durationTime: Int, price: Int, numberTricks: Int, synopsis: String) {
        self.name = name
        self.image = image
        self.type = type
        self.dataSheet = dataSheet
        self.durationTime = durationTime
        self.price = price
        self.synopsis = synopsis
        self.numberTricks = numberTricks
    }
}


