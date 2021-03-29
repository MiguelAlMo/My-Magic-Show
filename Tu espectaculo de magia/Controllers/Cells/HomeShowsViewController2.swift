//
//  HomeShowsViewController2.swift
//  Tu espectaculo de magia
//
//  Created by Miguel Alarcon on 15/3/21.
//

import UIKit

class HomeShowsViewCell2: UICollectionViewCell {
    @IBOutlet weak var photoCell: UIImageView!
    @IBOutlet weak var nameCell: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        photoCell.borderColorWhite(value: 1)
        photoCell.roundedImage(value: 6)
        nameCell.layer.cornerRadius = 6
        nameCell.clipsToBounds = true
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        photoCell.image = nil
        nameCell.text = nil
    }
    
    func configure(image: String?, type: String?) {
        photoCell.image = UIImage(named: image ?? "")
        self.nameCell.text = type
    }
}
