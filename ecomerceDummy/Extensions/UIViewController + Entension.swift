//
//  UIViewController + Entension.swift
//  ecomerceDummy
//
//  Created by Prakash on 10/01/23.
//

import UIKit

extension UIViewController {
    func showLoader() -> UIAlertController {
        let alert = UIAlertController(title: "", message: "Loading...", preferredStyle: .alert)
        let indicator = UIActivityIndicatorView(frame: CGRect(x: 10, y: 5, width: 50, height: 50))
        indicator.hidesWhenStopped = true
        indicator.startAnimating()
        indicator.style = .medium
        alert.view.addSubview(indicator)
        self.parent?.present(alert, animated: true)
        return alert
    }
    
    func stopLoader(loader : UIAlertController)  {
        DispatchQueue.main.async {
            loader.dismiss(animated: true)
        }
    }
}
