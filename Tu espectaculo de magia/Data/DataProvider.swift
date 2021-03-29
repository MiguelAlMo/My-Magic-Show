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
