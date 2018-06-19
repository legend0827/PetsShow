//
//  HBAlertSheetSingleView.swift
//  封装分享朋友圈视图
//
//  Created by XSX on 17/2/27.
//  Copyright © 2017年 hivebox. All rights reserved.
//

import UIKit
let IMAGEWIDTH = 52

class HBAlertSheetSingleView: UIView {
    let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = UIColor.clear
        imageView.layer.cornerRadius = CGFloat(IMAGEWIDTH / 2)
        imageView.layer.masksToBounds = true
        return imageView
    }()
    
    let titleLabel:UILabel = {
        let lable = UILabel()
        lable.backgroundColor = UIColor.clear
        lable.textAlignment = .center
        lable.font = UIFont.systemFont(ofSize: 12)
        lable.textColor = UIColor.lightGray
        return lable
    }()
    var index: NSInteger? = 0
    
    init(imageName: String,titleName: String,frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = UIColor.clear
        self.imageView.image = UIImage(named: imageName)
        self.titleLabel.text = titleName
        addSubview(self.imageView)
        addSubview(self.titleLabel)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func layoutSubviews() {
        super.layoutSubviews()
        let margenX = 10
        let margenY = 5
        let titleHeight = Int(self.frame.size.height) - IMAGEWIDTH - margenY
        self.imageView.frame = CGRect(x: margenX, y: margenY, width: IMAGEWIDTH, height: IMAGEWIDTH)
        self.titleLabel.frame = CGRect(x: 0, y:IMAGEWIDTH + margenY , width: Int(self.frame.size.width), height: titleHeight)
    }
}










