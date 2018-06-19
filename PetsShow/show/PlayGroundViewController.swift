//
//  PlayGroundViewController.swift
//  PetsShow
//
//  Created by Kevin on 2018/6/14.
//  Copyright © 2018 Kevin. All rights reserved.
//

import UIKit

class PlayGroundViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {

    //是否隐藏状态栏
    var isStatusBarHidden = false

    let headerView:UIImageView = UIImageView.init()
    let followingBtn:UIButton = UIButton.init(type: .custom)
    let recommendBtn:UIButton = UIButton.init(type: .custom)
    let newBtn:UIButton = UIButton.init(type: .custom)
    let searchView:UIView = UIView.init()
    let searchHint:UILabel = UILabel.init()
    let searchIconView:UIImageView = UIImageView.init()
    
    let emptyContentView:UIImageView = UIImageView.init()
    let emptyContentHint:UILabel = UILabel.init()
    
    //收藏
    var collectArray:[Bool] = [true,true,true]
    //点赞
    var likesArray:[Bool] = [true,true,true]
    
    lazy var contentTableView:UITableView = {
        let tempTableView = UITableView.init(frame: CGRect(x: 0, y: 90 + heightChangeForiPhoneXFromTop, width: kWidth, height: kHight - 50 - heightChangeForiPhoneXFromTop), style: .grouped)
        tempTableView.delegate = self
        tempTableView.dataSource = self
        tempTableView.separatorStyle = .none
        tempTableView.backgroundColor = UIColor.backgroundColors(color: .lightestgray)
        tempTableView.isScrollEnabled = true
        tempTableView.rowHeight = UITableViewAutomaticDimension
        tempTableView.estimatedRowHeight = 368
       // tempTableView.tableHeaderView = UITableViewHeaderFooterView.init(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: CGFloat.leastNormalMagnitude))
        
        return tempTableView
    }()
    
