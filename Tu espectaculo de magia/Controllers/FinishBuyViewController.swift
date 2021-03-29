//
//  FinishBuyViewController.swift
//  Tu espectaculo de magia
//
//  Created by Miguel Alarcon on 18/3/21.
//

import UIKit

class FinishBuyViewController: UIViewController {
    
    @IBOutlet weak var imageBack : UIImageView!
    @IBOutlet weak var imageLogo : UIImageView!
    
    @IBOutlet weak var textLabel : UILabel!
    
    @IBOutlet weak var homeButton : UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        homeButton.roundedButtonValue(value: 6)
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
}
