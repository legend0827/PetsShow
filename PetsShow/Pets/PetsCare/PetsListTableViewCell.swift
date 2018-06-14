//
//  PetsListTableViewCell.swift
//  PetsShow
//
//  Created by Kevin on 2018/5/28.
//  Copyright © 2018 Kevin. All rights reserved.
//

import UIKit

class PetsListTableViewCell: UITableViewCell {
    //宠物头像
    let petsPic:UIImageView = UIImageView.init()
    //宠物名字
    let petsNameLabel:UILabel  = UILabel.init()
    let petsNameValue:UILabel  = UILabel.init()
    //宠物档案编号：
    let petsArchivedFileCodeLabel:UILabel  = UILabel.init()
    let petsArchivedFileCodeValue:UILabel  = UILabel.init()
    //宠物品种
    let petCatagoryLabel:UILabel  = UILabel.init()
    let petCatagoryValue:UILabel  = UILabel.init()
    //宠物年龄
    let petAgeLabel:UILabel  = UILabel.init()
    let petAgeValue:UILabel  = UILabel.init()
    //宠物二维码
    let petQRCode:UIImageView  = UIImageView.init()
    
    
    //宠物Care标题线
    let petsCareSeperateLine:UIView = UIView.init()
    let petsCareSeperateLineLabel:UILabel = UILabel.init()
    //上次接种时间
    let petcaredLastTimeLabel:UILabel = UILabel.init()
    let petcaredLastTimeValue:UILabel = UILabel.init()
    //下次接种时间
    let petcaredNextTimeLabel:UILabel = UILabel.init()
    let petcaredNextTimeValue:UILabel = UILabel.init()
    //预约button
    let reserviationBtn:UIButton = UIButton.init(type: .custom)
    //保障状态
    let petcaseStatusLabel:UILabel = UILabel.init()
    let petcaseStatusValue:UILabel = UILabel.init()
    //到期时间
    let petcaseDeadlineLabel:UILabel = UILabel.init()
    let petcaseDeadlineValue:UILabel = UILabel.init()
    //延长按钮
    let prelongCareBtn:UIButton = UIButton.init(type: .custom)
    //可用额度
    let petbudgetLimitLabel:UILabel = UILabel.init()
    let petbudgetLimitValue:UILabel = UILabel.init()
    //提升额度
    let raiseLimitBtn:UIButton = UIButton.init(type: .custom)
    
    
    
    //血统认证标题线
    let petsblodyRelationSeperateLine:UIView = UIView.init()
    let petsblodyRelationSeperateLineLabel:UILabel = UILabel.init()
    //血统认证
    let petsblodyRelationProofLabel:UILabel = UILabel.init()
    let petsblodyRelationProofValue:UILabel = UILabel.init()
    //父亲
    let petsFatherLabel:UILabel = UILabel.init()
    let petsFatherValue:UILabel = UILabel.init()
    //母亲
    let petsMotherLabel:UILabel = UILabel.init()
    let petsMotherValue:UILabel = UILabel.init()
    //官方认证标志
    let officialProofSign:UIImageView = UIImageView.init()
    //更多资料按钮
    let morePetsDetailBtn:UIButton = UIButton.init(type: .custom)
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        //宠物头像
         contentView.addSubview(petsPic)
        //宠物名字
        
        
        contentView.addSubview(petsNameLabel)
        contentView.addSubview(petsNameValue)
        //宠物档案编号：
        
        
        contentView.addSubview(petsArchivedFileCodeLabel)
        contentView.addSubview(petsArchivedFileCodeValue)
        //宠物品种
        
        
        contentView.addSubview(petCatagoryLabel)
        contentView.addSubview(petCatagoryValue)
        //宠物年龄
        
        
        contentView.addSubview(petAgeLabel)
        contentView.addSubview(petAgeValue)
        
        //宠物二维码
        
        contentView.addSubview(petQRCode)
        
        //宠物Care标题线
        
        
        contentView.addSubview(petsCareSeperateLine)
        contentView.addSubview(petsCareSeperateLineLabel)
        //上次接种时间
        
        
        contentView.addSubview(petcaredLastTimeLabel)
        contentView.addSubview(petcaredLastTimeValue)
        //下次接种时间
        
        
        contentView.addSubview(petcaredNextTimeLabel)
        contentView.addSubview(petcaredNextTimeValue)
        //预约button
        
