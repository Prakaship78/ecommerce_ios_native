//
//  ViewController.swift
//  ecomerceDummy
//
//  Created by Prakash on 05/01/23.
//

import UIKit
import SVProgressHUD

class ProductListViewController: UIViewController {
    
    private var viewModel = ProductsViewModel()
    
    private let productsTable : UITableView = {
       let table = UITableView()
        table.register(ProductsCell.self, forCellReuseIdentifier: ProductsCell.identifier)
        table.separatorStyle = .none
        return table
    }()
    
//    var loader: UIAlertController = UIAlertController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        SVProgressHUD.show(withStatus: "Loading...")
//         loader = self.showLoader()
        view.backgroundColor = .systemBackground
        title = "Products"
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationController?.navigationItem.largeTitleDisplayMode = .always
        configuration()
        
        view.addSubview(self.productsTable)
        self.productsTable.delegate = self
        self.productsTable.dataSource = self
        }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        productsTable.frame = view.bounds
    }
    


}

extension ProductListViewController : UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.products.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: ProductsCell.identifier, for: indexPath) as? ProductsCell else {return UITableViewCell()}
        cell.configure(with: viewModel.products[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
}


// api mvvm extension
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
//                self.stopLoader(loader: self.loader)
                SVProgressHUD.dismiss()
                print("Stop Loading")
            case.dataLoaded:
                print("Products loaded")
                DispatchQueue.main.async {
                    self.productsTable.reloadData()
                }
                
            case .error(let error):
                print(error as Any)
            }
            
        }
    }
}



