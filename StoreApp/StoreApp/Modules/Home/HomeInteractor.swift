//
//  HomeInteractor.swift
//  StoreApp
//
//  Created by Reynaldo Cristinus Hutahaean on 14/03/23.
//

import Foundation
import Alamofire

class HomeInteractor {
    
    var presenter: HomeInteractorOutput?
}

extension HomeInteractor: HomeUseCase {
    func getProductData() {
        guard let url = URL(string: "\(Constant.BaseURL)\(Constant.RoutesHome)") else { return }
        AF.request(url, method: .get, parameters: nil, encoding: URLEncoding.default, headers: nil).response { [weak self] response in
            if response.response?.statusCode == 200 {
                if let data = response.data {
                    do {
                        let decode = try JSONDecoder().decode(ResponseModel.self, from: data)
                        if let products = decode.products {
                            print("resp: \(products)")
                            self?.presenter?.successGetData(data: products)
                        }
                    } catch {
                        self?.presenter?.errorGetData(message: error.localizedDescription)
                    }
                }
            } else {
                print("error")
            }
        }
    }
}
