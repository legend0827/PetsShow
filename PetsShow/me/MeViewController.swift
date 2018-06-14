//
//  MeViewController.swift
//  PetsShow
//
//  Created by Kevin on 2018/5/19.
//  Copyright © 2018 Kevin. All rights reserved.
//

import UIKit
import PagingMenuController

private struct PagingMenuOptions:PagingMenuControllerCustomizable{
    
    //作品
    private let workVC = WorksViewController(workType: .works)
    
    //喜欢
    private let likesVC = WorksViewController(workType: .likes)
    
    var backgroundColor: UIColor = UIColor.colorWithRgba(19, g: 18, b: 43, a: 1.0)//UIColor.backgroundColors(color: .black) // 设置菜单栏底色
    
    //组件类型
    fileprivate var componentType: ComponentType{
        return .all(menuOptions: MenuOptions(), pagingControllers: pagingControllers)
    }
    
    //所有子视图控制器
    fileprivate var pagingControllers: [UIViewController] {
        return [workVC,likesVC]
    }
    
    //菜单配置项
    fileprivate struct MenuOptions: MenuViewCustomizable {
        var backgroundColor: UIColor = UIColor.backgroundColors(color: .clear)
        var selectedBackgroundColor: UIColor = UIColor.backgroundColors(color: .clear)
        //菜单显示模式
        var displayMode: MenuDisplayMode {
            return .standard(widthMode: .fixed(width: kWidth/4), centerItem: false, scrollingMode: MenuScrollingMode.scrollEnabled)
          //  return .segmentedControl
        }
        var menuItemMode: MenuItemWidthMode{
            return .fixed(width: kWidth/4)
        }
        //菜单项
        var itemsOptions: [MenuItemViewCustomizable] {
            return [MenuItem1(), MenuItem2()]
        }
        //设置选中栏下方条的颜色
        var focusMode:MenuFocusMode {
            return .underline(height: 2, color: UIColor.orange, horizontalPadding: 12, verticalPadding: 5) // 水平间距 0 ，垂直间距 0
        }
        
    }
    
    //第1个菜单项
    fileprivate struct MenuItem1: MenuItemViewCustomizable {
        //自定义菜单项名称
        var displayMode: MenuItemDisplayMode {
            //return .text(title: MenuItemText(text: "全部"))
            return .text(title: MenuItemText(text: "作品", color: UIColor.titleColors(color: .white), selectedColor: UIColor.titleColors(color: .white), font: UIFont.systemFont(ofSize: 16), selectedFont: UIFont.systemFont(ofSize: 16)))
        }
    }
    
    //第2个菜单项
    fileprivate struct MenuItem2: MenuItemViewCustomizable {
        //自定义菜单项名称
        var displayMode: MenuItemDisplayMode {
            return .text(title: MenuItemText(text: "喜欢", color: UIColor.titleColors(color: .white), selectedColor: UIColor.titleColors(color: .white), font: UIFont.systemFont(ofSize: 16), selectedFont: UIFont.systemFont(ofSize: 16)))
        }
    }
    
}

class MeViewController: UIViewController {
    
    let followBtn:UIButton = UIButton.init(type: .custom)
    let moreFeature:UIButton = UIButton.init(type: .custom)
    
    let userNameLabel:UILabel = UILabel.init()
    let userAccountIDLabel:UILabel = UILabel.init()
    let userAccountIDValue:UILabel = UILabel.init()
    let vipicon:UIImageView = UIImageView.init()
    let vipLevel:UILabel = UILabel.init()
    let signatureValue:UILabel = UILabel.init()
    let likedAmountTitle:UILabel = UILabel.init()
    let likedAmountValue:UILabel = UILabel.init()
    let followingAmountTitle:UILabel = UILabel.init()
    let followingAmountValue:UILabel = UILabel.init()
    let followerAmountTitle:UILabel = UILabel.init()
    let followerAmountValue:UILabel = UILabel.init()
    
    let contentBackGroundView:UIView = UIView.init()
    let userInfoBackGroundView:UIImageView = UIImageView.init()
    
    let addfriendBtn:UIButton = UIButton.init()
    let moreBtn:UIButton = UIButton.init()
    
    var isYourOwn:Bool = true // True
    
