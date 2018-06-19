//
//  contentTableViewCell.swift
//  PetsShow
//
//  Created by Kevin on 2018/6/14.
//  Copyright © 2018 Kevin. All rights reserved.
//

import UIKit

class contentTableViewCell: UITableViewCell {
    
    //用户名
    let userName:UILabel = UILabel.init()
    //VIP标志
    let vipSignImg:UIImageView = UIImageView.init()
    //VIP等级
    let vipLevel:UILabel = UILabel.init()
    //发布时间
    let postTime:UILabel = UILabel.init()
    //发布内容
    let contentValue:UILabel = UILabel.init()
    
    //视频图片
    let videoPreviewImage:UIImageView = UIImageView.init()
    //视频图标
    let videoTypeIcon:UIImageView = UIImageView.init()
    //播放时长
    let playTimeLable:UILabel = UILabel.init()
    
    //收藏
    let collectionBtn:UIButton = UIButton.init(type: .custom)
    let collectionCount:UILabel = UILabel.init()
    //赞赏
    let rewardBtn:UIButton = UIButton.init(type: .custom)
    let rewardCount:UILabel = UILabel.init()
   //点赞
    let likeBtn:UIButton = UIButton.init(type: .custom)
    let likeCount:UILabel = UILabel.init()
    //评论
    let commentBtn:UIButton = UIButton.init(type: .custom)
    let commentCount:UILabel = UILabel.init()
    //分享
    let shareBtn:UIButton = UIButton.init(type: .custom)
    let shareCount:UILabel = UILabel.init()
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        //VIP标志
        vipSignImg.frame = CGRect(x: 130, y: 17 , width: 20, height: 18)
        vipLevel.frame = CGRect(x: 155, y: 16 , width: 200, height: 20)
        vipLevel.text = "VIP5"
        
        postTime.text = "2小时以前"
        contentValue.text = "来PetsShow关注我，每天上传有意思的宠物Show视频和照片"
        playTimeLable.text = "04:21"
        //随机用户名
        let authorIndex = Int(arc4random()%5+1)
        userName.text = authors.value(forKey: String(authorIndex))as! String
        
        videoPreviewImage.image = UIImage(named: "video1Img")

        //收藏
        collectionBtn.setImage(UIImage(named: "collectionsicon"), for: .normal)
        //赞赏
        rewardBtn.setImage(UIImage(named: "rewardsicons"), for: .normal)
        
