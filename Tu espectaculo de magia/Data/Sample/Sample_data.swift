//
//  Sample_data.swift
//  Tu espectaculo de magia
//
//  Created by Miguel Alarcon on 14/3/21.
//

import Foundation

// ******* DEFAULT DATA *******
var defaultPredesigned: [Predesigned] = []
var defaultMagicTricks: [MagicTricks] = []
var defaultCustomShow: [CustomShow] = []

func loadDefaultData() {
    loadMagicTricks()
    loadPredesigned()
    loadCustomShow()
}

// ******* LOAD JSON DATA *******
private func loadMagicTricks() {
    guard let pathURL = Bundle.main.url(forResource: "MagicTricks_data", withExtension: "json") else {
        print("Can not find 'JuegosMagia_data' resource")
        return
    }
    
    do {
        let data = try Data(contentsOf: pathURL)
        defaultMagicTricks = try JSONDecoder().decode([MagicTricks].self, from: data)
    } catch {
        print("Can not find 'JuegosMagia_data' resource")
    }
}

private func loadPredesigned() {
    guard let pathURL = Bundle.main.url(forResource: "Predesigned_data", withExtension: "json") else {
        print("Can not find 'Predisenado_data' resource")
        return
    }
    
    do {
        let data = try Data(contentsOf: pathURL)
        defaultPredesigned = try JSONDecoder().decode([Predesigned].self, from: data)
    } catch {
        return print("Can not find `Predisenado_data` resource")

    }
    
}

private func loadCustomShow() {
    guard let pathURL = Bundle.main.url(forResource: "CustomShow_data", withExtension: "json") else {
        print("Can not find `AMedida_data` resource")
        return
    }
    
    do {
        let data = try Data(contentsOf: pathURL)
        defaultCustomShow = try JSONDecoder().decode([CustomShow].self, from: data)
    } catch {
        return print("Can not find `AMedida_data` resource")

    }
}

