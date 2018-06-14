//
//  mainFoodTableViewCell.swift
//  PetsShow
//
//  Created by Kevin on 2018/6/2.
//  Copyright © 2018 Kevin. All rights reserved.
//

import UIKit

class foodlistTableViewCell: UITableViewCell {
    //排行榜的背景标签
    let rankingBGView:UIImageView = UIImageView.init()
    //排行榜名次
    let rankingValue:UILabel = UILabel.init()
    //产品图片
    let productImage:UIImageView = UIImageView.init()
    //产品标题
    let productTitle:UILabel = UILabel.init()
    //促销标题
    let promoTitle:UILabel = UILabel.init()
    //价格
    let productPrice:UILabel = UILabel.init()
    //销售指数
    let sellPara:UILabel = UILabel.init()
    //自营标签
    let officialSellLabl:UILabel = UILabel.init()
    //购买按钮
    let buyProductBtn:UIButton = UIButton.init(type: .custom)
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        rankingValue.text = "1"
        rankingBGView.image = UIImage(named: "rankinglabelimg")
        productTitle.text = "产品标题"
        promoTitle.text = "产品的促销标题"
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    //MARK: - public
    public class func customCell(tableView: UITableView) -> foodlistTableViewCell{
        let reuseIdentifier = "foodlistTableViewCell"
        var cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier)
        if cell == nil {
            cell = foodlistTableViewCell(style: .default, reuseIdentifier: reuseIdentifier)
        }
        return cell as! foodlistTableViewCell
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    override func layoutSubviews() {
        rankingBGView.frame = CGRect(x: 0, y: 0, width: 20, height: 20)
        
        rankingValue.frame = CGRect(x: 7, y: 3, width: 10, height: 12)
        rankingValue.font = UIFont.systemFont(ofSize: 10)
        rankingValue.textColor = UIColor.titleColors(color: .white)
        
        let seperateView:UIView = UIView.init(frame: CGRect(x: 0, y: self.frame.height - 1, width: kWidth, height: 0.5))
        seperateView.backgroundColor = UIColor.lineColors(color: .lightGray)
        
        //产品图片
        productImage.frame = CGRect(x: 20, y: 10, width: 100, height: 100)
        productImage.clipsToBounds = true
        
        //产品标题
        productTitle.frame = CGRect(x: 130, y: 10, width: kWidth - 150, height: 42)
        productTitle.numberOfLines = 2
        productTitle.font = UIFont.boldSystemFont(ofSize: 16)
        productTitle.textColor = UIColor.backgroundColors(color: .black)
        
        //促销标题
        promoTitle.frame = CGRect(x: 130, y: 50, width: kWidth - 150, height: 22)
        promoTitle.font = UIFont.systemFont(ofSize: 14)
        promoTitle.textColor = UIColor.backgroundColors(color: .red)
        
        //价格
        productPrice.frame = CGRect(x: 130, y: 90, width: kWidth - 150, height: 22)
        productPrice.font = UIFont.boldSystemFont(ofSize: 16)
        productPrice.textColor = UIColor.backgroundColors(color: .black)
        
        //销售指数
        sellPara.frame = CGRect(x: 130, y: 117, width: 85, height: 22)
        sellPara.font = UIFont.systemFont(ofSize: 14)
        sellPara.textColor = UIColor.backgroundColors(color: .white)
        sellPara.textAlignment = .center
        sellPara.backgroundColor = UIColor.backgroundColors(color: .red)
        //自营
        officialSellLabl.frame = CGRect(x: 220, y: 117, width: 40, height: 22)
        officialSellLabl.font = UIFont.systemFont(ofSize: 14)
        officialSellLabl.textAlignment = .center
        officialSellLabl.textColor = UIColor.backgroundColors(color: .red)
        officialSellLabl.backgroundColor = UIColor.backgroundColors(color: .white)
        officialSellLabl.layer.borderColor = UIColor.backgroundColors(color: .red).cgColor
        officialSellLabl.layer.borderWidth = 1
        
        //购买按钮
        let buyProductBtn:UIButton = UIButton.init(type: .custom)
        buyProductBtn.frame = CGRect(x: kWidth - 60, y: 117, width: 37, height: 40)
        buyProductBtn.setImage(UIImage(named: "buyimg"), for: .normal)
        
        self.contentView.addSubview(rankingBGView)
        self.contentView.addSubview(seperateView)
        self.contentView.addSubview(productImage)
        self.contentView.addSubview(productTitle)
        self.contentView.addSubview(promoTitle)
        self.contentView.addSubview(productPrice)
        self.contentView.addSubview(buyProductBtn)
        self.contentView.addSubview(officialSellLabl)
        self.contentView.addSubview(sellPara)
        rankingBGView.addSubview(rankingValue)
        
        
    }

}
