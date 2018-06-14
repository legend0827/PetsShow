//
//  ShopViewController.swift
//  PetsShow
//
//  Created by Kevin on 2018/5/28.
//  Copyright © 2018 Kevin. All rights reserved.
//

import UIKit

class ShopViewController: UIViewController,UICollectionViewDelegate,UICollectionViewDataSource {
    
    //商店Banner
    let scrollingBanner:UIImageView = UIImageView.init()
    //选择的类目index
    var selectedIndex:Int = 1
    
    let CELL_ID = "cell_id";
    
    lazy var catagoryCollectionView:UICollectionView = {
        
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width:(kWidth - 50)/2,height: (kWidth - 50)/2 + 42)  //设置item尺寸
        layout.minimumLineSpacing = 10  //上下间隔
        layout.minimumInteritemSpacing = 5 //左右间隔
        layout.sectionInset = UIEdgeInsets.init(top: 0, left: 20, bottom: 10, right: 20)            //section四周的缩进
        layout.scrollDirection = UICollectionViewScrollDirection.vertical  //滚动方向
        
        let tempCollectionView = UICollectionView(frame: CGRect(x: 0, y: 206, width: kWidth, height: kHight - 346 - heightChangeForiPhoneXFromBottom ),collectionViewLayout:layout) //
        tempCollectionView.backgroundColor = UIColor.backgroundColors(color: .white)
        tempCollectionView.delegate = self
        tempCollectionView.dataSource = self
        tempCollectionView.isScrollEnabled = true // 允许拖动
        tempCollectionView.register(ShopCollectionViewCell.self, forCellWithReuseIdentifier: CELL_ID)
        // 注册一个headView
       // tempCollectionView.register(CollectionReusableViewHeader.self, forSupplementaryViewOfKind:UICollectionElementKindSectionHeader, withReuseIdentifier: headerIdentifier)
        return tempCollectionView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        steupUI()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 4
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CELL_ID, for: indexPath) as! ShopCollectionViewCell
        switch indexPath.row {
        case 0:
            cell.catogoryCellImageView.image = UIImage(named: "petsmainfoodimg")
            cell.catogoryNameInCell.text = "宠物主粮"
        case 1:
            cell.catogoryCellImageView.image = UIImage(named: "petsmaincare")
            cell.catogoryNameInCell.text = "医疗保健"
        case 2:
            cell.catogoryCellImageView.image = UIImage(named: "petsmainsnakes")
            cell.catogoryNameInCell.text = "宠物零食"
        case 3:
            cell.catogoryCellImageView.image = UIImage(named: "petsusagesimg")
            cell.catogoryNameInCell.text = "家具日用"
        default:
            print("defaults")
        }
        
        let singleTap = UITapGestureRecognizer(target: self, action: #selector(singletaped(_:)))
        singleTap.numberOfTapsRequired  = 1
        singleTap.numberOfTouchesRequired  = 1
        cell.tag = indexPath.row
        cell.addGestureRecognizer(singleTap)
        cell.isUserInteractionEnabled = true
        return cell
    }
    
    func steupUI(){
        
        let bgOfTab:UIView = UIView.init(frame: CGRect(x: 0, y: kHight - 146 - heightChangeForiPhoneXFromBottom, width: kWidth, height: 64 + heightChangeForiPhoneXFromBottom)) //
        bgOfTab.backgroundColor = UIColor.backgroundColors(color: .mainColor)
        self.view.backgroundColor = UIColor.backgroundColors(color: .white)
        
        scrollingBanner.frame = CGRect(x: 20, y: 30, width: kWidth - 40, height: 146)
        scrollingBanner.image = UIImage(named: "shopbanner")
        
        self.view.addSubview(scrollingBanner)
        self.view.addSubview(catagoryCollectionView)
        self.view.addSubview(bgOfTab)
    }
    
    @objc func singletaped(_ ges:UIGestureRecognizer){
        //cell索引
        let index = ges.view!.tag
//        if index == 0{
            let mainFoodVC = mainFoodViewController()
            let nav = UINavigationController(rootViewController: mainFoodVC)
            self.present(nav, animated: true, completion: nil)
        //}
        
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
