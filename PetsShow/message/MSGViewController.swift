//
//  MSGViewController.swift
//  PetsShow
//
//  Created by Kevin on 2018/5/19.
//  Copyright © 2018 Kevin. All rights reserved.
//

import UIKit

class MSGViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {

    //头像
    let avatarsImageView:UIImageView = UIImageView.init()
    var Avatar:UIView = UIView.init()
    
    let fansBtn:UIButton = UIButton.init(type: .custom)
    let likesBtn:UIButton = UIButton.init(type: .custom)
    let atMeBtn:UIButton = UIButton.init(type: .custom)
    let commentsBtn:UIButton = UIButton.init(type: .custom)

    lazy var messagesListTableView:UITableView = {
        let tempTableView = UITableView.init(frame: CGRect(x: 0, y: 160 + heightChangeForiPhoneXFromTop, width: kWidth, height: kHight - 220 - heightChangeForiPhoneXFromTop), style: .grouped)
        tempTableView.delegate = self
        tempTableView.dataSource = self
        tempTableView.separatorStyle = .none
        tempTableView.isScrollEnabled = true
        tempTableView.rowHeight = UITableViewAutomaticDimension
        tempTableView.estimatedRowHeight = 52
        tempTableView.tableHeaderView = UITableViewHeaderFooterView.init(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: CGFloat.leastNormalMagnitude))
        tempTableView.backgroundColor = UIColor.backgroundColors(color: .lightestgray)
        
