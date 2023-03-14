//
//  HomeContract.swift
//  StoreApp
//
//  Created by Reynaldo Cristinus Hutahaean on 14/03/23.
//

import UIKit

protocol HomeView: AnyObject {
    var presenter: HomePresentation? { get set }
    
    func reloadTableView()
}

protocol HomeUseCase: AnyObject {
    var presenter: HomeInteractorOutput? { get set }
    
    func getProductData()
}

protocol HomeWireFrame: AnyObject {
    func createModule() -> UIViewController
    
    func navigateToDetail(data: ProductModel)
}

protocol HomePresentation: AnyObject {
    var view: HomeView? { get set }
    var interactor: HomeUseCase? { get set }
    var router: HomeWireFrame? { get set }
    
    var products: [ProductModel]? { get set }
    
    func viewDidLoad()
    func navigateToDetail(products: ProductModel)
}

protocol HomeInteractorOutput: AnyObject {
    func successGetData(data: [ProductModel])
    func errorGetData(message: String)
}
