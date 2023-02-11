//
//  CategoriesVC.swift
//  coder-swag
//
//  Created by Vadim Kononenko on 10.02.2023.
//

import UIKit
import SnapKit

class CategoriesVC: UIViewController {
    
    private var categories: [Category] = DataService().getCategories()
    
    private let categoryLabel: UILabel = {
        let label = UILabel()
        label.text = "SHOP BY CATEGORY"
        label.font = UIFont.systemFont(ofSize: 17, weight: .regular)
        return label
    }()
    
    private let categoriesTableView: UITableView = {
        let tableView = UITableView()
        tableView.register(CategoryTableViewCell.self, forCellReuseIdentifier: CategoryTableViewCell.reuseId)
        tableView.separatorStyle = .none
        return tableView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }

}

extension CategoriesVC {
    private func setup() {
        setupViews()
        setupConstraints()
    }
    
    private func setupViews() {
        view.backgroundColor = .white
        title = "CODER SWAG"
        
        categoriesTableView.delegate = self
        categoriesTableView.dataSource = self
        
        view.addSubview(categoryLabel)
        view.addSubview(categoriesTableView)
    }
    
    private func setupConstraints() {
        categoryLabel.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide).offset(30)
            make.leading.equalToSuperview().offset(20)
        }
        categoriesTableView.snp.makeConstraints { make in
            make.top.equalTo(categoryLabel.snp.bottom).offset(20)
            make.leading.trailing.equalToSuperview()
            make.bottom.equalTo(view.safeAreaLayoutGuide)
        }
    }
}

extension CategoriesVC: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let backBtn = UIBarButtonItem()
        backBtn.title = ""
        backBtn.tintColor = .black
        navigationItem.backBarButtonItem = backBtn
        let nextVC = ProductVC()
        nextVC.setupProducts(category: categories[indexPath.row])
        navigationController?.pushViewController(nextVC, animated: true)
    }
}

extension CategoriesVC: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return categories.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = categoriesTableView.dequeueReusableCell(withIdentifier: CategoryTableViewCell.reuseId) as? CategoryTableViewCell {
            cell.setupCell(category: categories[indexPath.row])
            return cell
        }
        return CategoryTableViewCell()
    }
}
