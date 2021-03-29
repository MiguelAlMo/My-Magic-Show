//
//  DataProvider.swift
//  Tu espectaculo de magia
//
//  Created by Miguel Alarcon on 17/3/21.
//

import CoreData

class DataProvider {
  //  MARK: - Singleton start -
  static var shared: DataProvider = {
    return DataProvider()
  }()
  //  se crea un init privado
  private init() {}

let keyProvinceSelected = "keyProvinceSelected"
let keyDateSelected = "keyDateSelected"

///save province
func saveProvinceSelected (province: String){
    let provinceSelectedData = try! JSONEncoder().encode(province)
    UserDefaults.standard.setValue(provinceSelectedData, forKey: keyProvinceSelected)
}
///load province
func getProvinceSelected () -> String{
    
    let provinceDataUserDefaultData = UserDefaults.standard.data(forKey: keyProvinceSelected)!
    
    let province = try! JSONDecoder().decode(String.self, from: provinceDataUserDefaultData)
    return province
}
///save Date
func saveDateSelected (date: String){
    let dateSelectedData = try! JSONEncoder().encode(date)
    UserDefaults.standard.setValue(dateSelectedData, forKey: keyDateSelected)
}
///load Date
func getDateSelected() -> String{
    
    let dateUserDefaultData = UserDefaults.standard.data(forKey: keyDateSelected)!
    
    let date = try! JSONDecoder().decode(String.self, from: dateUserDefaultData)
    return date
}

}
