//
//  ImageCollectionViewCell.swift
//  StoreApp
//
//  Created by Reynaldo Cristinus Hutahaean on 14/03/23.
//

import UIKit

class ImageCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var imageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func setupContent(image: String) {
        guard let url = URL(string: image) else { return }
        imageView.kf.setImage(with: url, placeholder: UIImage(named: "placeholder_image"))
        imageView.kf.indicatorType = .activity
    }
}
