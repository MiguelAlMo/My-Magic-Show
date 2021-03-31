//
//  TotalShowViewController.swift
//  Tu espectaculo de magia
//
//  Created by Miguel Alarcon on 18/3/21.
//

import UIKit

class TotalShowViewController: UIViewController {
    
    @IBOutlet var spadeTitleImage : UIImageView!
    @IBOutlet var logoImage : UIImageView!
    @IBOutlet var totalShowImage : UIImageView!
    @IBOutlet var titleShow : UILabel!
    @IBOutlet var totalShowView : UIView!
    @IBOutlet var numberTricks : UILabel!
    @IBOutlet var showDuration : UILabel!
    @IBOutlet var showPrice : UILabel!
    @IBOutlet var eventLocation : UILabel!
    @IBOutlet var eventDate : UILabel!
    @IBOutlet var nameTextField : UITextField!
    @IBOutlet var surnameTextField : UITextField!
    @IBOutlet var phoneTextField : UITextField!
    @IBOutlet var emailTextField : UITextField!
    @IBOutlet var sendButton : UIButton!
    
    var customShow : CustomShow?
    var predesigned : Predesigned?
    override func viewDidLoad() {
        super.viewDidLoad()
        titleShow.shadowLabel()
        totalShowView.borderViewColorWhite(value: 1)
        totalShowImage.roundedImage(value: 4)
        totalShowView.roundedViewValue(value: 4)
        sendButton.roundedButtonValue(value: 4)
        ///Ocultar teclado al presionar en otro lado de la pantalla
        hideKeyboardWhenTappedAround()
        
        nameTextField.attributedPlaceholder = NSAttributedString(string: "Nombre:", attributes: [NSAttributedString.Key.foregroundColor : UIColor.lightGray])
        surnameTextField.attributedPlaceholder = NSAttributedString(string: "Apellidos:", attributes: [NSAttributedString.Key.foregroundColor : UIColor.lightGray])
        phoneTextField.attributedPlaceholder = NSAttributedString(string: "Teléfono:", attributes: [NSAttributedString.Key.foregroundColor : UIColor.lightGray])
        emailTextField.attributedPlaceholder = NSAttributedString(string: "Email:", attributes: [NSAttributedString.Key.foregroundColor : UIColor.lightGray])
        
        if customShow?.tricks?.count ?? 0 > 0 {
            totalShowImage.image = UIImage(named: customShow?.image ?? "" )
            eventLocation.text = "Localidad: \(DataProvider.shared.getProvinceSelected())"
            eventDate.text = "Fecha: \(DataProvider.shared.getDateSelected())"
            titleShow.text = customShow?.name ?? ""
            numberTricks.text = "Número de juegos: \(String(describing: customShow?.tricks?.count ?? 0))"
            showPrice.text = "Precio: \(String(describing: sumCustomPrice(amedida: customShow)) ) €"
            showDuration.text = "Duración: \(String(describing: sumCustomDuration(amedida: customShow))) min"
         }
            else {
                totalShowImage.image = UIImage(named: predesigned?.image ?? ""  )
                eventLocation.text = "Localidad: \(DataProvider.shared.getProvinceSelected())"
                eventDate.text = "Fecha: \(DataProvider.shared.getDateSelected())"
                titleShow.text = predesigned?.name
                numberTricks.text = "Número de juegos: \(String(describing: predesigned?.numberTricks ?? 0))"
                showPrice.text = "Precio: \(String(describing: predesigned?.price ?? 0)) €"
                showDuration.text = "Duración: \(String(describing: predesigned?.durationTime ?? 0)) min"
        }
    }
    func hideKeyboardWhenTappedAround() {
        let tap = UITapGestureRecognizer(target: self,
                         action: #selector(dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
      }
      @objc func dismissKeyboard() {
        view.endEditing(true)
      }
}
