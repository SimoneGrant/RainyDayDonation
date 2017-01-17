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
    
    override var isHighlighted: Bool {
        didSet {
            backgroundColor = isHighlighted ? UIColor.darkGray : UIColor.white
            nameLabel.textColor = isHighlighted ? UIColor.white : UIColor.gray
            if isHighlighted {
                iconImageView.tintColor = UIColor.white
            }
            print(isHighlighted)
        }
    }
    
    var menu: Menu? {
        didSet {
            nameLabel.text = menu?.name
            if let imageName = menu?.imageName {
                iconImageView.image = UIImage(named: imageName)
                //                ?.withRenderingMode(.alwaysTemplate) //to change tint color to your choice
            }
        }
    }
    
    //MARK: Views
    
    var nameLabel: UILabel!
    var iconImageView: UIImageView!
    
    override init(frame: CGRect) {
        iconImageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 30, height: frame.size.height/3))
        nameLabel = UILabel(frame:  CGRect(x: 15, y: iconImageView.frame.size.height, width: frame.size.width, height: frame.size.height/3))
        super.init(frame: frame)
        nameLabel.font = UIFont(name: "San Francisco", size: 20)
        nameLabel.textColor = UIColor.gray
        nameLabel.text = "Settings"
        contentView.addSubview(nameLabel)
        
        iconImageView.contentMode = UIViewContentMode.scaleAspectFit
        iconImageView.contentMode = .scaleAspectFit
        contentView.addSubview(iconImageView)
        
        setupViews()
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupViews() {
        nameLabel.snp.makeConstraints { (make) -> Void in
            make.left.equalTo(iconImageView.snp.right).offset(8)
            make.centerY.equalTo(self)
        }
        
        iconImageView.snp.makeConstraints { (make) -> Void in
            make.left.equalTo(self).offset(8)
            make.centerY.equalTo(self)
        }
        
    }
    
}
