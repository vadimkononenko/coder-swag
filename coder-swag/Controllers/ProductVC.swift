//
//  ProductVC.swift
//  coder-swag
//
//  Created by Vadim Kononenko on 11.02.2023.
//

import UIKit
import SnapKit

class ProductVC: UIViewController {
    
    private(set) var products = [Product]()

    private let categoryLabel: UILabel = {
        let label = UILabel()
        label.text = "PRODUCTS"
        label.font = UIFont.systemFont(ofSize: 17, weight: .regular)
        return label
    }()
    
    private let productsCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.showsVerticalScrollIndicator = false
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.backgroundColor = UIColor(red: 243/255, green: 243/255, blue: 243/255, alpha: 1)
        collectionView.register(ProductCollectionViewCell.self, forCellWithReuseIdentifier: ProductCollectionViewCell.reuseId)
        return collectionView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    
    func setupProducts(category: Category) {
        products = DataService().getProducts(forCategoryTitle: category.title)
        navigationItem.title = category.title
    }

}

extension ProductVC {
    private func setup() {
        view.backgroundColor = UIColor(red: 243/255, green: 243/255, blue: 243/255, alpha: 1)
        
        productsCollectionView.delegate = self
        productsCollectionView.dataSource = self
        
        setupViews()
        setupConstraints()
    }
    
    private func setupViews() {
        view.addSubview(categoryLabel)
        view.addSubview(productsCollectionView)
    }
    
    private func setupConstraints() {
        categoryLabel.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide).offset(30)
            make.leading.equalToSuperview().offset(20)
        }
        productsCollectionView.snp.makeConstraints { make in
            make.top.equalTo(categoryLabel.snp.bottom).offset(20)
            make.leading.trailing.equalToSuperview()
            make.bottom.equalTo(view.safeAreaLayoutGuide)
        }
    }
}

extension ProductVC: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = (view.bounds.size.width / 2) - 20
        let height = (view.bounds.size.height / 2) - 80
        return CGSize(width: width, height: height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
    }
}

extension ProductVC: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return products.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = productsCollectionView.dequeueReusableCell(withReuseIdentifier: ProductCollectionViewCell.reuseId, for: indexPath) as? ProductCollectionViewCell {
            cell.setupCells(product: products[indexPath.row])
            return cell
        }
        return ProductCollectionViewCell()
    }
    
    
}
