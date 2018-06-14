//
//  msgListTableViewCell.swift
//  PetsShow
//
//  Created by Kevin on 2018/6/5.
//  Copyright © 2018 Kevin. All rights reserved.
//

import UIKit

class msgListTableViewCell: UITableViewCell {
 
    //姓名
    let SenderTitle:UILabel = UILabel.init()
    //发送时间
    let sentTimeValue:UILabel = UILabel.init()
    //最后一条消息
    let lastMSGcontent:UILabel = UILabel.init()
    //VIP标志
    let vipSign:UIImageView = UIImageView.init()
    //VIP级别
    let vipLevel:UILabel = UILabel.init()
    //官方标签
    let officialMsgLabel:UILabel = UILabel.init()

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        SenderTitle.text = "PetsShow助手"
        sentTimeValue.text = "2018-06-10"
        officialMsgLabel.isHidden = true
        lastMSGcontent.text = "您有一条新的消息"
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    //MARK: - public
    public class func customCell(tableView: UITableView) -> msgListTableViewCell{
        let reuseIdentifier = "msgListTableViewCell"
        var cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier)
        if cell == nil {
            cell = msgListTableViewCell(style: .default, reuseIdentifier: reuseIdentifier)
        }
        return cell as! msgListTableViewCell
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    override func layoutSubviews() {
        
        
        SenderTitle.frame = CGRect(x: 50, y: 5, width: 200, height: 22)
        SenderTitle.font = UIFont.boldSystemFont(ofSize: 16)
        SenderTitle.textColor = UIColor.titleColors(color: .white)
        
        let seperateView:UIView = UIView.init(frame: CGRect(x: 0, y: self.frame.height - 1, width: kWidth, height: 0.5))
        seperateView.backgroundColor = UIColor.lineColors(color: .lightGray)
        
        //发送时间标志
        sentTimeValue.frame = CGRect(x: kWidth - 100, y: 5, width: 80, height: 13)
        sentTimeValue.font = UIFont.boldSystemFont(ofSize: 9)
        sentTimeValue.textColor = UIColor.backgroundColors(color: .white)
        sentTimeValue.textAlignment = .right
        
        //最后一条消息
        lastMSGcontent.frame = CGRect(x: 110, y: 29, width: kWidth - 150, height: 22)
        lastMSGcontent.font = UIFont.systemFont(ofSize: 14)
        lastMSGcontent.textColor = UIColor.backgroundColors(color: .white)
        
        //VIP
        vipSign.frame = CGRect(x: 55, y: 32, width: 13, height: 13)
        vipSign.image = UIImage(named: "vipiconimg")
        vipLevel.frame = CGRect(x: 70, y: 30, width: 50, height: 17)
        vipLevel.textColor = UIColor.colorWithRgba(254, g: 236, b: 173, a: 1.0)
        vipLevel.text = "VIP5"
        vipLevel.font = UIFont.boldSystemFont(ofSize: 14)
        
        
        //官方
        officialMsgLabel.frame = CGRect(x: 28, y: 29, width: 22, height: 13)
        officialMsgLabel.text = "官方"
        officialMsgLabel.font = UIFont.systemFont(ofSize: 9)
        officialMsgLabel.textAlignment = .center
        officialMsgLabel.textColor = UIColor.backgroundColors(color: .white)
        officialMsgLabel.backgroundColor = UIColor.colorWithRgba(255, g: 211, b: 0, a: 1.0)
        officialMsgLabel.layer.borderColor = UIColor.colorWithRgba(255, g: 211, b: 0, a: 1.0).cgColor
        officialMsgLabel.layer.borderWidth = 1

        self.contentView.addSubview(seperateView)
        self.contentView.addSubview(sentTimeValue)
        self.contentView.addSubview(lastMSGcontent)
        self.contentView.addSubview(vipSign)
        self.contentView.addSubview(officialMsgLabel)
        self.contentView.addSubview(vipLevel)
        self.contentView.addSubview(SenderTitle)
        
        
    }

}
