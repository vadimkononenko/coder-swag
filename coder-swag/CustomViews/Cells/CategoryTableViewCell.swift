//
//  CategoryTableViewCell.swift
//  coder-swag
//
//  Created by Vadim Kononenko on 10.02.2023.
//

import UIKit
import SnapKit

class CategoryTableViewCell: UITableViewCell {
    
    static let reuseId = String(describing: CategoryTableViewCell.self)
    
    private let bgImageView: UIImageView = {
        let imageView = UIImageView()
        return imageView
    }()
    
    private let itemTitleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        label.textAlignment = .center
        label.textColor = .white
        return label
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

extension CategoryTableViewCell {
    private func setup() {
        setupViews()
        setupConstraints()
    }
    
    private func setupViews() {
        addSubview(bgImageView)
        addSubview(itemTitleLabel)
    }
    
    private func setupConstraints() {
        bgImageView.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview()
            make.top.equalToSuperview().offset(3)
            make.bottom.equalToSuperview().offset(-3)
        }
        itemTitleLabel.snp.makeConstraints { make in
            make.centerX.centerY.equalToSuperview()
        }
    }
    
    func setupCell(category: Category) {
        bgImageView.image = UIImage(named: category.bgImage)
        itemTitleLabel.text = category.title
    }
}
