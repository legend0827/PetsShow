//
//  HBAlertSheetView.swift
//  封装分享朋友圈视图
//
//  Created by XSX on 17/2/27.
//  Copyright © 2017年 hivebox. All rights reserved.
//

import UIKit
let SHARESINGLEVIEWWIDTH: CGFloat =  70

protocol HBAlertSheetViewDelegate{
    func didClickOnItemAtIndex(index: NSInteger)
}
class HBAlertSheetView: UIView {
    let scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.backgroundColor = UIColor.clear
        scrollView.isPagingEnabled = true
        scrollView.showsVerticalScrollIndicator = false
        scrollView.showsHorizontalScrollIndicator = false
        scrollView.isScrollEnabled = true
        scrollView.bounces = false
        return scrollView
    }()
    var singleView: HBAlertSheetSingleView?
    var delegate: HBAlertSheetViewDelegate?
    //计算alertSingleView的frame
     init(iconArray:[String], titleArray: [String]) {
        super.init(frame:.zero)
        let width = UIScreen.main.bounds.size.width
        let height = caculatouSheetViewFrameHeight(iconArray: iconArray)
        self.frame = CGRect(x: 0, y: 0, width: width - 20, height: height + 10)
        self.layer.cornerRadius = 10
        self.clipsToBounds = true
        creatShareActionView(frame: self.frame, iconArray: iconArray, titleArray: titleArray)
        addSubview(self.scrollView)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension HBAlertSheetView {
    /// 根据数组计算当前视图的高度
    func caculatouSheetViewFrameHeight(iconArray:[String]) -> CGFloat {
        /*动态计算高度*/
//        let count = iconArray.count
//        let rowNum = CGFloat(count) / 4.0
//        return rowNum <= 1 ? SHARESINGLEVIEWWIDTH : SHARESINGLEVIEWWIDTH * 2 + 10
        return SHARESINGLEVIEWWIDTH // 取消动态设置高度
    }
    
    func creatShareActionView(frame: CGRect,iconArray: [String],titleArray: [String]){
        /// 2行4列 多页形式
        let count = iconArray.count
        var page = count / 4 // 两行4列改为 8
        if count % 4 != 0 { // 两行4列改为 8
            page = page + 1
        }
        self.scrollView.frame = CGRect(x: 0, y: 10, width: frame.size.width, height: frame.size.height + 10)
        self.scrollView.contentSize = CGSize(width:frame.size.width * CGFloat(page), height: frame.size.height)
        let horizeSpace: CGFloat = count > 4 ? (frame.size.width - CGFloat(SHARESINGLEVIEWWIDTH * 4)) / 5 : (frame.size.width - SHARESINGLEVIEWWIDTH * CGFloat(count)) / CGFloat(count + 1)
        let verticalSpace: CGFloat = 10
        for p in 0..<page {
            let multView = UIView(frame: CGRect(x: frame.size.width * CGFloat(p), y: 0, width: frame.size.width, height: frame.size.height))
            self.scrollView.addSubview(multView)
            let i = p * 4 // 两行4列改为 8
            for j in i..<count {
                if j < (p + 1) * 4 { // 两行4列改为 8
                    let column = (j % 4) % 4 // 两行4列改为 8
                    let row = (j % 4)/4 // 两行4列改为 8
                    self.singleView = HBAlertSheetSingleView(imageName: iconArray[j], titleName: titleArray[j], frame: CGRect(x: horizeSpace + (horizeSpace + SHARESINGLEVIEWWIDTH) * CGFloat(column), y: (verticalSpace + SHARESINGLEVIEWWIDTH) * CGFloat(row), width: SHARESINGLEVIEWWIDTH, height: SHARESINGLEVIEWWIDTH))
                    let tapGuesture = UITapGestureRecognizer(target: self, action:#selector(shareToMultPlat(_:)))
                    self.singleView?.addGestureRecognizer(tapGuesture)
                    self.singleView?.index = j
                    multView.addSubview(self.singleView!)
                }
            }
        }
    }
    
    @objc func shareToMultPlat(_ guesture: UITapGestureRecognizer){
        if (delegate != nil) {
            let view = guesture.view as! HBAlertSheetSingleView
            self.delegate?.didClickOnItemAtIndex(index: view.index!)
        }
    }
}
