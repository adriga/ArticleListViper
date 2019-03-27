//
//  ProductCell.swift
//  ArticleList
//
//  Created by Adrián Gil Alonso on 04/02/2019.
//  Copyright © 2019 Adrian Gil Alonso. All rights reserved.
//

import UIKit

class ProductCell: UITableViewCell {

    @IBOutlet weak var productImage: UIImageView!
    @IBOutlet weak var productName: UILabel!
    @IBOutlet weak var productPrice: UILabel!
    @IBOutlet weak var offerLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.productName.font = UIFont.boldFont(ofSize: 17)
        self.productName.textColor = .mediumLabelColor
        self.productPrice.font = UIFont.mediumFont(ofSize: 15)
        self.productPrice.textColor = .mediumLabelColor
        self.offerLabel.font = UIFont.regularFont(ofSize: 12)
        self.offerLabel.textColor = .mediumLabelColor
    }
    
    public func configureProductCell(product: ProductViewModel) {
        if let image = product.image {
            self.productImage.image = UIImage(named: image)
        }
        if let offer = product.offer {
            self.offerLabel.isHidden = false
            self.offerLabel.text = offer
        } else {
            self.offerLabel.isHidden = true
        }
        self.productName.text = product.name
        self.productName.accessibilityIdentifier = product.name
        self.productPrice.text = product.price + "€"
    }
    
}