    var pushVCBlock: ((_ vc: UIViewController,_ aniamted: Bool) -> ())?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //设置头像        
        setupUI()
        //设置背景
        self.view.backgroundColor = UIColor.backgroundColors(color: .clear)
        // Do any additional setup after loading the view.
    }
    override func viewWillAppear(_ animated: Bool) {
        setStatusBarBackgroundColor(color: UIColor.backgroundColors(color: .clear))
        UIApplication.shared.isStatusBarHidden = false
        UIView.animate(withDuration: 0.5) { () -> Void in
            self.setNeedsStatusBarAppearanceUpdate()
        }
    }

    func setupUI(){
        //定位
         // 头像框背景
        let avatarBackRingLayer1:UIView = UIView.init(frame: CGRect(x: 20, y: 89 + heightChangeForiPhoneXFromTop, width: 72, height: 72))
        userNameLabel.frame = CGRect(x: 20, y: avatarBackRingLayer1.frame.maxY + 15, width: 200, height: 22)
        userAccountIDLabel.frame = CGRect(x: 20, y: userNameLabel.frame.maxY + 5, width: 200, height: 20)
        userAccountIDValue.frame = CGRect(x: 120, y: userNameLabel.frame.maxY + 5, width: 200, height: 20)
        vipicon.frame = CGRect(x: 120, y: userNameLabel.frame.minY , width: 20, height: 20)
        vipLevel.frame = CGRect(x: 145, y: userNameLabel.frame.minY , width: 200, height: 20)
        let seperateLine1:UIView = UIView.init(frame: CGRect(x: 20, y: userAccountIDLabel.frame.maxY + 10, width: kWidth - 70, height: 1))
        signatureValue.frame = CGRect(x: 20, y: seperateLine1.frame.maxY + 10, width: kWidth - 70, height: 20)
        likedAmountTitle.frame = CGRect(x: 20, y: seperateLine1.frame.maxY + 48, width: 200, height: 22)
        likedAmountValue.frame = CGRect(x: 15, y: likedAmountTitle.frame.maxY + 5, width: 80, height: 20)
        followerAmountTitle.frame = CGRect(x: 160, y: seperateLine1.frame.maxY + 48, width: 200, height: 22)
        followerAmountValue.frame = CGRect(x: 155, y: likedAmountTitle.frame.maxY + 5, width: 80, height: 20)
        followingAmountTitle.frame = CGRect(x: 90, y: seperateLine1.frame.maxY + 48, width: 200, height: 22)
        followingAmountValue.frame = CGRect(x: 70, y: likedAmountTitle.frame.maxY + 5, width: 80, height: 20)
        
        userInfoBackGroundView.frame = CGRect(x: 0, y: 0 , width: kWidth, height:  389 + heightChangeForiPhoneXFromTop)
        let darBg:UIView = UIView.init(frame: CGRect(x: 0, y: 0 , width: kWidth, height:  389 + heightChangeForiPhoneXFromTop))
        darBg.backgroundColor = UIColor.backgroundColors(color: .black)
        darBg.alpha = 0.4
        let blurBgView = blurEffectView(frame: CGRect(x: 0, y: 0, width: kWidth, height: 389 + heightChangeForiPhoneXFromTop))
        //随机取头像
        let avatarIndex = Int(arc4random()%10+1)
        let image = UIImage(named:avatars.value(forKey: String(avatarIndex)) as! String)
        
        let avatar = createIcon(avatar:image!, imageSize: 60, locale: CGRect(x: 26, y: 95 + heightChangeForiPhoneXFromTop, width: 60, height: 60), iconShape: .AvatarShapeTypeRound,with: false)
        
        userInfoBackGroundView.image = image
        //名片背景
        contentBackGroundView.frame = CGRect(x: 0, y: userInfoBackGroundView.frame.maxY - 45, width: kWidth, height: kHight + heightChangeForiPhoneXFromBottom - userInfoBackGroundView.frame.maxY + 45)
        
        //头像背景
        avatarBackRingLayer1.backgroundColor = UIColor.backgroundColors(color: .clear)
        avatarBackRingLayer1.layer.borderColor = UIColor.backgroundColors(color: .white).cgColor
        avatarBackRingLayer1.layer.borderWidth = 1
        avatarBackRingLayer1.layer.cornerRadius = 36
        
        //用户名
        userNameLabel.font = UIFont.boldSystemFont(ofSize: 20)
        userNameLabel.textColor = UIColor.titleColors(color: .white)
        //随机用户名
        let authorIndex = Int(arc4random()%5+1)
        userNameLabel.text =  authors.value(forKey: String(authorIndex)) as! String
        
        vipicon.image = UIImage(named: "vipiconimg")
        vipLevel.textColor = UIColor.colorWithRgba(254, g: 236, b: 173, a: 1.0)
        vipLevel.text = "VIP5"
        vipLevel.font = UIFont.boldSystemFont(ofSize: 18)
        
        seperateLine1.backgroundColor = UIColor.titleColors(color: .white)
        
        userAccountIDLabel.text = "PetsShow号:"
        userAccountIDLabel.font = UIFont.systemFont(ofSize: 14)
        userAccountIDLabel.textColor = UIColor.titleColors(color: .white)
        
        userAccountIDValue.text = "6920291291"
        userAccountIDValue.font = UIFont.systemFont(ofSize: 14)
        userAccountIDValue.textColor = UIColor.titleColors(color: .white)
        
        signatureValue.text = "本宝宝暂时还没有想到个性签名"
        signatureValue.font = UIFont.systemFont(ofSize: 14)
        signatureValue.textColor = UIColor.titleColors(color: .white)
        
        likedAmountTitle.text = "获赞"
        likedAmountTitle.font = UIFont.boldSystemFont(ofSize: 20)
        likedAmountTitle.textColor = UIColor.titleColors(color: .white)
        
        likedAmountValue.text = "200.2W"
        likedAmountValue.font = UIFont.systemFont(ofSize: 18)
        likedAmountValue.textColor = UIColor.titleColors(color: .white)
        
        followingAmountTitle.text = "关注"
        followingAmountTitle.font = UIFont.boldSystemFont(ofSize: 20)
        followingAmountTitle.textColor = UIColor.titleColors(color: .white)
        
        followingAmountValue.text = "252"
        followingAmountValue.font = UIFont.systemFont(ofSize: 18)
        followingAmountValue.textAlignment = .center
        followingAmountValue.textColor = UIColor.titleColors(color: .white)
        
        followerAmountTitle.text = "粉丝"
        followerAmountTitle.font = UIFont.boldSystemFont(ofSize: 20)
        followerAmountTitle.textColor = UIColor.titleColors(color: .white)
        
        followerAmountValue.text = "892W"
        followerAmountValue.font = UIFont.systemFont(ofSize: 18)
        followerAmountValue.textColor = UIColor.titleColors(color: .white)
        
        contentBackGroundView.backgroundColor = UIColor.colorWithRgba(19, g: 18, b: 43, a: 0.5)
        contentBackGroundView.layer.cornerRadius = 16
        contentBackGroundView.layer.shadowColor = UIColor.backgroundColors(color: .black).cgColor
        contentBackGroundView.layer.shadowOffset = CGSize(width: 0, height: 5)
        
        addfriendBtn.setImage(UIImage(named: "addfriendimg"), for: .normal)
        addfriendBtn.frame = CGRect(x: kWidth - 79, y: 29 + heightChangeForiPhoneXFromTop, width: 29, height: 22)
        
        moreBtn.frame = CGRect(x: kWidth - 48, y: 29 + heightChangeForiPhoneXFromTop, width: 42, height: 22)
        moreBtn.setImage(UIImage(named: "moreimg"), for: .normal)
        moreBtn.addTarget(self, action: #selector(moreBtnClicked), for: .touchUpInside)
        /// 菜单栏配置
        
        //分页菜单配置
        let options = PagingMenuOptions()
        //分页菜单控制器初始化
        let pagingMenuController = PagingMenuController(options: options)
        //分页菜单控制器尺寸设置
        pagingMenuController.view.frame.origin.y += 22 //28 //(4 + heightChangeForiPhoneXFromTop)*3
        pagingMenuController.view.frame.size.height -= 5
        
        if UIDevice.current.isX(){
            heightChangeForiPhoneXFromTop = 24.0
            pagingMenuController.view.frame.origin.y += -28//56
        }else{
            heightChangeForiPhoneXFromTop = 0.0
            pagingMenuController.view.frame.origin.y += -24//32//5
        }
        //建立父子关系
        addChildViewController(pagingMenuController)
        //分页菜单控制器视图添加到当前视图中
        contentBackGroundView.addSubview(pagingMenuController.view)
        
        
        self.view.addSubview(userInfoBackGroundView)
        self.view.addSubview(darBg)
        self.view.addSubview(blurBgView)
        self.view.addSubview(avatarBackRingLayer1)
        self.view.addSubview(avatar)
        self.view.addSubview(userNameLabel)
        self.view.addSubview(vipLevel)
        self.view.addSubview(vipicon)
        self.view.addSubview(userAccountIDLabel)
        self.view.addSubview(userAccountIDValue)
        self.view.addSubview(seperateLine1)
        self.view.addSubview(signatureValue)
        self.view.addSubview(likedAmountTitle)
        self.view.addSubview(likedAmountValue)
        self.view.addSubview(followerAmountTitle)
        self.view.addSubview(followerAmountValue)
        self.view.addSubview(followingAmountTitle)
        self.view.addSubview(followingAmountValue)
        self.view.addSubview(contentBackGroundView)
        self.view.addSubview(addfriendBtn)
        self.view.addSubview(moreBtn)
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @objc func moreBtnClicked(){
        //备份代码
        let actionSheet = UIAlertController(title: "更多操作", message: nil, preferredStyle: .actionSheet)
        let cancelBtn = UIAlertAction(title: "取消", style: .cancel, handler: nil)
        let takePhotos = UIAlertAction(title: "我的钱包", style: .destructive) { (action:UIAlertAction) -> Void in
            
            greyLayerPrompt.show(text: "选择了我的钱包")
        }
        let selectPhotos = UIAlertAction(title: "个人信息编辑", style: .default, handler: {
            (action:UIAlertAction)
            -> Void in
            greyLayerPrompt.show(text: "选择了个人信息编辑")
        })
        actionSheet.addAction(cancelBtn)
        actionSheet.addAction(takePhotos)
        actionSheet.addAction(selectPhotos)
        self.present(actionSheet, animated: true, completion: nil)
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
