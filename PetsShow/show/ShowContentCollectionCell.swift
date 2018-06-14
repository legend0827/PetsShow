//
//  showContentScrollView.swift
//  PetsShow
//
//  Created by Kevin on 2018/5/19.
//  Copyright © 2018 Kevin. All rights reserved.
//

import UIKit

class ShowContentCollectionCell: UICollectionViewCell {
    //滚动视图
    var scrollView:UIScrollView!
    
//    // 主页面控制器
//     var mainViewController:MainViewController!
//
//    // 菜单页控制器
//     var menuViewController:MenuViewController?

    var petsVC = PetsShowViewController()
    var meVC = MeViewController()
    // 菜单页当前状态
    var currentState = MenuState.Collapsed
//    {
//        didSet {
//            //菜单展开的时候，给主页面边缘添加阴影
//            let shouldShowShadow = currentState != .Collapsed
//            showShadowForMainViewController(shouldShowShadow: shouldShowShadow)
//        }
//    }
    let _numOfPages = 3
    let _pageWidth = kWidth
    let _pageHeight = kHight
    var _likeStatus = true
    let contentBackImage:UIImageView = UIImageView.init()
    let userIcon:UIView = UIView.init()
    let followIconOnUserIcon:UIButton = UIButton.init(type: .custom)
    let followedIconOnUserIcon:UIButton = UIButton.init(type: .custom)
    let likeBtn:UIButton = UIButton.init(type: .custom)
    let likeAmountLabel:UILabel = UILabel.init()
    let commentsBtn:UIButton = UIButton.init(type: .custom)
    let commentsAmountLabel:UILabel = UILabel.init()
    let shareBtn:UIButton = UIButton.init(type: .custom)
    let shareAmountLabel:UILabel = UILabel.init()
    let prizeBtn:UIButton = UIButton.init(type: .custom)
    let prizeAmountLabel:UILabel = UILabel.init()
    let transparentBackView:UIImageView = UIImageView.init()
    let authorNameLabel:UILabel = UILabel.init()
    let titleOfContentLabel:UILabel = UILabel.init()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        //scrollView初始化
        scrollView = UIScrollView(frame: self.contentView.bounds)
        self.contentView.addSubview(scrollView)
        scrollView.delegate = self
        //scrollView缩放范围 1~3
        scrollView.maximumZoomScale = 1.0
        scrollView.minimumZoomScale = 1.0
        scrollView.contentSize = CGSize(width: kWidth,height: kHight)
        scrollView.isPagingEnabled = true
        scrollView.showsHorizontalScrollIndicator = false
        scrollView.showsVerticalScrollIndicator = false
        scrollView.scrollsToTop = false
        //self.frame = self.view.bounds
//        //为了让内容横向滚动，设置横向内容宽度为3个页面的宽度总和
//        self.contentSize = CGSize(width: pageWidth * numOfPages,
//                                        height: pageHeight)
//        self.isPagingEnabled = true
//        self.showsHorizontalScrollIndicator = false
//        self.showsVerticalScrollIndicator = false
//        self.scrollsToTop = false
//
        contentBackImage.frame = CGRect(x: 0, y: 0, width: kWidth, height: kHight)
        contentBackImage.isUserInteractionEnabled = true
        userIcon.frame = CGRect(x: kWidth - 65, y: 220, width: 50, height: 50)
        
        followIconOnUserIcon.frame = CGRect(x: kWidth - 51, y: 260, width: 24, height: 24)
        followedIconOnUserIcon.frame = CGRect(x: kWidth - 51, y: 260, width: 24, height: 24)
        
        
        likeBtn.frame = CGRect(x: kWidth - 60, y: userIcon.frame.maxY + 41, width: 40, height: 37)
        likeAmountLabel.frame = CGRect(x: kWidth - 70, y: likeBtn.frame.maxY, width: 60, height: 22)
        
        commentsBtn.frame = CGRect(x: kWidth - 60, y: likeBtn.frame.maxY + 41, width: 40, height: 40)
        commentsAmountLabel.frame = CGRect(x: kWidth - 70, y: commentsBtn.frame.maxY, width: 60, height: 22)
        
        shareBtn.frame = CGRect(x: kWidth - 60, y: commentsBtn.frame.maxY + 41, width: 40, height: 40)
        shareAmountLabel.frame = CGRect(x: kWidth - 70, y: shareBtn.frame.maxY, width: 60, height: 22)
        
