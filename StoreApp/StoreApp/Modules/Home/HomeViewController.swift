//
//  HomeViewController.swift
//  StoreApp
//
//  Created by Reynaldo Cristinus Hutahaean on 14/03/23.
//

import UIKit

class HomeViewController: UIViewController {

    @IBOutlet weak var headerView: UIView!
    @IBOutlet weak var productsTableView: UITableView!
    
    var presenter: HomePresentation?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.viewDidLoad()
        setupTableView()
    }
    
    private func setupTableView() {
        productsTableView.register(UINib(nibName: "ProductsTableViewCell", bundle: nil), forCellReuseIdentifier: "ProductsTableViewCell")
        productsTableView.delegate = self
        productsTableView.dataSource = self
        productsTableView.reloadData()
    }

}

extension HomeViewController: HomeView {
    func reloadTableView() {
        productsTableView.reloadData()
    }
}

extension HomeViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let products = presenter?.products else { return }
        presenter?.navigateToDetail(products: products[indexPath.row])
    }
}

extension HomeViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter?.products?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let products = presenter?.products else { return UITableViewCell() }
        let cell = tableView.dequeueReusableCell(withIdentifier: "ProductsTableViewCell", for: indexPath) as! ProductsTableViewCell
        
        cell.setupContentView(product: products[indexPath.row])
        cell.selectionStyle = .none
        
        return cell
    }
}
