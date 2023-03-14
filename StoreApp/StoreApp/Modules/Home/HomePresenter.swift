//
//  HomePresenter.swift
//  StoreApp
//
//  Created by Reynaldo Cristinus Hutahaean on 14/03/23.
//

import Foundation

class HomePresenter {
    
    weak var view: HomeView?
    var interactor: HomeUseCase?
    var router: HomeWireFrame?
    
    var products: [ProductModel]?
}

extension HomePresenter: HomePresentation {
    func viewDidLoad() {
        getProductData()
    }
    
    private func getProductData() {
        interactor?.getProductData()
    }
    
    func navigateToDetail(products: ProductModel) {
        router?.navigateToDetail(data: products)
    }
}

extension HomePresenter: HomeInteractorOutput {
    func successGetData(data: [ProductModel]) {
        products = data
        view?.reloadTableView()
    }
    
    func errorGetData(message: String) {
        print(message)
    }
}
