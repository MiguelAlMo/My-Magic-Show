//
//  HomeShowsViewController.swift
//  Tu espectaculo de magia
//
//  Created by Miguel Alarcon on 3/3/21.
//

import UIKit

class HomeShowsViewController: UIViewController {
    
    @IBOutlet weak var imageBack : UIImageView!
    @IBOutlet weak var imageLogo : UIImageView!
    @IBOutlet weak var imageClover : UIImageView!
    @IBOutlet weak var imageHeart : UIImageView!
    
    @IBOutlet weak var predisenadoLabel : UILabel!
    @IBOutlet weak var aMedidaLabel : UILabel!
    
    @IBOutlet weak var collectionView1 : UICollectionView!
    @IBOutlet weak var collectionView2 : UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        aMedidaLabel.shadowLabel()
        predisenadoLabel.shadowLabel()
        collectionView1.delegate = self
        collectionView1.dataSource = self
        
        collectionView2.delegate = self
        collectionView2.dataSource = self
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.isTranslucent = true
        self.navigationController?.view.backgroundColor = .clear
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
    ///En función de el collectión view y la celda que seleccionen envía o un esoectáculo prediseñado o uno a medida
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? PredesignedViewController,
              let cell = sender as? UICollectionViewCell,
              let indexPath = collectionView1.indexPath(for: cell) {
            if(indexPath.row < DataProvider.shared.defaultPredesigned.count) {
                let show = DataProvider.shared.defaultPredesigned[indexPath.row]
                destination.showSelected = show
            }
        }
        if let destination = segue.destination as? CustomViewController,
              let cell = sender as? UICollectionViewCell,
              let indexPath = collectionView2.indexPath(for: cell) {
            if(indexPath.row < DataProvider.shared.defaultCustomShow.count) {
                let show = DataProvider.shared.defaultCustomShow[indexPath.row]
                destination.showSelected = show
            }
        }
    }
}

extension HomeShowsViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    /// Se configuran el número de celdas de los espectáculos en función de su collectionView
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == collectionView1 {
            return DataProvider.shared.defaultPredesigned.count
        }
        return DataProvider.shared.defaultCustomShow.count
    }
    /// Se configuran las imagenes y título de los espectáculos en función de su collectionView
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView1.dequeueReusableCell(withReuseIdentifier: "HomeShowsViewCell", for: indexPath) as? HomeShowsViewCell
        if indexPath.row < DataProvider.shared.defaultPredesigned.count {
            let data = DataProvider.shared.defaultPredesigned[indexPath.row]
            cell?.configure(image: data.image , type: data.type)
        }
        
        if collectionView == collectionView2 {
            let cell2 = collectionView2.dequeueReusableCell(withReuseIdentifier: "HomeShowsViewCell2", for: indexPath) as? HomeShowsViewCell2
            if indexPath.row < DataProvider.shared.defaultCustomShow.count {
                let data = DataProvider.shared.defaultCustomShow[indexPath.row]
                cell2?.configure(image: data.image , type: data.type)
            }
            return cell2 ?? UICollectionViewCell()
        }
        return cell ?? UICollectionViewCell()
    }
}

