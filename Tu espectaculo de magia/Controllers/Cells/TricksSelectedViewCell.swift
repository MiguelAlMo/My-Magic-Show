//
//  TricksSelectedViewCell.swift
//  Tu espectaculo de magia
//
//  Created by Miguel Alarcon on 19/3/21.
//

import UIKit

class TricksSelectedViewCell: UICollectionViewCell {
    
    @IBOutlet weak var viewCell: UIView!
    @IBOutlet weak var trickImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        viewCell.borderViewColorWhite(value: 1)
        viewCell.roundedViewValue(value: 4)
        trickImage.roundedImage(value: 4)
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        trickImage.image = nil
    }
    
    func configure(title: String?, price: String?, image: String?) {
        trickImage.image = UIImage(named: image ?? "")
    }
}

