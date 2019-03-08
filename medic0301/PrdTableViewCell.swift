//
//  PrdTableViewCell.swift
//  medic0301
//
//  Created by Mini on 2019/3/1.
//  Copyright © 2019 Mini. All rights reserved.
//

import UIKit

class PrdTableViewCell: UITableViewCell {
    var productImageView: UIImageView!
    var productNameLabel: UILabel!
    var productTypeLabel: UILabel!
    var productPriceLabel: UILabel!
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        productImageView = UIImageView()
        productImageView.backgroundColor = UIColor.red
        productImageView.translatesAutoresizingMaskIntoConstraints = false
        addSubview(productImageView)
        productImageView.widthAnchor.constraint(equalToConstant: 160).isActive = true
        productImageView.topAnchor.constraint(equalTo: topAnchor,
                                              constant: 20).isActive = true
        productImageView.leftAnchor.constraint(equalTo: leftAnchor,
                                               constant: 20).isActive = true
        productImageView.bottomAnchor.constraint(equalTo: bottomAnchor,
                                                 constant: -20).isActive = true
        
        productNameLabel = UILabel()
        productNameLabel.text = "商品"
        productNameLabel.textColor = UIColor.gray
        productNameLabel.font = UIFont.systemFont(ofSize: 24)
        productNameLabel.translatesAutoresizingMaskIntoConstraints = false
        addSubview(productNameLabel)
        productNameLabel.topAnchor.constraint(equalTo: productImageView.topAnchor).isActive = true
        productNameLabel.leftAnchor.constraint(equalTo: productImageView.rightAnchor, constant: 16).isActive = true
        productNameLabel.rightAnchor.constraint(equalTo: rightAnchor, constant: -16).isActive = true
        
        productTypeLabel = UILabel()
        productTypeLabel.textColor = UIColor.gray
        productTypeLabel.text = "類別"
        productTypeLabel.font = UIFont.systemFont(ofSize: 24)
        productTypeLabel.translatesAutoresizingMaskIntoConstraints = false
        addSubview(productTypeLabel)
        productTypeLabel.topAnchor.constraint(equalTo: productNameLabel.bottomAnchor, constant: 16).isActive = true
        productTypeLabel.leftAnchor.constraint(equalTo: productImageView.rightAnchor, constant: 16).isActive = true
        productTypeLabel.rightAnchor.constraint(equalTo: rightAnchor, constant: -16).isActive = true
        
        productPriceLabel = UILabel()
        productPriceLabel.text = "價格"
        productPriceLabel.textColor = UIColor.gray
        productPriceLabel.font = UIFont.systemFont(ofSize: 24)
        productPriceLabel.translatesAutoresizingMaskIntoConstraints = false
        addSubview(productPriceLabel)
        productPriceLabel.topAnchor.constraint(equalTo: productTypeLabel.bottomAnchor, constant: 16).isActive = true
        productPriceLabel.leftAnchor.constraint(equalTo: productImageView.rightAnchor, constant: 16).isActive = true
        productPriceLabel.rightAnchor.constraint(equalTo: rightAnchor, constant: -16).isActive = true
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
