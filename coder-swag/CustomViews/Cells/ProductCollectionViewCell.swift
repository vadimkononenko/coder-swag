//
//  ProductCollectionViewCell.swift
//  coder-swag
//
//  Created by Vadim Kononenko on 11.02.2023.
//

import UIKit
import SnapKit

class ProductCollectionViewCell: UICollectionViewCell {
    
    static let reuseId = String(describing: ProductCollectionViewCell.self)
    
    private let productImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.clipsToBounds = true
        return imageView
    }()
    
    private let productTitleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14)
        label.textColor = #colorLiteral(red: 0.136839658, green: 0.1486211419, blue: 0.1645026505, alpha: 1)
        label.numberOfLines = 2
        return label
    }()
    
    private let productPriceLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14)
        label.textColor = #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)
        label.numberOfLines = 1
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupCells(product: Product) {
        productImageView.image = UIImage(named: product.imageName)
        productTitleLabel.text = product.title
        productPriceLabel.text = product.price
    }
    
}

extension ProductCollectionViewCell {
    private func setup() {
        self.backgroundColor = UIColor(red: 243/255, green: 243/255, blue: 243/255, alpha: 1)
        self.clipsToBounds = true
        
        setupViews()
        setupConstraints()
    }
    
    private func setupViews() {
        self.addSubview(productImageView)
        self.addSubview(productTitleLabel)
        self.addSubview(productPriceLabel)
    }
    
    private func setupConstraints() {
        productImageView.snp.makeConstraints { make in
            make.top.leading.trailing.equalToSuperview()
            make.height.equalTo(178)
        }
        productTitleLabel.snp.makeConstraints { make in
            make.top.equalTo(productImageView.snp.bottom).offset(9)
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
        }
        productPriceLabel.snp.makeConstraints { make in
            make.top.equalTo(productTitleLabel.snp.bottom).offset(3)
            make.leading.trailing.equalTo(productTitleLabel)
        }
    }
}
