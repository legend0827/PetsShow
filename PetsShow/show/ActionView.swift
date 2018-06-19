//
//  ActionView.swift
//  PetsShow
//
//  Created by Kevin on 2018/6/18.
//  Copyright © 2018 Kevin. All rights reserved.
//

import UIKit

class ActionView: UIView,UICollectionViewDelegate,UICollectionViewDataSource {

    
    
    //弹窗VC
    var popupVC = BlurPopupViewController()
    //关闭按钮
    let closeBtn:UIButton = UIButton.init(type: .custom)
    //弹窗白班
    let whitePlate:UIView = UIView.init()
    //标题
    let actionTitle:UILabel = UILabel.init()
    //赞一下
    let confirmPrizeBtn:UIButton = UIButton.init(type: .custom)
    //按钮提示文字
    let buttonHint:UILabel = UILabel.init()
    let buttonTitle:UILabel = UILabel.init()
    
    //checkbox
    let checkBoxBtn:UIButton = UIButton.init(type: .custom)
    var checkStatus = true
    //reminder
    let lackOfgoodsReminder:UILabel = UILabel.init()
    //产品数量
    var numberRing:[Int] = [0,0,1,0]
//    var selectedItem:
    
    let CELL_ID = "cell_id";
    
    lazy var prizeListCollection:UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: (kWidth - 110)/3 - 30 ,height: (kWidth - 110)/3 + 40)  //设置item尺寸
        layout.minimumLineSpacing = 15  //上下间隔
        layout.minimumInteritemSpacing = 15 //左右间隔
        layout.sectionInset = UIEdgeInsets.init(top: 0, left: 0, bottom: 0, right: 0)            //section四周的缩进
        layout.scrollDirection = UICollectionViewScrollDirection.vertical  //滚动方向
        
        let tempCollectionView = UICollectionView(frame: CGRect(x: 0, y: 0, width: kWidth, height: 0),collectionViewLayout:layout)
        tempCollectionView.backgroundColor = UIColor.backgroundColors(color: .white)
        tempCollectionView.delegate = self
        tempCollectionView.dataSource = self
        tempCollectionView.isScrollEnabled = true // 允许拖动
        tempCollectionView.register(awardCollectionViewCell.self, forCellWithReuseIdentifier: CELL_ID)
        
        
        return tempCollectionView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        stetupUI(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func stetupUI(frame:CGRect){
        closeBtn.frame = CGRect(x: 35, y: 35, width: 32, height: 32)
        closeBtn.setImage(UIImage(named: "closeimg"), for: .normal)
        closeBtn.addTarget(self, action: #selector(closeBtnClicked), for: .touchUpInside)
        
        whitePlate.frame = CGRect(x: 35, y: 135, width: kWidth - 70, height: kHight - 330)
        whitePlate.layer.cornerRadius = 12
        whitePlate.backgroundColor = UIColor.backgroundColors(color: .white)
        
        actionTitle.frame = CGRect(x: 35, y: whitePlate.frame.minY - 52, width: kWidth - 70, height: 42)
        actionTitle.font = UIFont.systemFont(ofSize: 30)
        actionTitle.textColor = UIColor.titleColors(color: .white)
        actionTitle.textAlignment  = .center
        actionTitle.text = "赞赏"
        
        checkBoxBtn.frame = CGRect(x: 35, y: whitePlate.frame.height - 31, width: 20, height: 20)
        checkBoxBtn.setImage(UIImage(named: "checkboximg"), for: .normal)
        checkBoxBtn.addTarget(self, action: #selector(checkBoxClicked), for: .touchUpInside)
        
        lackOfgoodsReminder.frame = CGRect(x: 60, y: whitePlate.frame.height - 31, width: whitePlate.frame.width - 60, height: 20)
        lackOfgoodsReminder.text = "礼物不足时自动消耗Show币兑换"
        lackOfgoodsReminder.textAlignment = .left
        lackOfgoodsReminder.textColor = UIColor.titleColors(color: .black)
        lackOfgoodsReminder.font = UIFont.systemFont(ofSize: 12)
        
        prizeListCollection.frame = CGRect(x: 20, y: 20, width: whitePlate.frame.width - 40, height: kHight - 430)
        
        confirmPrizeBtn.frame = CGRect(x: 35, y: whitePlate.frame.maxY + 20, width: kWidth - 70, height: 52)
        confirmPrizeBtn.layer.cornerRadius = 26
        confirmPrizeBtn.layer.masksToBounds = true
        confirmPrizeBtn.setBackgroundImage(UIImage(named: "confirmBgImg"), for: .normal)
        confirmPrizeBtn.addTarget(self, action: #selector(confirmPrizeBtnClicked), for: .touchUpInside)
        
        buttonTitle.frame = CGRect(x: 0, y:0, width: confirmPrizeBtn.frame.width, height: 33)
        buttonTitle.textColor = UIColor.titleColors(color: .white)
        buttonTitle.text = "赞一下"
        buttonTitle.textAlignment = .center
        buttonTitle.font = UIFont.systemFont(ofSize: 24)
        
        buttonHint.frame = CGRect(x: 0, y:30, width: confirmPrizeBtn.frame.width, height: 20)
        buttonHint.textColor = UIColor.titleColors(color: .white)
        buttonHint.text = "本次赞赏将消费：240Show币"
        buttonHint.textAlignment = .center
        buttonHint.font = UIFont.systemFont(ofSize: 14)
        //confirmPrizeBtn.addTarget(self, action: #selector(checkBoxClicked), for: .touchUpInside)
        
        let awardHint:UILabel = UILabel.init(frame: CGRect(x: 35, y: confirmPrizeBtn.frame.maxY + 10, width: confirmPrizeBtn.frame.width, height: 17))
        awardHint.text = "请留意：赞赏物品均属于虚拟物品"
        awardHint.textColor = UIColor.titleColors(color: .white)
        awardHint.textAlignment = .left
        awardHint.font = UIFont.systemFont(ofSize: 12)
        
        self.addSubview(closeBtn)
        self.addSubview(actionTitle)
        self.addSubview(whitePlate)
        whitePlate.addSubview(checkBoxBtn)
        whitePlate.addSubview(lackOfgoodsReminder)
        whitePlate.addSubview(prizeListCollection)
        self.addSubview(confirmPrizeBtn)
        confirmPrizeBtn.addSubview(buttonHint)
        confirmPrizeBtn.addSubview(buttonTitle)
        self.addSubview(awardHint)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 4
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CELL_ID, for: indexPath) as! awardCollectionViewCell
        
        cell.Rimage.image = UIImage(named: "awardimg\(indexPath.row + 1)")
        cell.plusOneBtn.tag = indexPath.row+10
        cell.minusOneBtn.tag = indexPath.row
        cell.plusOneBtn.addTarget(self, action: #selector(plusOneClicked(_:)), for: .touchUpInside)
        cell.minusOneBtn.addTarget(self, action: #selector(minusOneClicked(_:)), for: .touchUpInside)
        
        cell.numberOfProduct.text = String(numberRing[indexPath.row])
        
        if numberRing[indexPath.row] != 0{
            cell.RimageBGView.layer.borderColor = UIColor.backgroundColors(color: .mainColor).cgColor
        }else{
            
            cell.RimageBGView.layer.borderColor = UIColor.titleColors(color: .gray).cgColor
        }

        switch indexPath.row {
        case 0:
            cell.contentName.text = "磨牙棒"
            cell.pocketNumber.text = "121"
            cell.pocketNumber.isHidden = false
        case 1:
            cell.contentName.text = "猫粮"
            cell.pocketNumber.text = "0"
            cell.pocketNumber.isHidden = true
        case 2:
            cell.contentName.text = "宠物粮"
            cell.pocketNumber.text = "3"
            cell.pocketNumber.frame = CGRect(x: cell.RimageBGView.frame.maxX - 22, y: cell.RimageBGView.frame.minY - 10, width: 22, height: 22)
            cell.pocketNumber.layer.cornerRadius = 10
            cell.pocketNumber.isHidden = false
        case 3:
            cell.contentName.text = "宠物笼"
            cell.pocketNumber.text = "0"
            cell.pocketNumber.isHidden = true
        default:
            cell.contentName.text = "宠物笼"
            cell.pocketNumber.text = "0"
            cell.pocketNumber.isHidden = true
        }
        return cell
        
    }
//    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
//        guard let cell = collectionView.cellForItem(at: indexPath) else {
//            print("not selected")
//            return
//        }
//
//        (cell as! awardCollectionViewCell).RimageBGView.layer.borderColor = UIColor.backgroundColors(color: .mainColor).cgColor
//    }
    @objc func closeBtnClicked(){
        popupVC.dismiss(animated: true, completion: nil)
    }
    
    @objc func checkBoxClicked(){
        checkStatus = !checkStatus
        if checkStatus{
            checkBoxBtn.setImage(UIImage(named: "checkboximg"), for: .normal)
        }else{
            checkBoxBtn.setImage(UIImage(named: "checkboximg-uncheck"), for: .normal)
        }
    }
    
    @objc func plusOneClicked(_ button:UIButton){
        numberRing[button.tag - 10] += 1
        prizeListCollection.reloadData()
    }
    
    @objc func minusOneClicked(_ button:UIButton){
        if numberRing[button.tag] != 0{
            numberRing[button.tag] -= 1
        }else{
            numberRing[button.tag] = 0
        }
        prizeListCollection.reloadData()
    }
    @objc func confirmPrizeBtnClicked(){
        greyLayerPrompt.show(text: "礼物投递成功、谢谢您的赞赏")
        popupVC.dismiss(animated: true, completion: nil)
    }
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
