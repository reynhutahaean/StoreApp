//
//  DetailViewController.swift
//  StoreApp
//
//  Created by Reynaldo Cristinus Hutahaean on 14/03/23.
//

import UIKit
import Kingfisher

class DetailViewController: UIViewController {

    var data: ProductModel?
    
    @IBOutlet weak var productImageView: UIImageView!
    @IBOutlet weak var productTitleLabel: UILabel!
    @IBOutlet weak var productDescriptionLabel: UILabel!
    @IBOutlet weak var productPriceLabel: UILabel!
    @IBOutlet weak var productDiscLabel: UILabel!
    @IBOutlet weak var productRatingLabel: UILabel!
    @IBOutlet weak var productStockLabel: UILabel!
    @IBOutlet weak var productBrandLabel: UILabel!
    @IBOutlet weak var productCategoryLabel: UILabel!
    @IBOutlet weak var productsCollectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setupCollectionView()
    }

    private func setupView() {
        guard let url = URL(string: data?.thumbnail ?? "") else { return }
        productImageView.kf.setImage(with: url)
        productTitleLabel.text = data?.title
        productDescriptionLabel.text = data?.description
        productPriceLabel.text = "$\(data?.price ?? 0)"
        productDiscLabel.text = "Disc: \(data?.discountPercentage ?? 0) %"
        productRatingLabel.text = "Rating: \(data?.rating ?? 0)"
        productStockLabel.text = "Stock: \(data?.stock ?? 0)"
        productBrandLabel.text = "Brand: \(data?.brand ?? "")"
        productCategoryLabel.text = "Category: \(data?.category?.capitalized ?? "")"
    }
    
    private func setupCollectionView() {
        productsCollectionView.register(UINib(nibName: "ImageCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "ImageCollectionViewCell")
        productsCollectionView.dataSource = self
        productsCollectionView.reloadData()
    }
    
    @IBAction func backButtonTapped(_ sender: Any) {
        self.dismiss(animated: true)
    }
}

extension DetailViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return data?.images?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let images = data?.images else { return UICollectionViewCell() }
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ImageCollectionViewCell", for: indexPath) as! ImageCollectionViewCell
        
        cell.setupContent(image: images[indexPath.row])
        
        return cell
    }
    
    
}
