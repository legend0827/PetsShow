//
//  PetsShowViewController.swift
//  PetsShow
//
//  Created by Kevin on 2018/5/19.
//  Copyright © 2018 Kevin. All rights reserved.
//

import UIKit
class PetsShowViewController: UIViewController,UIScrollViewDelegate{
    
    //用来放置各个图片单元
    var collectionView:UICollectionView!
    //collectionView的布局
    var collectionViewLayout: UICollectionViewFlowLayout!
    
    //页控制器（小圆点）
  //  var pageControl : UIPageControl!
    
    let sectionSwitcher:UIView = UIView.init(frame: CGRect(x: 0, y: 34, width: kWidth, height: 40))
    let sectionOfRecommend:UIButton = UIButton.init(type: .custom)
    let sectionOfFollowing:UIButton = UIButton.init(type: .custom)
    let headerView:UIImageView = UIImageView.init(frame: CGRect(x: 0, y: -20, width: kWidth, height: 100))
    override func viewDidLoad() {
        super.viewDidLoad()
       // self.view.addSubview(scrollBackView)
        
        setStatusBarBackgroundColor(color: UIColor.backgroundColors(color: .clear))
        
        sectionOfRecommend.frame = CGRect(x: 20, y: 15, width: 40, height: 20)
        sectionOfRecommend.setTitle("推荐", for: .normal)
        sectionOfRecommend.titleLabel?.font = UIFont.boldSystemFont(ofSize: 18)
        sectionOfRecommend.setTitleColor(UIColor.titleColors(color: .white), for: .normal)
        sectionOfRecommend.addTarget(self, action: #selector(recommendSectionClicked), for: .touchUpInside)
        
        
        sectionOfFollowing.frame = CGRect(x: 70, y: 15, width: 40, height: 20)
        sectionOfFollowing.setTitle("关注", for: .normal)
        sectionOfFollowing.titleLabel?.font = UIFont.boldSystemFont(ofSize: 18)
        sectionOfFollowing.setTitleColor(UIColor.titleColors(color: .transparentWhite), for: .normal)
        sectionOfFollowing.addTarget(self, action: #selector(followingSectionClicked), for: .touchUpInside)
        
        sectionSwitcher.backgroundColor =  UIColor.backgroundColors(color: .clear)
        //支持多点触摸
        self.view.isMultipleTouchEnabled = true

        //collectionView尺寸样式设置
        collectionViewLayout = UICollectionViewFlowLayout()
        collectionViewLayout.minimumLineSpacing = 0
        collectionViewLayout.minimumInteritemSpacing = 0
        //横向滚动
        collectionViewLayout.scrollDirection = .vertical//.horizontal
        
        //collectionView初始化
        collectionView = UICollectionView(frame: self.view.bounds,
                                          collectionViewLayout: collectionViewLayout)
        collectionView.backgroundColor = UIColor.black
        collectionView.register(ShowContentCollectionCell.self, forCellWithReuseIdentifier: "cell")
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.isPagingEnabled = true
        
        self.view.addSubview(collectionView)
        
        sectionSwitcher.addSubview(sectionOfFollowing)
        sectionSwitcher.addSubview(sectionOfRecommend)
       // self.view.addSubview(showContentCell)
        self.view.addSubview(sectionSwitcher)
        
        //不自动调整内边距，确保全屏
        if #available(iOS 11.0, *) {
            collectionView.contentInsetAdjustmentBehavior = .never
        } else {
            self.automaticallyAdjustsScrollViewInsets = false
        }

        //将视图滚动到默认图片上
        let indexPath = IndexPath(item: 0, section: 0)
        collectionView.scrollToItem(at: indexPath, at: .bottom, animated: false)
       
    }
    @objc func recommendSectionClicked(){
        sectionOfFollowing.setTitleColor(UIColor.titleColors(color: .transparentWhite), for: .normal)
        sectionOfRecommend.setTitleColor(UIColor.titleColors(color: .white), for: .normal)
        sectionOfRecommend.titleLabel?.font = UIFont.boldSystemFont(ofSize: 18)
        sectionOfFollowing.titleLabel?.font = UIFont.systemFont(ofSize: 18)
    }
    @objc func followingSectionClicked(){
        sectionOfRecommend.setTitleColor(UIColor.titleColors(color: .transparentWhite), for: .normal)
        sectionOfFollowing.setTitleColor(UIColor.titleColors(color: .white), for: .normal)
        sectionOfFollowing.titleLabel?.font = UIFont.boldSystemFont(ofSize: 18)
        sectionOfRecommend.titleLabel?.font = UIFont.systemFont(ofSize: 18)
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    override func viewWillAppear(_ animated: Bool) {
        setStatusBarBackgroundColor(color: UIColor.backgroundColors(color: .clear))
        UIApplication.shared.isStatusBarHidden = true
        UIView.animate(withDuration: 0.5) { () -> Void in
            self.setNeedsStatusBarAppearanceUpdate()
        }
        
    }

}

extension PetsShowViewController:UICollectionViewDelegate, UICollectionViewDataSource,
UICollectionViewDelegateFlowLayout{
    
    //collectionView单元格创建
    func collectionView(_ collectionView: UICollectionView,
                        cellForItemAt indexPath: IndexPath)
        -> UICollectionViewCell {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell",
                                                          for: indexPath) as! ShowContentCollectionCell
            cell.petsVC = self
            //随机获取背景
            let backgIndex = Int(arc4random()%5+1)
            let image = UIImage(named:backgrounds.value(forKey: String(backgIndex)) as! String)
            
            //随机标题
            let titleIndex = Int(arc4random()%5+1)
            cell.titleOfContentLabel.text = titles.value(forKey: String(titleIndex)) as! String

            //随机作者
            let authorIndex = Int(arc4random()%5+1)
            cell.authorNameLabel.text = "@\(authors.value(forKey: String(authorIndex)) as! String)"
            //随机数据
            cell.likeAmountLabel.text = getRandomNumbers()
            cell.commentsAmountLabel.text = getRandomNumbers()
            cell.shareAmountLabel.text = getRandomNumbers()
            cell.prizeAmountLabel.text = getRandomNumbers()
            
            cell.titleOfContentLabel.frame =  CGRect(x: 20, y: 21, width: kWidth - 40, height: calculateLabelHeightWithText(with: cell.titleOfContentLabel.text!, labelWidth: kWidth - 40, textFont: UIFont.systemFont(ofSize: 16)))
            
            cell.contentBackImage.image = image
            print("redner index = \(indexPath)")
            return cell
            
    }
    //collectionView单元格数量
    func collectionView(_ collectionView: UICollectionView,
                        numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    
    //collectionView单元格尺寸
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        return self.view.bounds.size
    }
    
    //collectionView里某个cell将要显示
    func collectionView(_ collectionView: UICollectionView,
                        willDisplay cell: UICollectionViewCell,
                        forItemAt indexPath: IndexPath) {
        if let cell = cell as? ShowContentCollectionCell{
            //由于单元格是复用的，所以要重置内部元素尺寸
            cell.resetSize()// resetSize()
        }
    }
    
    //collectionView里某个cell显示完毕
    func collectionView(_ collectionView: UICollectionView,
                        didEndDisplaying cell: UICollectionViewCell,
                        forItemAt indexPath: IndexPath) {
        //当前显示的单元格
        let visibleCell = collectionView.visibleCells[0]
        //设置页控制器当前页
        //self.pageControl.currentPage = collectionView.indexPath(for: visibleCell)!.item
    }
}
