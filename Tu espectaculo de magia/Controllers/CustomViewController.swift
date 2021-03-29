//
//  CustomViewController.swift
//  Tu espectaculo de magia
//
//  Created by Miguel Alarcon on 16/3/21.
//

import UIKit
import AVFoundation

class CustomViewController: UIViewController {
    
    @IBOutlet weak var viewShow : UIView!
    @IBOutlet weak var imageBack : UIImageView!
    @IBOutlet weak var imageLogo : UIImageView!
    @IBOutlet weak var imageSpade : UIImageView!
    @IBOutlet weak var imageShow : UIImageView!
    @IBOutlet weak var titleLabel : UILabel!
    @IBOutlet weak var titleShow : UILabel!
    @IBOutlet weak var descriptionShowLabel : UILabel!
    @IBOutlet weak var durationLabel : UILabel!
    @IBOutlet weak var priceLabel : UILabel!
    
    @IBOutlet weak var tableView : UITableView!
    
    @IBOutlet weak var buttonShow : UIButton!
    @IBOutlet weak var buttonAdd : UIButton!
    
    ///Enviamos el show ya con sus juegos añadidos
    @IBAction func showButtonAction(_ sender: Any) {
//        if let show = showSelected{
//            saveShowAmedidaSelected(amedida: (show))
//        }
    }
    ///Añadimos al espectáculo el juego seleccionado y en caso de no haber seleccionado ninguno guardamos el primero de la lista que es el que mostramos en la view por defecto.
    @IBAction func addButtonAction(_ sender: Any) {
        if let trick = trickAdd {
            showSelected?.tricks?.append(trick)
            print(trick.name)
        } else {
            showSelected?.tricks?.append(DataProvider.shared.defaultMagicTricks.first!)
        }
        //Sumamos uno al contador de juegos que hay en el botón buttonShow
        counter += 1
    }
    
    var audioPlayer = AVAudioPlayer()
    ///Show a medida seleccionado en el Home y que llega mediante un Prepare for segue desde la celda del collectionView
    var showSelected : CustomShow?
    ///Juego seleccionado de todos los juegos disponibles en el collectionView
    var trickAdd : MagicTricks?
    ///Contador de los juegos añadidos. El didSet  renueva la información cada vez que se pulsa
    var counter = 0 {
        didSet {
            if counter == 0 {
                
            } else {
                buttonShow.setTitle("Show \(String(describing: showSelected?.tricks?.count ?? 0))", for: .normal)
                showAlert(message: "Has añadido un juego a tu Show!")
                //audioPlayer.play()
            }
        }
    }
    ///Enviamos el show ya con sus juegos añadidos
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? TricksSelectedViewController {
            //destination.delegate = self
            destination.showSelected = showSelected
        }
    }
    ///Mensaje que alerta que has añadido un juego (usas la función arriba en el didSet del counter)
    private func showAlert(message: String) {
        let alert = UIAlertController(title: "Tu Show", message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        present(alert, animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        titleLabel.text = showSelected?.type
        tableView.delegate = self
        tableView.dataSource = self
        imageShow.borderColorWhite(value:1)
        imageShow.roundedImage(value: 4)
        viewShow.borderViewColorWhite(value: 1)
        viewShow.roundedViewValue(value: 6)
        buttonAdd.roundedButtonValue(value: 4)
        buttonShow.roundedButtonValue(value: 4)
     ///Colocar por defecto en la view de añadir juegos el primer juego de la lista
        imageShow.image = UIImage(named: DataProvider.shared.defaultMagicTricks.first?.image ?? "")
        titleShow.text = DataProvider.shared.defaultMagicTricks.first?.name
        descriptionShowLabel.text = DataProvider.shared.defaultMagicTricks.first?.synopsis
        durationLabel.text = "Duración: \(String(describing: DataProvider.shared.defaultMagicTricks.first?.durationTime.description ?? "")) min"
        priceLabel.text = "Desde \(String(describing: DataProvider.shared.defaultMagicTricks.first?.price.description ?? ""))€"
     ///Audio al añadir juego
        do {
            audioPlayer = try
                AVAudioPlayer(contentsOf: URL.init(fileURLWithPath: Bundle.main.path(forResource: "Varita", ofType: "mp3")!))
            audioPlayer.prepareToPlay()
        } catch {
            print(error)
        }
    }
    ///Poner el contador de juegos añadidos con el número de juegos que tiene actualmente el espectáculo
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        buttonShow.setTitle("Show \(String(describing: showSelected?.tricks?.count ?? 0))", for: .normal)
    }
}

extension CustomViewController: UITableViewDataSource, UITableViewDelegate {
    ///Número de celdas de todos los juegos de magia
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        DataProvider.shared.defaultMagicTricks.count
    }
    ///Tamaño celda de todos los juegos de magia
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        110
    }
    ///Configurar celda de todos los juegos de magia
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CustomViewCell", for: indexPath) as? CustomViewCell
        
        if(indexPath.row < DataProvider.shared.defaultMagicTricks.count) {
            let data = DataProvider.shared.defaultMagicTricks[indexPath.row]
            cell?.configure(title: data.name, price: data.price.description, image: data.image)
            
        }
        return cell ?? UITableViewCell()
        
    }
    ///Muestra en la View el juego seleccionado
    internal func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if(indexPath.row < DataProvider.shared.defaultMagicTricks.count) {
            
            trickAdd = DataProvider.shared.defaultMagicTricks[indexPath.row]
            imageShow.image = UIImage(named: trickAdd?.image ?? "")
            titleShow.text = trickAdd?.name
            descriptionShowLabel.text = trickAdd?.synopsis
            durationLabel.text = "Duración: \(String(describing: trickAdd?.durationTime.description ?? "")) min"
            priceLabel.text = "Desde \(String(describing: trickAdd?.price.description ?? ""))€"
        }
    }
}

//extension CustomViewController: TricksSelectedViewProtocol {
//    func onTrickDelete(_ trick: JuegoDeMagia) {
//
//    }
//}