        contentView.addSubview(reserviationBtn)
        //保障状态
        
        
        contentView.addSubview(petcaseStatusLabel)
        contentView.addSubview(petcaseStatusValue)
        //到期时间
        
        
        contentView.addSubview(petcaseDeadlineLabel)
        contentView.addSubview(petcaseDeadlineValue)
        //延长按钮
        
        contentView.addSubview(prelongCareBtn)
        //可用额度
        
        
        contentView.addSubview(petbudgetLimitLabel)
        contentView.addSubview(petbudgetLimitValue)
        //提升额度
        
        contentView.addSubview(raiseLimitBtn)
        
        
        //血统认证标题线
        
        
        contentView.addSubview(petsblodyRelationSeperateLine)
        contentView.addSubview(petsblodyRelationSeperateLineLabel)
        //血统认证
        
        
        contentView.addSubview(petsblodyRelationProofLabel)
        contentView.addSubview(petsblodyRelationProofValue)
        //父亲
        
        
        contentView.addSubview(petsFatherLabel)
        contentView.addSubview(petsFatherValue)
        //母亲
        
        
        contentView.addSubview(petsMotherLabel)
        contentView.addSubview(petsMotherValue)
        //官方认证标志
        
        contentView.addSubview(officialProofSign)
        //更多资料按钮
        
        contentView.addSubview(morePetsDetailBtn)
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    public func calculateLengthOfWords(withLabel:UILabel) -> Int{
        let textLength = withLabel.intrinsicContentSize.width
        return Int(textLength)
    }
    //MARK: - public
    public class func customCell(tableView: UITableView) -> PetsListTableViewCell{
        let reuseIdentifier = "petsListTableViewCell"
        var cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier)
        if cell == nil {
            cell = PetsListTableViewCell(style: .default, reuseIdentifier: reuseIdentifier)
        }
        return cell as! PetsListTableViewCell
    }
    
