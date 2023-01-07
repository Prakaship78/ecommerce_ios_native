//
//  ViewController.swift
//  ecomerceDummy
//
//  Created by Prakash on 05/01/23.
//

import UIKit

class ProductListViewController: UIViewController {
    
    private var viewModel = ProductsViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        title = "Products"
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationController?.navigationItem.largeTitleDisplayMode = .always
        configuration()
        }
    


}

extension ProductListViewController {
    func configuration(){
        initViewModel()
        observeEvent()
    }
    
    func initViewModel(){
        viewModel.fetchProducts()
    }
    
    // Data binding - communication
    func observeEvent(){
        viewModel.eventHandler = { [weak self] events in
            guard let self else {return}
            
            switch events{
            case .loading:
                print("Products loading")
            case .stopLoading:
                print("Stop Loading")
            case.dataLoaded:
                print("Products loaded")
                print(self.viewModel.products.first)
            case .error(let error):
                print(error?.localizedDescription)
            }
            
        }
    }
}

