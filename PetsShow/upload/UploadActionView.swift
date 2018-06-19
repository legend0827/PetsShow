//
//  UploadActionView.swift
//  PetsShow
//
//  Created by Kevin on 2018/6/5.
//  Copyright © 2018 Kevin. All rights reserved.
//

import UIKit
import PagingMenuController


class UploadActionView: UIView,UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 20
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CELL_ID, for: indexPath) as! resourceCollectionViewCell
        
        //随机取头像
        let avatarIndex = Int(arc4random()%10+1)
        let image = UIImage(named:avatars.value(forKey: String(avatarIndex)) as! String)
        cell.Rimage.image = image
        if isVideoModel{
            cell.timeLine.isHidden = false
        }else{
            cell.timeLine.isHidden = true
        }
        return cell
    }
    
   
    //弹窗ViewVC
    var popupVC = PopupViewController()
    var uploadVC = UploadViewController()

    let zVideoTab:UIButton = UIButton.init(type: .custom)
    let zPhotoTab:UIButton = UIButton.init(type: .custom)
    
    var isVideoModel:Bool = true
    //页面View
    let backgroundView:UIView = UIView.init()
    let cancelBtn:UIButton = UIButton.init(type: .custom)
    let confirmBtn:UIButton = UIButton.init(type: .custom)
    let titleOfView:UILabel = UILabel.init()
    //页面frame
    var _frame:CGRect = CGRect(x: 198, y: 50, width: 150, height: 30)
    
    let CELL_ID = "cell_id";
    //相册元素
    lazy var resourceCollectionView:UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: kWidth/3 - 2 ,height: kWidth/3 - 2)  //设置item尺寸
        layout.minimumLineSpacing = 1  //上下间隔
        layout.minimumInteritemSpacing = 1 //左右间隔
        layout.sectionInset = UIEdgeInsets.init(top: 0, left: 0, bottom: 0, right: 0)            //section四周的缩进
        layout.scrollDirection = UICollectionViewScrollDirection.vertical  //滚动方向
        
        let tempCollectionView = UICollectionView(frame: CGRect(x: 0, y: 88+heightChangeForiPhoneXFromTop, width: kWidth, height: kHight - 170 - heightChangeForiPhoneXFromBottom),collectionViewLayout:layout)
        tempCollectionView.backgroundColor = UIColor.backgroundColors(color: .white)
        tempCollectionView.delegate = self
        tempCollectionView.dataSource = self
        tempCollectionView.isScrollEnabled = true // 允许拖动
        tempCollectionView.backgroundColor = UIColor.backgroundColors(color: .lightestgray)
        tempCollectionView.register(resourceCollectionViewCell.self, forCellWithReuseIdentifier: CELL_ID)
        return tempCollectionView
    }()
    
    override init(frame:CGRect) {
        super.init(frame: frame)
        _frame = frame
        self.layer.cornerRadius = 12
        self.backgroundColor = UIColor.backgroundColors(color: .white)
        
        let bgView:UIView = UIView.init(frame: CGRect(x: 0, y: 45, width: kWidth, height: self.frame.height - 65))
        bgView.backgroundColor = UIColor.backgroundColors(color: .white)
        self.addSubview(bgView)
        
        titleOfView.frame = CGRect(x: 0, y: 10, width: kWidth, height: 22)
        titleOfView.text = "上传作品"
        titleOfView.textAlignment = .center
        titleOfView.textColor = UIColor.titleColors(color: .black)
        titleOfView.font = UIFont.boldSystemFont(ofSize: 16)
        
        cancelBtn.frame = CGRect(x: 0, y: kHight - 80 - heightChangeForiPhoneXFromBottom, width: kWidth, height: 40)
        cancelBtn.setTitle("取消", for: .normal)
        cancelBtn.setTitleColor(UIColor.titleColors(color: .black), for: .normal)
        cancelBtn.layer.backgroundColor = UIColor.white.cgColor
        cancelBtn.addTarget(self, action: #selector(cancelBtnClicked), for: .touchUpInside)
        
        zVideoTab.frame = CGRect(x: 0, y: 45, width: kWidth/2, height: 32)
        zPhotoTab.frame = CGRect(x: kWidth/2, y: 45, width: kWidth/2, height: 32)
        zPhotoTab.setTitle("照片", for: .normal)
        zVideoTab.setTitle("视频", for: .normal)
        zPhotoTab.titleLabel?.font = UIFont.systemFont(ofSize: 14)
        zVideoTab.titleLabel?.font = UIFont.systemFont(ofSize: 14)
        
        zVideoTab.setTitleColor(UIColor.backgroundColors(color: .mainColor), for: .normal)
        zPhotoTab.setTitleColor(UIColor.titleColors(color: .black), for: .normal)
        zPhotoTab.addTarget(self, action: #selector(PhotoTapped), for: .touchUpInside)
        zVideoTab.addTarget(self, action: #selector(VideoTapped), for: .touchUpInside)
         self.addSubview(resourceCollectionView)
        
        self.addSubview(zPhotoTab)
        self.addSubview(zVideoTab)
        self.addSubview(cancelBtn)
        self.addSubview(titleOfView)
        
       
        
    }
    
    @objc func VideoTapped(){
        isVideoModel = true
        zVideoTab.setTitleColor(UIColor.backgroundColors(color: .mainColor), for: .normal)
        zPhotoTab.setTitleColor(UIColor.titleColors(color: .black), for: .normal)
        resourceCollectionView.reloadData()
    }
    
    @objc func PhotoTapped(){
        isVideoModel = false
        zPhotoTab.setTitleColor(UIColor.backgroundColors(color: .mainColor), for: .normal)
        zVideoTab.setTitleColor(UIColor.titleColors(color: .black), for: .normal)
        resourceCollectionView.reloadData()
    }

  
    //点击取消按钮
    @objc func cancelBtnClicked(){
        popupVC.dismiss(animated: true, completion: nil)
        //uploadVC.dismiss(animated: true, completion: nil)
        uploadVC.tabBarController?.selectedIndex = 4
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