        //点赞
        likeBtn.setImage(UIImage(named: "likeicon"), for: .normal)
        //评论
        commentBtn.setImage(UIImage(named: "commendsicon"), for: .normal)
        //分享
        shareBtn.setImage(UIImage(named: "shareicons"), for: .normal)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    //MARK: - public
    public class func customCell(tableView: UITableView) -> contentTableViewCell{
        let reuseIdentifier = "contentTableViewCell"
        var cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier)
        if cell == nil {
            cell = contentTableViewCell(style: .default, reuseIdentifier: reuseIdentifier)
        }
        return cell as! contentTableViewCell
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    override func layoutSubviews() {
        let cellBottomView:UIView = UIView.init(frame: CGRect(x: 0, y: self.frame.height - 9, width: self.frame.width, height: 9))
        cellBottomView.backgroundColor = UIColor.backgroundColors(color: .lightestgray)
        self.contentView.addSubview(cellBottomView)
        

        //用户名
        userName.frame = CGRect(x: 71, y: 15, width: 200, height: 22)
        userName.font = UIFont.systemFont(ofSize: 16)
        userName.textColor = UIColor.backgroundColors(color: .mainColor)
        
        
        vipSignImg.image = UIImage(named: "vipiconimg")
        vipLevel.textColor = UIColor.colorWithRgba(251, g: 196, b: 0, a: 1.0)
        vipLevel.font = UIFont.boldSystemFont(ofSize: 18)
        
        postTime.frame = CGRect(x: 71, y: 40, width: 200, height: 17)
        postTime.textColor = UIColor.titleColors(color: .lightGray)
        postTime.font = UIFont.systemFont(ofSize: 12)
        
        videoPreviewImage.frame = CGRect(x: 100, y: 71 , width: kWidth - 200, height: kWidth - 200)
        
        contentValue.frame = CGRect(x: 60, y: videoPreviewImage.frame.maxY + 5, width: kWidth - 80, height: 34)
        contentValue.textColor = UIColor.titleColors(color: .black)
        contentValue.font = UIFont.systemFont(ofSize: 14)
        contentValue.numberOfLines = 2
        
        videoTypeIcon.frame = CGRect(x: 5, y: 5, width: 15, height: 10)
        videoTypeIcon.image = UIImage(named: "videoTypeImg")
        
        playTimeLable.frame = CGRect(x: videoPreviewImage.frame.maxX - 210, y: 5, width: 100, height: 17)
        playTimeLable.textColor = UIColor.titleColors(color: .white)
        playTimeLable.textAlignment = .right
        playTimeLable.font = UIFont.systemFont(ofSize: 12)
        
        let gowth = (self.frame.width  - 140)/4
        //收藏
        collectionBtn.frame = CGRect(x: 70, y: self.frame.height - 45 , width: 20, height: 20)
        collectionCount.frame = CGRect(x: 98, y: self.frame.height - 45 , width: 100, height: 20)
        //赞赏
        rewardBtn.frame = CGRect(x: 70 + gowth, y: self.frame.height - 45 , width: 20, height: 20)
        rewardCount.frame = CGRect(x: 98 + gowth, y: self.frame.height - 45 , width: 100, height: 20)
        //点赞
        likeBtn.frame = CGRect(x: 70 + gowth*2, y: self.frame.height - 45 , width: 20, height: 20)
        likeCount.frame = CGRect(x: 98 + gowth*2 , y: self.frame.height - 45 , width: 100, height: 20)
        //评论
        commentBtn.frame = CGRect(x: 70 + gowth*3, y: self.frame.height - 45 , width: 20, height: 20)
        commentCount.frame = CGRect(x: 98 + gowth*3, y: self.frame.height - 45 , width: 100, height: 20)
        //分享
        shareBtn.frame = CGRect(x: 70 + gowth*4, y: self.frame.height - 45 , width: 20, height: 20)
        shareCount.frame = CGRect(x: 98 + gowth*4, y: self.frame.height - 45 , width: 100, height: 20)
        
        collectionCount.text = "2.2K"
        collectionCount.font = UIFont.systemFont(ofSize: 12)
        collectionCount.textColor = UIColor.backgroundColors(color: .black)
        
        rewardCount.text = "341"
        rewardCount.font = UIFont.systemFont(ofSize: 12)
        rewardCount.textColor = UIColor.backgroundColors(color: .black)
        
        likeCount.text = "34.1K"
        likeCount.font = UIFont.systemFont(ofSize: 12)
        likeCount.textColor = UIColor.backgroundColors(color: .black)
        
        commentCount.text = "1.2K"
        commentCount.font = UIFont.systemFont(ofSize: 12)
        commentCount.textColor = UIColor.backgroundColors(color: .black)
        
        shareCount.text = "421"
        shareCount.font = UIFont.systemFont(ofSize: 12)
        shareCount.textColor = UIColor.backgroundColors(color: .black)
        
        self.contentView.addSubview(userName)
        self.contentView.addSubview(vipSignImg)
        self.contentView.addSubview(vipLevel)
        self.contentView.addSubview(videoPreviewImage)
        videoPreviewImage.addSubview(videoTypeIcon)
        videoPreviewImage.addSubview(playTimeLable)
        self.contentView.addSubview(collectionBtn)
        self.contentView.addSubview(rewardBtn)
        self.contentView.addSubview(likeBtn)
        self.contentView.addSubview(commentBtn)
        self.contentView.addSubview(shareBtn)
        //self.contentView.addSubview(collectionCount)
        self.contentView.addSubview(rewardCount)
        self.contentView.addSubview(likeCount)
        self.contentView.addSubview(commentCount)
        self.contentView.addSubview(shareCount)
        self.contentView.addSubview(postTime)
        self.contentView.addSubview(contentValue)
    }

}
