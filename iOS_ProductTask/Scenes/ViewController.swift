//
//  ViewController.swift
//  iOS_ProductTask
//
//  Created by Ahmad Abdulrady
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.backgroundColor = .blue
        test()
    }

    func test() {
        let url = URL(string: Constants.Api.baseURL + Constants.Api.path)!
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data else {
                return
            }
            do {
                
                let products =  try JSONDecoder().decode([Product].self, from: data)
                print(products)
            } catch {
                print(error)
            }
        }.resume()
    }
}

