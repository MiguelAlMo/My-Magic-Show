//
//  CustomViewCell.swift
//  Tu espectaculo de magia
//
//  Created by Miguel Alarcon on 16/3/21.
//

import UIKit

class CustomViewCell: UITableViewCell {
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var price: UILabel!
    @IBOutlet weak var viewCell: UIView!
    @IBOutlet weak var trickImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        viewCell.borderViewColorWhite(value: 1)
        viewCell.roundedViewValue(value: 6)
        trickImage.roundedImage(value: 6)
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        title.text = nil
        price.text = nil
        trickImage.image = nil
    }
    
    func configure(title: String?, price: String?, image: String?) {
        self.title.text = title
        self.price.text = "Desde \(price ?? "")€"
        trickImage.image = UIImage(named: image ?? "")
    }
}

