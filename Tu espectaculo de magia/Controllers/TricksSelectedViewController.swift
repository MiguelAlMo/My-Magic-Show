//
//  TricksSelectedViewController.swift
//  Tu espectaculo de magia
//
//  Created by Miguel Alarcon on 17/3/21.
//

import UIKit
//protocol TricksSelectedViewProtocol {
//    func onTrickDelete(_ trick: MagicTricks)
//}
class TricksSelectedViewController: UIViewController{
    
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
    
    @IBOutlet weak var collectionView : UICollectionView!
    
    @IBOutlet weak var buyShow : UIButton!
    @IBOutlet weak var deleteButton : UIButton!
    
    /// Limpia el UserDefault de prediseñados para no crear conflictos y guarda el show a medida
        @IBAction func buyShowButtonAction(_ sender: Any) {
    //       deletePredesigned()
    //      if let show = showSelected{
    //        saveShowAmedidaSelected(amedida: (show))
    //      }
        }
    
    /// Eliminar juego, guardar show de nuevo y refrescar el collectionView ya con un juego menos.
    @IBAction func deleteButtonAction(_ sender: Any) {
        if let trick = trickSelected {
            //delegate?.onTrickDelete(trick)
            showSelected?.tricks?.removeAll(where: { $0.name == trick.name })
            
            if showSelected?.tricks?.count ?? 0 == 0 {
                navigationController?.popViewController(animated: true)
            } else {
                counter = showSelected?.tricks?.count ?? 0
                trickSelected = showSelected?.tricks?.first
                uploadShowSelected()
            }
        }
    }
    //var delegate: TricksSelectedViewProtocol? = nil
    ///recuperamos el show a medida guardado en el CustomViewController
    var showSelected: CustomShow?
    
    /// contar número de juegos que tenemos añadidos al espectáculo
    private var counter = 0 {
        didSet {
            buyShow.setTitle("Reserva \(String(describing: showSelected?.tricks?.count ?? 0))", for: .normal)
            showAlert(message: "Has eliminado un juego de tu Show!")
        }
    }
    ///Juego seleccionado en las celdas del collectionView(función didSelectedItem)
    private var trickSelected: MagicTricks?
    
    ///Mensaje que alerta que has eliminado un juego (usas la función arriba en el didSet del counter)
    private func showAlert(message: String) {
        let alert = UIAlertController(title: "Tu Show", message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        present(alert, animated: true, completion: nil)
    }
    ///Enviamos el espectáculo ya con los juegos añadidos a la siguiente pantalla
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? TotalShowViewController {
            //destination.delegate = self
            destination.customShow = showSelected
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        trickSelected = showSelected?.tricks?.first
        
        //titleLabel.text = showSelected?.type
        collectionView.delegate = self
        collectionView.dataSource = self
        imageShow.borderColorWhite(value:1)
        imageShow.roundedImage(value: 4)
        viewShow.borderViewColorWhite(value: 1)
        viewShow.roundedViewValue(value: 6)
        deleteButton.roundedButtonValue(value: 4)
        buyShow.roundedButtonValue(value: 4)
        uploadShowSelected()
        //showSelected = getShowAmedidaSelected()
    }
    ///Poner el contador de juegos añadidos con el número de juegos que tiene actualmente el espectáculo
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        buyShow.setTitle("Reserva \(String(describing: showSelected?.tricks?.count ?? 0))", for: .normal)
    }
    
    func uploadShowSelected() {
        imageShow.image = UIImage(named: trickSelected?.image ?? "")
        titleShow.text = trickSelected?.name
        descriptionShowLabel.text = trickSelected?.synopsis
        durationLabel.text = "Duración: \(String(describing: trickSelected?.durationTime.description ?? "")) min"
        priceLabel.text = "Desde \(String(describing: trickSelected?.price.description ?? ""))€"
        collectionView.reloadData()
    }
    
}
extension TricksSelectedViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        showSelected?.tricks?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(width: collectionView.frame.width / 6 - 2,
               height: collectionView.frame.width / 6 - 2)
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "TricksSelectedViewCell",
                                                      for: indexPath) as? TricksSelectedViewCell
        
        if(indexPath.row < showSelected?.tricks?.count ?? 0) {
            let data = showSelected?.tricks?[indexPath.row]
            cell?.configure(title: data?.name, price: data?.price.description, image: data?.image)}
        return cell ?? UICollectionViewCell()
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if(indexPath.row < showSelected?.tricks?.count ?? 0) {
            trickSelected = showSelected?.tricks?[indexPath.row]
            uploadShowSelected()
        }
    }
}

