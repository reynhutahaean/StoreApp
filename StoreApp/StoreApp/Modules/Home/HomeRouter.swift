//
//  HomeRouter.swift
//  StoreApp
//
//  Created by Reynaldo Cristinus Hutahaean on 14/03/23.
//

import UIKit

class HomeRouter {
    
    weak var viewController: HomeViewController?
    
    func createModule() -> UIViewController {
        let view: UIViewController & HomeView = HomeViewController()
        let interactor: HomeUseCase = HomeInteractor()
        let presenter: HomePresentation & HomeInteractorOutput = HomePresenter()
        let router: HomeWireFrame = self
        
        view.presenter = presenter
        presenter.view = view
        presenter.interactor = interactor
        presenter.router = router
        interactor.presenter = presenter
        viewController = view as? HomeViewController
        
        return view
    }
}

extension HomeRouter: HomeWireFrame {
    func navigateToDetail(data: ProductModel) {
        let detailVC = DetailViewController()
        detailVC.data = data
        detailVC.modalPresentationStyle = .fullScreen
        viewController?.present(detailVC, animated: true)
    }
}
