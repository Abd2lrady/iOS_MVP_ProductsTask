//
//  ViewController.swift
//  iOS_ProductTask
//
//  Created by Ahmad Abdulrady
//

import UIKit

class ProductsListVC: UIViewController {

    var presenter: ProductsListPresenterProtocol!
    weak var coordinator: ProductsListCoordinatorProtocol?
 
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        //view.backgroundColor = .blue
        test()
    }

    func test() {
//                let url = URL(string: "https://api.jsonserve.com/3wPBqi")!
//                URLSession.shared.dataTask(with: url) { data, response, error in
//                    guard let data = data else {
//                        return
//                    }
//                    do {
//
//                        let products =  try JSONDecoder().decode([Product].self, from: data)
//                        print(products)
//                    } catch {
//                        print(error)
//                    }
//                }.resume()
//        NetworkManager.shared.request(target: ProductTarget.getProducts) { result in
//            switch result {
//            case .failure(let error):
//                print(error)
//            case .success(let data):
//                do {
//                    let products =  try JSONDecoder().decode([Product].self, from: data)
//                    print(products)
//                } catch (let error){
//                    print(error)
//                }
//            }
//        }
        
        RemoteProductService().getProducts { result in
            switch result {
            case .failure(let error):
                switch error {
                case .network(let error):
                    print("catched network error")
                    print(error)
                case .parse(let error):
                    print("catched parse error")
                    print(error)
                }
            case .success(let products):
                print(products.count)
            }
        }
    }
}

extension ProductsListVC: ProductsListViewProtocol {
    func productsFetched() {
        
    }
    
    
}
