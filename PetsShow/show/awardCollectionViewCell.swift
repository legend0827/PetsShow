//
//  awardCollectionViewCell.swift
//  PetsShow
//
//  Created by Kevin on 2018/6/18.
//  Copyright © 2018 Kevin. All rights reserved.
//

import UIKit

class awardCollectionViewCell: UICollectionViewCell {
    
    //赞赏图
    let Rimage:UIImageView = UIImageView.init()
    //背景
    let RimageBGView:UIView = UIView.init()
    //物品名称
    let contentName:UILabel = UILabel.init()
    //-1
    let minusOneBtn:UIButton = UIButton.init(type: .custom)
    //+1
    let plusOneBtn:UIButton = UIButton.init(type: .custom)
    //数量
    let numberOfProduct:UITextField = UITextField.init()
    //包裹数量
    let pocketNumber:UILabel = UILabel.init()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        RimageBGView.frame = CGRect(x: 1, y: 10, width: frame.width - 2, height: frame.width - 2)
        RimageBGView.layer.borderColor = UIColor.titleColors(color: .gray).cgColor
        RimageBGView.layer.borderWidth = 1
        RimageBGView.layer.cornerRadius = 3
        
        pocketNumber.frame = CGRect(x: frame.width - 35, y: 1, width: 30, height: 22)
        pocketNumber.textAlignment = .center
        pocketNumber.layer.cornerRadius = 10
        pocketNumber.textColor = UIColor.backgroundColors(color: .white)
        pocketNumber.layer.backgroundColor = UIColor.red.cgColor
        pocketNumber.text = "0"
        
        Rimage.frame = CGRect(x: 10, y: 10, width: frame.width - 20, height: frame.width - 20)
        Rimage.image = UIImage(named:"awardimg1")
        
        contentName.frame = CGRect(x: 0, y: RimageBGView.frame.maxY + 15, width:RimageBGView.frame.width, height: 20)
        contentName.textAlignment = .center
        contentName.textColor = UIColor.backgroundColors(color: .black)
        contentName.font = UIFont.systemFont(ofSize: 14)
        
        minusOneBtn.frame = CGRect(x: 0, y: contentName.frame.maxY + 5, width: 16, height: 16)
        minusOneBtn.setImage(UIImage(named: "minusOneimg"), for: .normal)
        
        
        plusOneBtn.frame = CGRect(x: frame.width - 16, y: contentName.frame.maxY + 5, width: 16, height: 16)
        plusOneBtn.setImage(UIImage(named: "plusOneimg"), for: .normal)
        
        numberOfProduct.frame = CGRect(x: 0, y: contentName.frame.maxY + 5, width:RimageBGView.frame.width, height: 20)
        numberOfProduct.text = "0"
        numberOfProduct.textAlignment = .center
        numberOfProduct.textColor = UIColor.titleColors(color: .black)
        
        
        self.contentView.addSubview(RimageBGView)
        RimageBGView.addSubview(Rimage)
        self.contentView.addSubview(pocketNumber)
        self.contentView.addSubview(contentName)
        self.contentView.addSubview(numberOfProduct)
        self.contentView.addSubview(minusOneBtn)
        self.contentView.addSubview(plusOneBtn)
        
        
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