    //广场内容分类
    var selectedCatagory:playGrundCategory = .recommend
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func setupUI(){
        self.view.backgroundColor = UIColor.backgroundColors(color: .lightestgray)
        //顶部导航栏
        headerView.frame = CGRect(x: 0, y: 0, width: kWidth, height: 127 + heightChangeForiPhoneXFromTop)
        headerView.image = UIImage(named: "hearderwithshandowimg")
        //imageview允许用户交互，否则按钮点击无效
        headerView.isUserInteractionEnabled = true
        ////按钮 - 关注
        followingBtn.frame = CGRect(x: 20, y: 87, width: 60, height: 25)
        followingBtn.setTitle("关注", for: .normal)
        followingBtn.setTitleColor(UIColor.backgroundColors(color: .black), for: .normal)
        followingBtn.titleLabel?.font = UIFont.systemFont(ofSize: 18)
        followingBtn.tag = 0
        followingBtn.addTarget(self, action: #selector(catagoryChanges(_:)), for: .touchUpInside)
        
        recommendBtn.frame = CGRect(x: 80, y: 87, width: 60, height: 25)
        recommendBtn.setTitle("推荐", for: .normal)
        recommendBtn.setTitleColor(UIColor.backgroundColors(color: .mainColor), for: .normal)
        recommendBtn.titleLabel?.font = UIFont.systemFont(ofSize: 18)
        recommendBtn.tag = 1
        recommendBtn.addTarget(self, action: #selector(catagoryChanges(_:)), for: .touchUpInside)
        
        newBtn.frame = CGRect(x: 140, y: 87, width: 60, height: 25)
        newBtn.setTitle("最新", for: .normal)
        newBtn.setTitleColor(UIColor.backgroundColors(color: .black), for: .normal)
        newBtn.titleLabel?.font = UIFont.systemFont(ofSize: 18)
        newBtn.tag = 2
        newBtn.addTarget(self, action: #selector(catagoryChanges(_:)), for: .touchUpInside)
        
        searchView.frame = CGRect(x: 20, y: 0, width: kWidth - 40, height: 27)
        searchView.backgroundColor = UIColor.backgroundColors(color: .white)
        searchView.layer.cornerRadius = 6
        
        //为searchView添加点击事件
        let singleTap = UITapGestureRecognizer(target: self, action: #selector(searchViewTapped))
        singleTap.numberOfTapsRequired = 1
        singleTap.numberOfTouchesRequired = 1
        searchView.addGestureRecognizer(singleTap)
        
        searchHint.frame = CGRect(x: 40, y: 0, width: kWidth - 40, height: 27)
        searchHint.textColor = UIColor.titleColors(color: .gray)
        searchHint.font = UIFont.systemFont(ofSize: 14)
        searchHint.text = "试试搜索拉布拉多"
        
        searchIconView.frame = CGRect(x: 20, y: 7, width: 14, height: 14)
        searchIconView.image = UIImage(named: "searchicon")
        
        emptyContentView.frame = CGRect(x: (kWidth - 204)/2, y: 80, width: 204, height: 153)
        emptyContentView.image = UIImage(named: "contentemptyimg")
        emptyContentView.isHidden = true
        
        emptyContentHint.frame = CGRect(x: 20, y: emptyContentView.frame.maxY + 15, width: kWidth - 40, height: 40)
        emptyContentHint.font = UIFont.systemFont(ofSize: 14)
        emptyContentHint.textAlignment = .center
        emptyContentHint.text = "嗨呀！这里好空，\n快去广场上认识新朋友吧"
        emptyContentHint.numberOfLines = 2
        emptyContentHint.textColor = UIColor.titleColors(color: .gray)
        emptyContentHint.isHidden = true
        
        self.view.addSubview(headerView)
        headerView.addSubview(followingBtn)
        headerView.addSubview(recommendBtn)
        headerView.addSubview(newBtn)
        self.view.addSubview(contentTableView)
        contentTableView.addSubview(searchView)
        contentTableView.addSubview(emptyContentView)
        contentTableView.addSubview(emptyContentHint)
        searchView.addSubview(searchHint)
        searchView.addSubview(searchIconView)
        self.view.bringSubview(toFront: headerView)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch selectedCatagory {
        case .recommend:
            emptyContentView.isHidden = true
            emptyContentHint.isHidden = true
            tableView.backgroundColor = UIColor.backgroundColors(color: .lightestgray)
            return 3
        case .following:
            emptyContentView.isHidden = false
            emptyContentHint.isHidden = false
            tableView.backgroundColor = UIColor.backgroundColors(color: .white)
            return 0
        case .new:
            tableView.backgroundColor = UIColor.backgroundColors(color: .white)
            emptyContentView.isHidden = false
            emptyContentHint.isHidden = false
            return 0
        default:
            emptyContentView.isHidden = false
            emptyContentHint.isHidden = false
            tableView.backgroundColor = UIColor.backgroundColors(color: .white)
            return 0
        }
       // return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = contentTableViewCell.customCell(tableView: contentTableView)
        cell.selectionStyle = .none
        
        //随机头像
        let avatarIndex = Int(arc4random()%10+1)
        let Avatarimage = UIImage(named: avatars.value(forKey: String(avatarIndex))as! String)
        
        let avatar = createIcon(avatar:Avatarimage!, imageSize: 46, locale: CGRect(x: 15, y: 15, width: 46, height: 46), iconShape: .AvatarShapeTypeRound,with: false)
        cell.contentView.addSubview(avatar)
        
        cell.rewardBtn.addTarget(self, action: #selector(prizeBtnClicked), for: .touchUpInside)
        cell.collectionBtn.addTarget(self, action: #selector(collectionBtnClicked(_:)), for: .touchUpInside)
        cell.collectionBtn.tag = indexPath.row + 10
        cell.likeBtn.addTarget(self, action: #selector(likeBtnClicked(_:)), for: .touchUpInside)
        cell.likeBtn.tag = indexPath.row
        
        cell.shareBtn.addTarget(self, action: #selector(sharedBtnClicked), for: .touchUpInside)
        
        if collectArray[indexPath.row]{
            cell.collectionBtn.setImage(UIImage(named: "collectionsicon-selected"), for: .normal)
        }else{
            cell.collectionBtn.setImage(UIImage(named: "collectionsicon"), for: .normal)
        }
        
        if likesArray[indexPath.row]{
            cell.likeBtn.setImage(UIImage(named: "likeicon-selected"), for: .normal)
        }else{
            cell.likeBtn.setImage(UIImage(named: "likeicon"), for: .normal)
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 388
    }
    
    func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        UIView.animate(withDuration: 0.3, delay: 0.1, options: [.curveEaseInOut], animations: {
            self.headerView.transform = CGAffineTransform(translationX: 0, y: -147)
        }, completion: nil)
        return true
    }
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        
        let height:CGFloat = contentTableView.frame.size.height
        let distanceFromButton:CGFloat = contentTableView.contentSize.height - contentTableView.contentOffset.y;
        if (distanceFromButton == height)
        {
            print("=====滑动到底了")
          //  NSLog(@"=====滑动到底了");
        }
      // print("offSet：\(Int(contentTableView.contentOffset.y))")
        
        if emptyContentHint.isHidden {
            if (contentTableView.contentOffset.y > 10){
                
                UIView.animate(withDuration: 0.3, delay: 0.1, options: [.curveEaseInOut], animations: {
                    self.headerView.transform = CGAffineTransform(translationX: 0, y: -147)
                    self.contentTableView.frame = CGRect(x: 0, y: heightChangeForiPhoneXFromTop - 30, width: kWidth, height: kHight  + 70 - heightChangeForiPhoneXFromTop)
                }, completion: nil)
            }else if (Int(contentTableView.contentOffset.y) <= -10){
                //print("=====滑动到顶了")
                UIView.animate(withDuration: 0.3, delay: 0, options: [.curveLinear], animations: {
                    self.headerView.transform = CGAffineTransform(translationX: 0, y: 0)
                    self.contentTableView.frame = CGRect(x: 0, y: 90 + heightChangeForiPhoneXFromTop, width: kWidth, height: kHight - 50 - heightChangeForiPhoneXFromTop)
                }, completion: nil)
                
                if Int(contentTableView.contentOffset.y) >= -10 && Int(contentTableView.contentOffset.y) <= 0{
                    UIView.animate(withDuration: 0.3, delay: 0, options: [.curveLinear], animations: {
                        // self.headerView.transform = CGAffineTransform(translationX: 0, y: 0)
                        self.contentTableView.frame = CGRect(x: 0, y: 130 + heightChangeForiPhoneXFromTop, width: kWidth, height: kHight - 90 - heightChangeForiPhoneXFromTop)
                    }, completion: nil)
                }
            }
        }
        

    }
    
    @objc func catagoryChanges(_ button:UIButton){
        let index = button.tag
        
        if index == 0{
            selectedCatagory = .following
        }else if index == 1{
            selectedCatagory = .recommend
        }else if index == 2{
            selectedCatagory = .new
        }else{
            print("index error")
            selectedCatagory = .recommend
        }
        
        switch selectedCatagory {
        case .recommend:
            followingBtn.setTitleColor(UIColor.backgroundColors(color: .black), for: .normal)
            recommendBtn.setTitleColor(UIColor.backgroundColors(color: .mainColor), for: .normal)
            newBtn.setTitleColor(UIColor.backgroundColors(color: .black), for: .normal)
        case .following:
            followingBtn.setTitleColor(UIColor.backgroundColors(color: .mainColor), for: .normal)
            recommendBtn.setTitleColor(UIColor.backgroundColors(color: .black), for: .normal)
            newBtn.setTitleColor(UIColor.backgroundColors(color: .black), for: .normal)
        case .new:
            followingBtn.setTitleColor(UIColor.backgroundColors(color: .black), for: .normal)
            recommendBtn.setTitleColor(UIColor.backgroundColors(color: .black), for: .normal)
            newBtn.setTitleColor(UIColor.backgroundColors(color: .mainColor), for: .normal)
        default:
            followingBtn.setTitleColor(UIColor.backgroundColors(color: .black), for: .normal)
            recommendBtn.setTitleColor(UIColor.backgroundColors(color: .mainColor), for: .normal)
            newBtn.setTitleColor(UIColor.backgroundColors(color: .black), for: .normal)
        }
        contentTableView.reloadData()
    }
    override func viewWillAppear(_ animated: Bool) {
       // if !isStatusBarHidden {
            setStatusBarHiden(toHidden: false, ViewController: self)
            setStatusBarBackgroundColor(color: UIColor.backgroundColors(color: .clear))
       // }
    }

    @objc func prizeBtnClicked(){
        let popVC = BlurPopupViewController()
        let prizeView = ActionView(frame: CGRect(x: 0, y: 0, width: kWidth, height: kHight))
        popVC.view.backgroundColor = UIColor.clear
        popVC.view.addSubview(blurEffectView(frame: CGRect(x: 0, y: 0, width: kWidth, height: kHight))) //UIColor(red: 0.5, green: 0.5, blue: 0.5, alpha: 0.5)
        popVC.view.addSubview(popVC.grayLayer)
        popVC.modalPresentationCapturesStatusBarAppearance = true
        prizeView.popupVC = popVC
        
       // prizeView.createViewWithActionType(ActionType: .quotePrice)
        
        popVC.modalPresentationStyle = UIModalPresentationStyle.overCurrentContext //
        popVC.view.addSubview(prizeView)
        
        self.present(popVC, animated: true, completion: nil)
    }
    
    @objc func collectionBtnClicked(_ button:UIButton){
        collectArray[button.tag - 10] = !collectArray[button.tag - 10]
        contentTableView.reloadData()
        
    }
    
    @objc func likeBtnClicked(_ button:UIButton){
        likesArray[button.tag] = !likesArray[button.tag]
        contentTableView.reloadData()
    }
    @objc func searchViewTapped(){
        print("search View Clicked")
        let searchVC = SearchViewController()
        self.present(searchVC, animated: true, completion: nil)
    }
    @objc func sharedBtnClicked(){
        
//        let testActionView = UIAlertController(title: "hello", message: nil, preferredStyle: .actionSheet)
//        let action = UIAlertAction(title: "取消", style: .cancel) { (UIAlertAction) in
//        }
//        testActionView.addAction(action)
//        self.present(testActionView, animated: true, completion: nil)
        
        isStatusBarHidden = true
        self.setNeedsStatusBarAppearanceUpdate()
        let sheetView = HBAlertSheetView(iconArray: ["wechatimg","momentsimg","weiboimg","peterimg","qqimg"], titleArray: ["微信","朋友圈","微博","Peter","QQ"])
        sheetView.delegate = self

        //let vc = UIAlertController(title: "", message: "\n\n\n", preferredStyle: .actionSheet) //\n占位符多少决定了上方View的高度。 两行需要6个\n
        let vc = MyAlertController(title: "", message: "\n\n\n", preferredStyle: .actionSheet) //\n占位符多少决定了上方View的高度。 两行需要6个\n
        vc.view.addSubview(sheetView)
        let action = UIAlertAction(title: "取消", style: .cancel) { (UIAlertAction) in
            
        }
        
        vc.addAction(action)
        self.present(vc, animated: true, completion: nil)
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

extension PlayGroundViewController:HBAlertSheetViewDelegate {
    
    func didClickOnItemAtIndex(index: NSInteger) {
        print("index = \(index)")
        switch index {
        case 0:
            greyLayerPrompt.show(text: "分享到微信")
        case 1:
            greyLayerPrompt.show(text: "分享到朋友圈")
        case 2:
            greyLayerPrompt.show(text: "分享到微博")
        case 3:
            greyLayerPrompt.show(text: "分享到Peter")
        case 4:
            greyLayerPrompt.show(text: "分享到QQ")
        default:
            greyLayerPrompt.show(text: "分享到微信")
        }
        self.dismiss(animated: true, completion: nil)
    }
}
