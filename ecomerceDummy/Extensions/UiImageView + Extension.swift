//
//  UiImageView + Extension.swift
//  ecomerceDummy
//
//  Created by Prakash on 08/01/23.
//

import UIKit
import Kingfisher

extension UIImageView {
    func setImage(with urlString: String){
        guard let url = URL.init(string: urlString) else {return}
        let resources = ImageResource(downloadURL: url,cacheKey: urlString)
        kf.indicatorType = .activity
        kf.setImage(with: resources)
    }
}