        prizeBtn.frame = CGRect(x: kWidth - 60, y: shareBtn.frame.maxY + 41, width: 40, height: 40)
        prizeAmountLabel.frame = CGRect(x: kWidth - 70, y: prizeBtn.frame.maxY, width: 60, height: 22)
        
        transparentBackView.frame = CGRect(x: 0, y: kHight - heightChangeForiPhoneXFromBottom - 138, width: kWidth, height: 138 + heightChangeForiPhoneXFromBottom)
        
        authorNameLabel.frame = CGRect(x: 20, y: 0, width: kWidth - 40, height: 22)
        titleOfContentLabel.frame = CGRect(x: 20, y: 21, width: kWidth - 40, height: 22)
        
        //contentBackImage.image = UIImage(named: "contentBackground")
        transparentBackView.image = UIImage(named: "transparentBgOfContentImg")
        
        
        if _likeStatus{
            likeBtn.setImage(UIImage(named: "likeicon"), for: .normal)
        }else{
            likeBtn.setImage(UIImage(named: "unlikeicon"), for: .normal)
        }
        followIconOnUserIcon.setImage(UIImage(named: "followicon"), for: .normal)
        followedIconOnUserIcon.setImage(UIImage(named: "checkedicon"), for: .normal)
        followedIconOnUserIcon.isHidden = true
        commentsBtn.setImage(UIImage(named: "commentsicon"), for: .normal)
        shareBtn.setImage(UIImage(named: "shareicon"), for: .normal)
        prizeBtn.setImage(UIImage(named: "prizeicon"), for: .normal)
        
        likeAmountLabel.text = "20.2W"
        likeAmountLabel.font = UIFont.systemFont(ofSize: 16)
        likeAmountLabel.textAlignment = .center
        likeAmountLabel.textColor = UIColor.titleColors(color: .white)
        
        commentsAmountLabel.text = "9,921"
        commentsAmountLabel.font = UIFont.systemFont(ofSize: 16)
        commentsAmountLabel.textAlignment = .center
        commentsAmountLabel.textColor = UIColor.titleColors(color: .white)
        
        shareAmountLabel.text = "122"
        shareAmountLabel.font = UIFont.systemFont(ofSize: 16)
        shareAmountLabel.textAlignment = .center
        shareAmountLabel.textColor = UIColor.titleColors(color: .white)
        
        prizeAmountLabel.text = "82"
        prizeAmountLabel.font = UIFont.systemFont(ofSize: 16)
        prizeAmountLabel.textAlignment = .center
        prizeAmountLabel.textColor = UIColor.titleColors(color: .white)
        
        
        authorNameLabel.text = "无名氏"
        authorNameLabel.font = UIFont.boldSystemFont(ofSize: 20)
        authorNameLabel.textAlignment = .left
        authorNameLabel.textColor = UIColor.titleColors(color: .white)
        
        titleOfContentLabel.text = "我的标题"
        titleOfContentLabel.font = UIFont.systemFont(ofSize: 14)
        titleOfContentLabel.textAlignment = .left
        titleOfContentLabel.numberOfLines = 2
        titleOfContentLabel.textColor = UIColor.titleColors(color: .white)
        
