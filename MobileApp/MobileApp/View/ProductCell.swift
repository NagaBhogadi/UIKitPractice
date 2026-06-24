//
//  ProductCell.swift
//  MobileApp
//
//  Created by Naga Rajitha Bhogadi on 6/23/26.
//
import UIKit

final class ProductCell: UITableViewCell {

    static let identifier = "ProductCell"

    private let titleLabel = UILabel()
    private let priceLabel = UILabel()
    private let descriptionLabel = UILabel()
    private let productImageView = UIImageView()


    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupUI()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setupUI() {
        titleLabel.font = .boldSystemFont(ofSize: 18)
        priceLabel.font = .systemFont(ofSize: 16)
        descriptionLabel.font = .systemFont(ofSize: 14)
        descriptionLabel.numberOfLines = 2
        productImageView.contentMode = .scaleAspectFit
        productImageView.clipsToBounds = true
        
        let stackView = UIStackView(arrangedSubviews: [
            titleLabel,
            priceLabel,
            descriptionLabel
        ])
        
        stackView.axis = .vertical
        stackView.spacing = 6
        
        let mainStackView = UIStackView(arrangedSubviews: [
            productImageView,
            stackView
        ])
        mainStackView.axis = .horizontal
        mainStackView.spacing = 8
        mainStackView.alignment = .top
        mainStackView.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(mainStackView)
        
        NSLayoutConstraint.activate([
            productImageView.widthAnchor.constraint(equalToConstant: 100),
            productImageView.heightAnchor.constraint(equalToConstant: 100),
           
            mainStackView.topAnchor.constraint(equalTo: contentView.topAnchor,constant: 12),
            mainStackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            mainStackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor,constant: -16),
            mainStackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -12)
            ])
            
    }

    func configure(with product: Product) {
        titleLabel.text = product.title
        priceLabel.text = "$\(product.price)"
        descriptionLabel.text = product.description
        productImageView.fetchDataFrom(serverUrl: product.images.first ?? "")
        
    }
}