        return tempTableView
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor.backgroundColors(color: .lightestgray)
        setupUI()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = msgListTableViewCell.customCell(tableView: messagesListTableView)
        cell.backgroundColor = UIColor.backgroundColors(color: .mainColor)
        cell.selectionStyle = .none
        if indexPath.row == 0{
            avatarsImageView.frame = CGRect(x: 12, y: 11, width: 29, height: 29)
            avatarsImageView.image = UIImage(named: "petsAssisImg")
            cell.contentView.addSubview(avatarsImageView)
            cell.officialMsgLabel.isHidden = false
        }else{
            switch indexPath.row{
            case 1:
                cell.SenderTitle.text = "笔墨先生"
            case 2:
                cell.SenderTitle.text = "银魂"
            default:
                cell.SenderTitle.text = "小魔法师"
            }
            
            cell.officialMsgLabel.isHidden = true
            //随机取头像
            let avatarIndex = Int(arc4random()%10+1)
            let image = UIImage(named:avatars.value(forKey: String(avatarIndex)) as! String)
            
            Avatar = createIcon(avatar:image!, imageSize: 29, locale: CGRect(x: 12, y: 11, width: 29, height: 29), iconShape: .AvatarShapeTypeRound, with: true)
            cell.contentView.addSubview(Avatar)
        }
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 51
    }
    func setupUI(){
        setStatusBarBackgroundColor(color: UIColor.backgroundColors(color: .mainColor))
       
        self.automaticallyAdjustsScrollViewInsets = false
        
        let msgHeaderBg:UIView = UIView.init(frame: CGRect(x: 0, y: 0, width: kWidth, height: 130 + heightChangeForiPhoneXFromTop))
        msgHeaderBg.backgroundColor = UIColor.backgroundColors(color: .mainColor)
        self.view.addSubview(msgHeaderBg)
        
        let titleOfPage:UILabel = UILabel.init(frame: CGRect(x: 0, y: 20 + heightChangeForiPhoneXFromTop, width: kWidth, height: 22))
        titleOfPage.textAlignment = .center
        titleOfPage.textColor = UIColor.titleColors(color: .white)
        titleOfPage.text = "消息"
        titleOfPage.font = UIFont.boldSystemFont(ofSize: 16)
        self.view.addSubview(titleOfPage)
        
        fansBtn.frame = CGRect(x: (kWidth/8 - 33/2), y: 55 + heightChangeForiPhoneXFromTop, width: 33, height: 33)
        likesBtn.frame = CGRect(x: (kWidth/8*3 - 33/2), y: 55 + heightChangeForiPhoneXFromTop, width: 33, height: 33)
        atMeBtn.frame = CGRect(x: (kWidth/8*5 - 33/2), y: 55 + heightChangeForiPhoneXFromTop, width: 33, height: 33)
        commentsBtn.frame = CGRect(x: (kWidth/8*7 - 33/2), y: 55 + heightChangeForiPhoneXFromTop, width: 33, height: 33)
        
        fansBtn.setImage(UIImage(named: "fansimg"), for: .normal)
        fansBtn.layer.borderColor = UIColor.white.cgColor
        fansBtn.layer.borderWidth = 1
        
        likesBtn.setImage(UIImage(named: "likesimg"), for: .normal)
        likesBtn.layer.borderColor = UIColor.white.cgColor
        likesBtn.layer.borderWidth = 1
        
        commentsBtn.setImage(UIImage(named: "commentsimg"), for: .normal)
        commentsBtn.layer.borderColor = UIColor.white.cgColor
        commentsBtn.layer.borderWidth = 1
        
        atMeBtn.setTitle("@", for: .normal)
        atMeBtn.setTitleColor(UIColor.white, for: .normal)
        atMeBtn.setTitleColor(UIColor.colorWithRgba(245, g: 245, b: 245, a: 0.4), for: .highlighted)
        atMeBtn.layer.borderColor = UIColor.white.cgColor
        atMeBtn.layer.borderWidth = 1
        atMeBtn.titleLabel?.font = UIFont.boldSystemFont(ofSize: 30)
        
        let fansLabel:UILabel = UILabel.init()
        let likesLabel:UILabel = UILabel.init()
        let atMeLabel:UILabel = UILabel.init()
        let commnetsLabel:UILabel = UILabel.init()
        
        
        fansLabel.text = "粉丝"
        fansLabel.font = UIFont.systemFont(ofSize: 16)
        fansLabel.textColor = UIColor.titleColors(color: .white)
        fansLabel.textAlignment = .center
        
        likesLabel.text = "点赞"
        likesLabel.font = UIFont.systemFont(ofSize: 16)
        likesLabel.textColor = UIColor.titleColors(color: .white)
        likesLabel.textAlignment = .center
        
        atMeLabel.text = "@我的"
        atMeLabel.font = UIFont.systemFont(ofSize: 16)
        atMeLabel.textColor = UIColor.titleColors(color: .white)
        atMeLabel.textAlignment = .center
        
        commnetsLabel.text = "评论"
        commnetsLabel.font = UIFont.systemFont(ofSize: 16)
        commnetsLabel.textColor = UIColor.titleColors(color: .white)
        commnetsLabel.textAlignment = .center
        
        fansLabel.frame = CGRect(x: (kWidth/8 - 33/2), y: 94 + heightChangeForiPhoneXFromTop, width: 33, height: 33)
        likesLabel.frame = CGRect(x: (kWidth/8*3 - 33/2), y: 94 + heightChangeForiPhoneXFromTop, width: 33, height: 33)
        atMeLabel.frame = CGRect(x: (kWidth/8*5 - 31.5 ), y: 94 + heightChangeForiPhoneXFromTop, width: 63, height: 33)
        commnetsLabel.frame = CGRect(x: (kWidth/8*7 - 33/2), y: 94 + heightChangeForiPhoneXFromTop, width: 33, height: 33)
        
        self.view.addSubview(fansBtn)
        self.view.addSubview(likesBtn)
        self.view.addSubview(atMeBtn)
        self.view.addSubview(commentsBtn)
        self.view.addSubview(fansLabel)
        self.view.addSubview(likesLabel)
        self.view.addSubview(atMeLabel)
        self.view.addSubview(commnetsLabel)
        
        self.view.addSubview(messagesListTableView)
        
        let bgOfTab:UIView = UIView.init(frame: CGRect(x: 0, y: kHight - 52 - heightChangeForiPhoneXFromBottom, width: kWidth, height: 64 + heightChangeForiPhoneXFromBottom)) //
        bgOfTab.backgroundColor = UIColor.backgroundColors(color: .mainColor)
        self.view.addSubview(bgOfTab)
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
