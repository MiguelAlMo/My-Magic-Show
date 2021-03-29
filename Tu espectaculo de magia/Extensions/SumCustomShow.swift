//
//  SumCustomShow.swift
//  Tu espectaculo de magia
//
//  Created by Miguel Alarcon on 19/3/21.
//

import Foundation

func sumCustomPrice (amedida: CustomShow?) -> Int {
    var sum = 0
    amedida?.tricks?.forEach({ (juegoDeMagia) in
        sum += juegoDeMagia.price
    })
    return sum
}

func sumCustomDuration (amedida: CustomShow?) -> Int {
    var sum = 0
    amedida?.tricks?.forEach({ (juegoDeMagia) in
        sum += juegoDeMagia.durationTime
    })
    return sum
}


