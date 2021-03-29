//
//  HomeViewController.swift
//  Tu espectaculo de magia
//
//  Created by Miguel Alarcon on 14/3/21.
//

import UIKit

class HomeViewController: UIViewController {
    
    @IBOutlet weak var imageBack : UIImageView!
    @IBOutlet weak var imageLogo : UIImageView!
    @IBOutlet weak var imageSpade : UIImageView!
    
    @IBOutlet weak var textLabel : UILabel!
    @IBOutlet weak var readyLabel : UILabel!
    @IBOutlet weak var startMagicLabel : UILabel!
    
    @IBOutlet weak var pickerView : UIPickerView!
    @IBOutlet weak var textField : UITextField!
    
    @IBOutlet weak var startButton : UIButton!
    
    ///guardamos la provincia y la fecha del ecento seleccionadas
    @IBAction func startButtonAction(_ sender: Any) {
        guard let provinceSelected = province,
              !provinceSelected.isEmpty,
              let dateSelected = textField.text,
              !dateSelected.isEmpty else {
            // MOSTRAR ALERT AVISO
            showAlert(message: "Debes ingresar la fecha y localidad deel evento")
            return
        }
        
        DataProvider.shared.saveProvinceSelected(province: provinceSelected)
        DataProvider.shared.saveDateSelected(date: dateSelected)
        // SEGUE A SIGUIENTE PANTALLA
        performSegue(withIdentifier: "Home_Segue",
                     sender: nil)
    }
    
    let datePicker = UIDatePicker()
    var province: String?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        pickerView.delegate = self
        pickerView.dataSource = self
        pickerView.layer.cornerRadius = 4
        textField.layer.cornerRadius = 10
        startButton.roundedButtonValue(value: 6)
        showDatePicker()
        
        isValidData()
        //pickerView.setValue(UIColor.white, forKey: "white")
    }
    ///Transparentar la barra superior del navigation Bar
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }
    override func viewWillDisappear(_ animated: Bool) {
        
        super.viewWillDisappear(animated)
        navigationController?.setNavigationBarHidden(false, animated: animated)
    }
    
    func showDatePicker(){
        //Formate Date
        datePicker.datePickerMode = .date
        datePicker.preferredDatePickerStyle = .wheels
        datePicker.minimumDate = Date()
        
        //ToolBar
        let toolbar = UIToolbar();
        toolbar.sizeToFit()
        let doneButton = UIBarButtonItem(title: "Aceptar", style: .plain, target: self, action: #selector(doneDatePicker));
        let spaceButton = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.flexibleSpace, target: nil, action: nil)
        toolbar.setItems([doneButton,spaceButton], animated: false)
        textField.inputAccessoryView = toolbar
        textField.inputView = datePicker
    }
    @objc func doneDatePicker(){
        let formatter = DateFormatter()
        formatter.dateFormat = "dd/MM/yyyy"
        textField.text = formatter.string(from: datePicker.date)
        isValidData()
        self.view.endEditing(true)
    }
    
    private func isValidData() {
        guard let provinceSelected = province,
              !provinceSelected.isEmpty,
              let dateSelected = textField.text,
              !dateSelected.isEmpty else {
            startButton.backgroundColor = UIColor.gray
            startButton.isEnabled = false
            return
        }
        
        startButton.backgroundColor = UIColor.red
        startButton.isEnabled = true
    }
    
    private func showAlert(message: String) {
        let alert = UIAlertController(title: "Faltan campos por rellenar", message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        present(alert, animated: true, completion: nil)
    }
}

extension HomeViewController: UIPickerViewDelegate, UIPickerViewDataSource {
    ///número de secciones de nuestro pickerview
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        1
    }
    ///número de secciones de nuestro pickerview. Tantas como provincias hay.
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        provinces.count
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        provinces[row]
    }
    ///Guardas la provincia seleccionada en una variable
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if row == 0 {
            province = nil
        } else {
            province = provinces[row]
        }
        isValidData()
    }
}
