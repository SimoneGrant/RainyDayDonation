//
//  MenuCollectionCell.swift
//  RainyDayDonation
//
//  Created by Simone on 1/16/17.
//  Copyright © 2017 Simone. All rights reserved.
//

import UIKit
import SnapKit

class MenuCollectionCell: UICollectionViewCell {
    var menu: Menu? {
        didSet {
            nameLabel.text = menu?.name
            if let imageName = menu?.name {
                iconImageView.image = UIImage(named: imageName)
            }
        }
    }
    
    //MARK: Views
    var nameLabel: UILabel = {
        let label = UILabel()
        label.text = "Settings"
        label.font = UIFont.systemFont(ofSize: 13)
        return label
    }()
    
    var iconImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "umbrella-2")
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        contentView.addSubview(nameLabel)
        contentView.addSubview(iconImageView)
        setupViews()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupViews() {
        nameLabel.snp.makeConstraints { (make) -> Void in
            make.bottom.right.equalTo(self)
            make.left.equalTo(iconImageView.snp.right).offset(8)
            make.centerY.equalTo(self)
        }
        
        iconImageView.snp.makeConstraints { (make) -> Void in
            make.left.equalTo(self).offset(8)
            make.centerY.equalTo(self)
        }
        
    }
    
}
