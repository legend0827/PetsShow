//
//  WorksViewController.swift
//  PetsShow
//
//  Created by Kevin on 2018/5/27.
//  Copyright © 2018 Kevin. All rights reserved.
//

import UIKit

class WorksViewController: UIViewController,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CELL_ID, for: indexPath) as! resourceCollectionViewCell
        
        //随机取头像
        //let avatarIndex = Int(arc4random()%5+1)
        let image = UIImage(named: "video1Img")//UIImage(named:"bg\(indexPath.row)")
        cell.Rimage.image = image
        cell.Rimage.contentMode = .scaleAspectFill
        cell.timeLine.isHidden = true
        
        return cell
    }
    

    var _workType:contentCategoryType = contentCategoryType.works
    
    
    let CELL_ID = "cell_id";
    //相册元素
    lazy var resourceCollectionView:UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: kWidth/3 - 2 ,height: kWidth/3 - 2)  //设置item尺寸
        layout.minimumLineSpacing = 1  //上下间隔
        layout.minimumInteritemSpacing = 1 //左右间隔
        layout.sectionInset = UIEdgeInsets.init(top: 0, left: 0, bottom: 0, right: 0)            //section四周的缩进
        layout.scrollDirection = UICollectionViewScrollDirection.vertical  //滚动方向
        
        let tempCollectionView = UICollectionView(frame: CGRect(x: 0, y: 0, width: kWidth, height: kHight - 470 - heightChangeForiPhoneXFromBottom),collectionViewLayout:layout)
        tempCollectionView.backgroundColor = UIColor.backgroundColors(color: .white)
        tempCollectionView.delegate = self
        tempCollectionView.dataSource = self
        tempCollectionView.isScrollEnabled = true // 允许拖动
        tempCollectionView.backgroundColor = UIColor.backgroundColors(color: .lightestgray)
        tempCollectionView.register(resourceCollectionViewCell.self, forCellWithReuseIdentifier: CELL_ID)
        return tempCollectionView
    }()
    
    init(workType:contentCategoryType) {
        super.init(nibName: nil, bundle: nil)
        _workType = workType
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        if _workType == .works{
            self.view.backgroundColor = UIColor.clear
        }else{
            self.view.backgroundColor = UIColor.clear
        }
        self.view.addSubview(resourceCollectionView)
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