//    public func settingCellData(title : String, companyID:Int) {
//        titleLabel.text = title
//        companyIDLabel.text = "(\(companyID))"
//    }
    
    // MARK:- private
    
    override func layoutSubviews() {
        super.layoutSubviews()
        //宠物头像
        petsPic.frame = CGRect(x: 20, y: 14, width: 93, height: 93)
        petsPic.image = UIImage(named: "labuladuo")
        
        //宠物名字
        petsNameLabel.frame = CGRect(x: 132, y: 10, width: 160, height: 22)
        petsNameLabel.font = UIFont.systemFont(ofSize: 12)
        petsNameLabel.text = "宠物名字:"
        petsNameLabel.textColor = UIColor.titleColors(color: .gray)
        
        petsNameValue.frame = CGRect(x: 192, y: 10, width: 200, height: 22)
        petsNameValue.font = UIFont.systemFont(ofSize: 12)
        petsNameValue.text = "蓝图"
        petsNameValue.textColor = UIColor.titleColors(color: .black)
        //宠物档案编号：
        petsArchivedFileCodeLabel.frame = CGRect(x: 132, y: 37, width: 160, height: 22)
        petsArchivedFileCodeLabel.font = UIFont.systemFont(ofSize: 12)
        petsArchivedFileCodeLabel.text = "宠物档案编号:"
        petsArchivedFileCodeLabel.textColor = UIColor.titleColors(color: .gray)
        
        petsArchivedFileCodeValue.frame = CGRect(x: 212, y: 37, width: 200, height: 22)
        petsArchivedFileCodeValue.font = UIFont.systemFont(ofSize: 12)
        petsArchivedFileCodeValue.text = "200199100212"
        petsArchivedFileCodeValue.textColor = UIColor.titleColors(color: .black)
        //宠物品种
        petCatagoryLabel.frame = CGRect(x: 132, y: 64, width: 160, height: 22)
        petCatagoryLabel.font = UIFont.systemFont(ofSize: 12)
        petCatagoryLabel.text = "宠物品种:"
        petCatagoryLabel.textColor = UIColor.titleColors(color: .gray)
        
        petCatagoryValue.frame = CGRect(x: 192, y: 64, width: 160, height: 22)
        petCatagoryValue.font = UIFont.systemFont(ofSize: 12)
        petCatagoryValue.text = "拉布拉多"
        petCatagoryValue.textColor = UIColor.titleColors(color: .black)
        //宠物年龄
        petAgeLabel.frame = CGRect(x: 132, y: 91, width: 160, height: 22)
        petAgeLabel.font = UIFont.systemFont(ofSize: 12)
        petAgeLabel.text = "宠物年龄:"
        petAgeLabel.textColor = UIColor.titleColors(color: .gray)
        
        petAgeValue.frame = CGRect(x: 192, y: 91, width: 160, height: 22)
        petAgeValue.font = UIFont.systemFont(ofSize: 12)
        petAgeValue.text = "3.2岁"
        petAgeValue.textColor = UIColor.titleColors(color: .black)
        //宠物二维码
        petQRCode .frame = CGRect(x: 25, y: 15, width: 160, height: 22)
        
        //宠物Care标题线
        petsCareSeperateLine.frame = CGRect(x: 20, y: petAgeValue.frame.maxY + 18, width: kWidth - 40, height: 1)
        petsCareSeperateLine.backgroundColor = UIColor.lineColors(color: .darkGray)
        
        petsCareSeperateLineLabel.frame = CGRect(x: (kWidth - 104)/2 + 20, y: petAgeValue.frame.maxY + 9, width: 64, height: 16)
        petsCareSeperateLineLabel.text = "宠物Care"
        petsCareSeperateLineLabel.textAlignment = .center
        petsCareSeperateLineLabel.font = UIFont.systemFont(ofSize: 12)
        petsCareSeperateLineLabel.textColor = UIColor.titleColors(color: .gray)
        petsCareSeperateLineLabel.backgroundColor = UIColor.backgroundColors(color: .white)
        
        //上次接种时间
        petcaredLastTimeLabel.frame = CGRect(x: 20, y: petsCareSeperateLine.frame.maxY + 10, width: 160, height: 22)
        petcaredLastTimeLabel.font = UIFont.systemFont(ofSize: 12)
        petcaredLastTimeLabel.text = "上次接种时间:"
        petcaredLastTimeLabel.textColor = UIColor.titleColors(color: .gray)
        
        petcaredLastTimeValue.frame = CGRect(x: 100, y: petsCareSeperateLine.frame.maxY + 10, width: 160, height: 22)
        petcaredLastTimeValue.font = UIFont.systemFont(ofSize: 12)
        petcaredLastTimeValue.text = "2017/06/21"
        petcaredLastTimeValue.textColor = UIColor.titleColors(color: .black)
        //下次接种时间
        petcaredNextTimeLabel.frame = CGRect(x: kWidth/2, y: petsCareSeperateLine.frame.maxY + 10, width: 160, height: 22)
        petcaredNextTimeLabel.font = UIFont.systemFont(ofSize: 12)
        petcaredNextTimeLabel.text = "下次接种时间:"
        petcaredNextTimeLabel.textColor = UIColor.titleColors(color: .gray)
        
        petcaredNextTimeValue.frame = CGRect(x: kWidth/2 + 80, y: petsCareSeperateLine.frame.maxY + 10, width: 160, height: 22)
        petcaredNextTimeValue.font = UIFont.systemFont(ofSize: 12)
        petcaredNextTimeValue.text = "2017/09/21"
        petcaredNextTimeValue.textColor = UIColor.titleColors(color: .black)
        //预约button
        reserviationBtn.frame = CGRect(x: kWidth - 50, y: petsCareSeperateLine.frame.maxY + 10, width: 40, height: 22)
        reserviationBtn.setTitle("预约", for: .normal)
        reserviationBtn.titleLabel?.font = UIFont.systemFont(ofSize: 12)
        reserviationBtn.setTitleColor(UIColor.blue, for: .normal)
        
        //保障状态
        petcaseStatusLabel.frame = CGRect(x: 20, y: reserviationBtn.frame.maxY + 5, width: 160, height: 22)
        petcaseStatusLabel.font = UIFont.systemFont(ofSize: 12)
        petcaseStatusLabel.text = "保障状态:"
        petcaseStatusLabel.textColor = UIColor.titleColors(color: .gray)
        
        petcaseStatusValue.frame = CGRect(x: 80, y: reserviationBtn.frame.maxY + 5, width: 160, height: 22)
        petcaseStatusValue.font = UIFont.systemFont(ofSize: 12)
        petcaseStatusValue.text = "保障中"
        petcaseStatusValue.textColor = UIColor.titleColors(color: .black)
        //到期时间
        petcaseDeadlineLabel.frame = CGRect(x: 20, y: petcaseStatusValue.frame.maxY + 5, width: 160, height: 22)
        petcaseDeadlineLabel.font = UIFont.systemFont(ofSize: 12)
        petcaseDeadlineLabel.text = "到期时间:"
        petcaseDeadlineLabel.textColor = UIColor.titleColors(color: .gray)
        
        petcaseDeadlineValue.frame = CGRect(x: 80, y: petcaseStatusValue.frame.maxY + 5, width: 160, height: 22)
        petcaseDeadlineValue.font = UIFont.systemFont(ofSize: 12)
        petcaseDeadlineValue.text = "2017/08/19"
        petcaseDeadlineValue.textColor = UIColor.titleColors(color: .black)
        //延长按钮
        prelongCareBtn.frame = CGRect(x: 200, y: petcaseStatusValue.frame.maxY + 5, width: 40, height: 22)
        reserviationBtn.setTitle("延保", for: .normal)
        reserviationBtn.titleLabel?.font = UIFont.systemFont(ofSize: 12)
        reserviationBtn.setTitleColor(UIColor.blue, for: .normal)
        
        //可用额度
        petbudgetLimitLabel.frame = CGRect(x: kWidth/2, y: reserviationBtn.frame.maxY + 5, width: 160, height: 22)
        petbudgetLimitLabel.font = UIFont.systemFont(ofSize: 12)
        petbudgetLimitLabel.text = "可用额度:"
        petbudgetLimitLabel.textColor = UIColor.titleColors(color: .gray)
        
        petbudgetLimitValue.frame = CGRect(x: kWidth/2 + 80, y: reserviationBtn.frame.maxY + 5, width: 160, height: 22)
        petbudgetLimitValue.font = UIFont.systemFont(ofSize: 12)
        petbudgetLimitValue.text = "¥10,000.00"
        petbudgetLimitValue.textColor = UIColor.titleColors(color: .black)
        //提升额度
        raiseLimitBtn.frame = CGRect(x: kWidth - 50, y: reserviationBtn.frame.maxY + 5, width: 40, height: 22)
        raiseLimitBtn.setTitle("延保", for: .normal)
        raiseLimitBtn.titleLabel?.font = UIFont.systemFont(ofSize: 12)
        raiseLimitBtn.setTitleColor(UIColor.blue, for: .normal)
        
        
        //血统认证标题线
        petsblodyRelationSeperateLine.frame = CGRect(x: 20, y: petcaseDeadlineLabel.frame.maxY + 18, width: kWidth - 40, height: 1)
        petsblodyRelationSeperateLine.backgroundColor = UIColor.lineColors(color: .darkGray)
        
        petsblodyRelationSeperateLineLabel.frame = CGRect(x:  (kWidth - 104)/2 + 20, y: petcaseDeadlineLabel.frame.maxY + 9, width: 64, height: 16)
        petsblodyRelationSeperateLineLabel.text = "血统认证"
        petsblodyRelationSeperateLineLabel.textAlignment = .center
        petsblodyRelationSeperateLineLabel.font = UIFont.systemFont(ofSize: 12)
        petsblodyRelationSeperateLineLabel.textColor = UIColor.titleColors(color: .gray)
        petsblodyRelationSeperateLineLabel.backgroundColor = UIColor.backgroundColors(color: .white)
        
        //血统认证
        petsblodyRelationProofLabel.frame = CGRect(x: 20, y: petsblodyRelationSeperateLine.frame.maxY + 10, width: 160, height: 22)
        petsblodyRelationProofLabel.font = UIFont.systemFont(ofSize: 12)
        petsblodyRelationProofLabel.text = "认证:"
        petsblodyRelationProofLabel.textColor = UIColor.titleColors(color: .gray)
        
        petsblodyRelationProofValue.frame = CGRect(x: 60, y: petsblodyRelationSeperateLine.frame.maxY + 10, width: 160, height: 22)
        petsblodyRelationProofValue.font = UIFont.systemFont(ofSize: 12)
        petsblodyRelationProofValue.text = "纯种拉布拉多犬"
        petsblodyRelationProofValue.textColor = UIColor.titleColors(color: .black)
        //父亲
        petsFatherLabel.frame = CGRect(x: kWidth/2, y: petsblodyRelationSeperateLine.frame.maxY + 10, width: 160, height: 22)
        petsFatherLabel.font = UIFont.systemFont(ofSize: 12)
        petsFatherLabel.text = "父亲:"
        petsFatherLabel.textColor = UIColor.titleColors(color: .gray)
        
        petsFatherValue.frame = CGRect(x: kWidth/2 + 60, y: petsblodyRelationSeperateLine.frame.maxY + 10, width: 160, height: 22)
        petsFatherValue.font = UIFont.systemFont(ofSize: 12)
        petsFatherValue.text = "宏运"
        petsFatherValue.textColor = UIColor.titleColors(color: .black)
        
        //母亲
        petsMotherLabel.frame = CGRect(x: kWidth/2, y: petsFatherValue.frame.maxY + 5, width: 160, height: 22)
        petsMotherLabel.font = UIFont.systemFont(ofSize: 12)
        petsMotherLabel.text = "母亲:"
        petsMotherLabel.textColor = UIColor.titleColors(color: .gray)
        
        petsMotherValue.frame = CGRect(x: kWidth/2 + 60, y: petsFatherValue.frame.maxY + 5, width: 160, height: 22)
        petsMotherValue.font = UIFont.systemFont(ofSize: 12)
        petsMotherValue.text = "吉星"
        petsMotherValue.textColor = UIColor.titleColors(color: .black)
        //官方认证标志
        officialProofSign.frame = CGRect(x: 20, y: petsFatherValue.frame.maxY + 5, width: 75, height: 20)
        officialProofSign.image = UIImage(named: "officialproofsignimg")
        //更多资料按钮
        morePetsDetailBtn.frame = CGRect(x: kWidth - 70, y: petsMotherValue.frame.maxY + 10, width: 60, height: 16)
        morePetsDetailBtn.setTitle("查看更多", for: .normal)
        morePetsDetailBtn.titleLabel?.font = UIFont.systemFont(ofSize: 12)
        morePetsDetailBtn.setTitleColor(UIColor.blue, for: .normal)
        
        let arrows:UIImageView = UIImageView.init(frame: CGRect(x: kWidth - 13, y: petsMotherValue.frame.maxY + 12, width: 7, height: 10))
        arrows.image = UIImage(named: "arrowimg")
        
        
        //宠物头像
        self.contentView.addSubview(petsPic)
        //宠物名字
        self.contentView.addSubview(petsNameLabel)
        self.contentView.addSubview(petsNameValue)
        //宠物档案编号：
        self.contentView.addSubview(petsArchivedFileCodeLabel)
        self.contentView.addSubview(petsArchivedFileCodeValue)
        //宠物品种
        self.contentView.addSubview(petCatagoryLabel)
        self.contentView.addSubview(petCatagoryValue)
        //宠物年龄
        self.contentView.addSubview(petAgeLabel)
        self.contentView.addSubview(petAgeValue)
        //宠物二维码
        self.contentView.addSubview(petQRCode)
        //宠物Care标题线
        self.contentView.addSubview(petsCareSeperateLine)
        self.contentView.addSubview(petsCareSeperateLineLabel)
        //上次接种时间
        self.contentView.addSubview(petcaredLastTimeLabel)
        self.contentView.addSubview(petcaredLastTimeValue)
        //下次接种时间
        self.contentView.addSubview(petcaredNextTimeLabel)
        self.contentView.addSubview(petcaredNextTimeValue)
        //预约button
        self.contentView.addSubview(reserviationBtn)
        //保障状态
        self.contentView.addSubview(petcaseStatusLabel)
        self.contentView.addSubview(petcaseStatusValue)
        //到期时间
        self.contentView.addSubview(petcaseDeadlineLabel)
        self.contentView.addSubview(petcaseDeadlineValue)
        //延长按钮
        self.contentView.addSubview(prelongCareBtn)
        //可用额度
        self.contentView.addSubview(petbudgetLimitLabel)
        self.contentView.addSubview(petbudgetLimitValue)
        //提升额度
        self.contentView.addSubview(raiseLimitBtn)
        
        //血统认证标题线
        self.contentView.addSubview(petsblodyRelationSeperateLine)
        self.contentView.addSubview(petsblodyRelationSeperateLineLabel)
        //血统认证
        self.contentView.addSubview(petsblodyRelationProofLabel)
        self.contentView.addSubview(petsblodyRelationProofValue)
        //父亲
        self.contentView.addSubview(petsFatherLabel)
        self.contentView.addSubview(petsFatherValue)
        //母亲
        self.contentView.addSubview(petsMotherLabel)
        self.contentView.addSubview(petsMotherValue)
        //官方认证标志
        self.contentView.addSubview(officialProofSign)
        //更多资料按钮
        self.contentView.addSubview(morePetsDetailBtn)
        self.contentView.addSubview(arrows)
        
    }
}
