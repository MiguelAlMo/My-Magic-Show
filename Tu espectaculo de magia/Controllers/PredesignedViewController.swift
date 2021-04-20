//
//  PredesignedViewController.swift
//  Tu espectaculo de magia
//
//  Created by Miguel Alarcon on 16/3/21.
//

import UIKit

class PredesignedViewController: UIViewController {
    
    @IBOutlet weak var imageBack : UIImageView!
    @IBOutlet weak var imageLogo : UIImageView!
    @IBOutlet weak var imageSpade : UIImageView!
    @IBOutlet weak var imageShow : UIImageView!
    
    @IBOutlet weak var titleLabel : UILabel!
    
    @IBOutlet weak var tableView : UITableView!
    
    @IBOutlet weak var buttonBuy : UIButton!
    @IBAction func buyButtonAction(_ sender: Any) {
        
    }
    ///Showprediseñado seleccionado en el Home y que llega mediante un Prepare for segue desde la celda del collectionView
    var showSelected : Predesigned?
    
    ///Enviamos el show prediseñado a la siguiente pantalla
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? TotalShowViewController {
            //destination.delegate = self
            destination.predesigned = showSelected
        }
    }
 
    override func viewDidLoad() {
        super.viewDidLoad()
        imageShow.image = UIImage(named: showSelected?.image ?? "")
        titleLabel.text = showSelected?.name
        titleLabel.shadowLabel()
        tableView.delegate = self
        tableView.dataSource = self
        imageShow.borderColorWhite(value: 1)
        imageShow.roundedImage(value: 4)
        buttonBuy.roundedButtonValue(value: 4)
        buttonBuy.borderButtonColorWhite(value: 1)
    }
}

extension PredesignedViewController: UITableViewDataSource, UITableViewDelegate {
    ///Haces dos celdas, una para sinópsis y otra para ficha técnica
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        2
    }
    ///Damos dos tamaños diferentes a las celdas, una para sinópsis y otra para ficha técnica
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath.section {
            case 0 : return 495
            case 1 : return 200
            default: return 0
        }
    }
    ///Configuramos las celdas, una para sinópsis y otra para ficha técnica
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "PredesignedViewCell", for: indexPath) as? PredesignedViewCell
        
        switch indexPath.row {
            case 0 : cell?.configure(title: "Sinopsis", text: showSelected?.synopsis)
            case 1 : cell?.configure(title: "Ficha técnica", text: showSelected?.dataSheet)
            default:
                break
        }
        return cell ?? UITableViewCell()
    }
}

