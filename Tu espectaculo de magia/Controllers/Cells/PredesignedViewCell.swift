//
//  PredesignedViewCell.swift
//  Tu espectaculo de magia
//
//  Created by Miguel Alarcon on 16/3/21.
//

import UIKit

class PredesignedViewCell: UITableViewCell {
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var textDescription: UILabel!
    @IBOutlet weak var spadeImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        
        title.text = nil
        textDescription.text = nil
    }
    
    func configure(title: String?, text: String?) {
        self.title.text = title
        self.textDescription.text = text
    }
}
