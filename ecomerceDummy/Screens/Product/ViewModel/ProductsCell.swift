//
//  ProductsCell.swift
//  ecomerceDummy
//
//  Created by Prakash on 07/01/23.
//

import UIKit


class ProductsCell: UITableViewCell {

   static let identifier = "ProductsCellIdentifier"
    
    private let box : UIView = {
       let view = UIView()
        view.backgroundColor = .systemGray6
        view.layer.cornerRadius = 20
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
        
    }()

    private let productImageView : UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 12
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let title : UILabel = {
       let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 2
        label.font = UIFont.boldSystemFont(ofSize: 16)
        return label
    }()
    
    private let category : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 1
        label.textColor = .systemGray
        label.font = UIFont.systemFont(ofSize: 14)
        return label
    }()
    
    private let rating : UILabel = {
       let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .systemYellow
        label.numberOfLines = 1
        label.font = UIFont.systemFont(ofSize: 15, weight: .medium)
        return label
    }()
    
    private let descriptionLabel : UILabel = {
       let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 3
        label.font = UIFont.systemFont(ofSize: 14)
        label.textColor = .systemGray
        return label
    }()
    
    private let priceLabel : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .systemBlue
        label.font = .systemFont(ofSize: 16, weight: .medium)
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(box)
        box.backgroundColor = .systemGray6
        box.addSubview(productImageView)
        box.addSubview(title)
        box.addSubview(category)
        box.addSubview(rating)
        box.addSubview(descriptionLabel)
        box.addSubview(priceLabel)
        
        applyConstraints()
    }
    
    
    private func applyConstraints(){
        let boxConstraints = [
            box.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 12),
            box.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8),
            box.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -12),
            box.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -8),
        ]
        
        let productImageViewConstraints = [
            productImageView.leadingAnchor.constraint(equalTo: box.leadingAnchor,constant: 8),
            productImageView.topAnchor.constraint(equalTo: box.topAnchor,constant: 8),
            productImageView.bottomAnchor.constraint(equalTo: box.bottomAnchor,constant: -8),
            productImageView.widthAnchor.constraint(equalToConstant: 120)
        ]
        
        let titleConstraints = [
            title.leadingAnchor.constraint(equalTo: productImageView.trailingAnchor,constant: 20),
            title.trailingAnchor.constraint(equalTo: box.trailingAnchor,constant:  -20),
            title.topAnchor.constraint(equalTo: box.topAnchor, constant: 12),
        ]
        
        let categoryConstraints = [
            category.leadingAnchor.constraint(equalTo: productImageView.trailingAnchor,constant: 20),
            category.topAnchor.constraint(equalTo: title.bottomAnchor,constant: 12),
        ]
        
        let ratingConstraints = [
            rating.leadingAnchor.constraint(equalTo: category.trailingAnchor , constant: 20),
            rating.topAnchor.constraint(equalTo: title.bottomAnchor,constant: 12),
            rating.trailingAnchor.constraint(equalTo: title.trailingAnchor)
        ]
        
        let descriptionLabelConstraints = [
            descriptionLabel.leadingAnchor.constraint(equalTo: title.leadingAnchor),
            descriptionLabel.trailingAnchor.constraint(equalTo: title.trailingAnchor),
            descriptionLabel.topAnchor.constraint(equalTo: category.bottomAnchor,constant: 8)
        ]
        
        let priceLabelConstraints = [
            priceLabel.leadingAnchor.constraint(equalTo: title.leadingAnchor),
            priceLabel.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor,constant: 10)
        ]
        
        NSLayoutConstraint.activate(boxConstraints)
        NSLayoutConstraint.activate( productImageViewConstraints )
        NSLayoutConstraint.activate(titleConstraints)
        NSLayoutConstraint.activate(categoryConstraints)
        NSLayoutConstraint.activate(ratingConstraints)
        NSLayoutConstraint.activate(descriptionLabelConstraints)
        NSLayoutConstraint.activate(priceLabelConstraints)
    }
    
    public func configure(with model : ProductModel){
        productImageView.setImage(with: model.image)
        title.text = model.title
        category.text = model.category
        rating.text = "⭐️ \(model.rating.rate)"
        descriptionLabel.text = model.description
        priceLabel.text = "$\(model.price)"
    }
    
    required init?(coder: NSCoder) {
        fatalError("Product cell error")
    }
    
}
