//
//  ProductsTableViewCell.swift
//  StoreApp
//
//  Created by Reynaldo Cristinus Hutahaean on 14/03/23.
//

import UIKit
import Kingfisher

class ProductsTableViewCell: UITableViewCell {

    @IBOutlet weak var productTitleLabel: UILabel!
    @IBOutlet weak var productImageView: UIImageView!
    @IBOutlet weak var productDescriptionLabel: UILabel!
    @IBOutlet weak var productPriceLabel: UILabel!
    @IBOutlet weak var productBrandLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setupContentView(product: ProductModel) {
        guard let url = URL(string: product.thumbnail ?? "") else { return }
        productImageView.kf.setImage(with: url)
        productTitleLabel.text = product.title
        productDescriptionLabel.text = product.description
        productPriceLabel.text = "$\(product.price ?? 0)"
        productBrandLabel.text = product.brand
    }
}