        followIconOnUserIcon.addTarget(self, action: #selector(followBtnClicked), for: .touchUpInside)
        likeBtn.addTarget(self, action: #selector(likeBtnClicked), for: .touchUpInside)
        commentsBtn.addTarget(self, action: #selector(commentsBtnClicked), for: .touchUpInside)
        shareBtn.addTarget(self, action: #selector(shareBtnClicked), for: .touchUpInside)
        prizeBtn.addTarget(self, action: #selector(prizeBtnClicked), for: .touchUpInside)
        
        //随机头像
        let avatarIndex = Int(arc4random()%5+1)
        let Avatarimage = UIImage(named: avatars.value(forKey: String(avatarIndex))as! String)
        
        let avatar = createIcon(avatar:Avatarimage!, imageSize: 50, locale: userIcon.frame, iconShape: .AvatarShapeTypeRound,with: true)
        
        scrollView.addSubview(contentBackImage)
        scrollView.addSubview(transparentBackView)
        scrollView.addSubview(avatar)
        scrollView.addSubview(followIconOnUserIcon)
        scrollView.addSubview(followedIconOnUserIcon)
        scrollView.addSubview(likeBtn)
        scrollView.addSubview(likeAmountLabel)
        scrollView.addSubview(commentsBtn)
        scrollView.addSubview(commentsAmountLabel)
        scrollView.addSubview(shareBtn)
        scrollView.addSubview(shareAmountLabel)
        scrollView.addSubview(prizeBtn)
        scrollView.addSubview(prizeAmountLabel)
        
        //双击监听
        let tapDouble=UITapGestureRecognizer(target:self,
                                             action:#selector(tapDoubleDid(_:)))
        tapDouble.numberOfTapsRequired = 2
        tapDouble.numberOfTouchesRequired = 1
        //声明点击事件需要双击事件检测失败后才会执行
        //tapSingle.require(toFail: tapDouble)
        contentBackImage.addGestureRecognizer(tapDouble)
        transparentBackView.addSubview(authorNameLabel)
        transparentBackView.addSubview(titleOfContentLabel)
        
       // petsVC.addChildViewController(<#T##childController: UIViewController##UIViewController#>)
    }
   
    @objc func likeBtnClicked(){
        print("Like Btn CLiked")
        if self._likeStatus{
            self.likeBtn.setImage(UIImage(named: "unlikeicon"), for: .normal)
            self._likeStatus = false
        }else{
             self.likeBtn.setImage(UIImage(named: "likeicon"), for: .normal)
            self._likeStatus = true
            self.likeAnimation(likeBtn: self.likeBtn, likeStatus: _likeStatus)
            //self.likeAnimationInScreen(position:CGPoint(x: self.likeBtn.frame.minX - 30, y:self.likeBtn.frame.minY),likeStatus: false)
        }
        
    }
    @objc func followBtnClicked(){
        //SwiftNotice.showText("关注成功", autoClear: true, autoClearTime: 2)
        greyLayerPrompt.show(text: "关注成功")
        self.followAnimation(followBtn: followIconOnUserIcon,checkedBtn: followedIconOnUserIcon, followStatus: true)
    }
    
    @objc func commentsBtnClicked(){
        print("Comments Btn CLiked")
    }
    
    @objc func shareBtnClicked(){
        print("share Btn CLiked")
    }
    
    @objc func prizeBtnClicked(){
        print("Prize Btn CLiked")
    }
    
    //双击事件响应
    @objc func tapDoubleDid(_ ges:UITapGestureRecognizer){
       // self.backgroundColor = UIColor.white
        let touchedPoint:CGPoint = ges.location(in: self) // (touches.first?.location(in: self))!
        if self._likeStatus{
            self.likeBtn.setImage(UIImage(named: "unlikeicon"), for: .normal)
            self._likeStatus = false
            self.likeAnimationInScreen(position:touchedPoint,likeStatus: _likeStatus)
        }else{
            self.likeBtn.setImage(UIImage(named: "likeicon"), for: .normal)
            self._likeStatus = true
            self.likeAnimationInScreen(position:touchedPoint,likeStatus: _likeStatus)
            self.likeAnimation(likeBtn: self.likeBtn, likeStatus: _likeStatus)
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch: AnyObject in touches {
            let t:UITouch = touch as! UITouch
            //当在屏幕上连续拍动两下时，背景恢复为白色
            if(t.tapCount == 2)
            {
                self.backgroundColor = UIColor.white
                let touchedPoint:CGPoint = (touches.first?.location(in: self))!
                if self._likeStatus{
//                    self.likeBtn.setImage(UIImage(named: "unlikeicon"), for: .normal)
//                    self._likeStatus = false
                    self.likeAnimationInScreen(position:touchedPoint,likeStatus: false)
                }else{
                    self.likeBtn.setImage(UIImage(named: "likeicon"), for: .normal)
                    self._likeStatus = true
                    self.likeAnimationInScreen(position:touchedPoint,likeStatus: true)
                }
            }
                //当在屏幕上单击时，屏幕变为红色
            else if(t.tapCount == 1)
            {
                self.backgroundColor = UIColor.red
            }
            print("event begin!")
        }
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    //重置单元格内元素尺寸
    func resetSize(){

    }
    

}

//ImagePreviewCell的UIScrollViewDelegate代理实现
extension ShowContentCollectionCell:UIScrollViewDelegate{
    
    //缩放视图
    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        return self.contentBackImage
    }
    
}
