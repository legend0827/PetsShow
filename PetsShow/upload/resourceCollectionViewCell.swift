//
//  resourceCollectionViewCell.swift
//  PetsShow
//
//  Created by Kevin on 2018/6/5.
//  Copyright © 2018 Kevin. All rights reserved.
//

import UIKit

class resourceCollectionViewCell: UICollectionViewCell {
    let Rimage:UIImageView = UIImageView.init()
    let timeLine:UILabel = UILabel.init()
    override init(frame: CGRect) {
        super.init(frame: frame)
//        let ring:UIImageView = UIImageView.init(frame: CGRect(x: self.frame.maxX - 35, y: self.frame.maxX - 35, width: 15, height: 15))
//        ring.image = UIImage(named: "checkbox-unchecked-gray")
//        self.contentView.backgroundColor = UIColor.backgroundColors(color: .black)
//        self.contentView.addSubview(ring)
        timeLine.frame = CGRect(x: 0, y: self.frame.width - 20, width:self.frame.width, height: 20)
        timeLine.layer.backgroundColor = UIColor.colorWithRgba(0, g: 0, b: 0, a: 0.4).cgColor
        timeLine.text = "00:12:01"
        timeLine.textAlignment = .center
        timeLine.textColor = UIColor.backgroundColors(color: .white)
        timeLine.font = UIFont.systemFont(ofSize: 12)
        
        Rimage.frame = CGRect(x: 0, y: 0, width: frame.width, height: frame.height) //frame
        Rimage.image = UIImage(named:"default1")
        self.contentView.addSubview(Rimage)
        self.contentView.addSubview(timeLine)
        
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
