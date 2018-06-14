//
//  ShopCollectionViewCell.swift
//  PetsShow
//
//  Created by Kevin on 2018/6/2.
//  Copyright © 2018 Kevin. All rights reserved.
//

import UIKit

class ShopCollectionViewCell: UICollectionViewCell {
    
    let catogoryCellView:UIView = UIView.init()
    let catogoryCellImageView:UIImageView = UIImageView.init()
    let catogoryNameInCell:UILabel = UILabel.init()

    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        catogoryCellView.frame =  CGRect(x: 0, y: 0, width: frame.width, height: frame.height)
        catogoryCellImageView.frame = CGRect(x: 5, y: 5, width: frame.width - 10, height: frame.width - 10)
        catogoryNameInCell.frame = CGRect(x: 5, y: frame.width + 10, width: frame.width - 10, height: 20)
        
        
        catogoryCellView.layer.backgroundColor = UIColor.backgroundColors(color: .white).cgColor
        catogoryCellView.layer.cornerRadius = 6
        catogoryCellView.layer.shadowOffset = CGSize.zero//CGSize(width: 0, height: 0)
        catogoryCellView.layer.shadowOpacity = 1.0
        
        catogoryCellView.layer.shadowColor = UIColor.lineColors(color: .lightGray).cgColor//UIColor.black.cgColor
        
        
       // catogoryCellImageView.image = UIImage(named: "defualt-design-pic")
        catogoryCellImageView.contentMode = .center//.scaleAspectFill
        catogoryCellImageView.layer.cornerRadius = 6
        catogoryCellImageView.layer.masksToBounds = true
        catogoryCellImageView.layer.borderColor = UIColor.lineColors(color: .lightGray).cgColor
        catogoryCellImageView.layer.borderWidth = 0.5
        
       
        catogoryNameInCell.textColor = UIColor.titleColors(color: .black)
        catogoryNameInCell.font = UIFont.systemFont(ofSize:16)
        catogoryNameInCell.textAlignment = .center
        
        self.addSubview(catogoryCellView)
        catogoryCellView.addSubview(catogoryCellImageView)
        
        catogoryCellView.addSubview(catogoryNameInCell)

    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
