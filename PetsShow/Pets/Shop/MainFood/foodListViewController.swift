//
//  foodListViewController.swift
//  PetsShow
//
//  Created by Kevin on 2018/6/2.
//  Copyright © 2018 Kevin. All rights reserved.
//

import UIKit

class foodListViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
   
    
    //产品列表类型
    var _listType:productListType = .mainFood
    
    //推荐按钮
    let recommendBtn:UIButton = UIButton.init(type: .custom)
    //排行榜
    let rankingBtn:UIButton = UIButton.init(type: .custom)
    //更新时间Label
    let nextUpdateTime:UILabel = UILabel.init()
    
    lazy var productListTable:UITableView = {
        let tempTableView = UITableView.init(frame: CGRect(x:0 , y: 52 + 22, width: kWidth, height: kHight - 51 - 160))
        tempTableView.delegate = self
        tempTableView.dataSource = self
        tempTableView.separatorStyle = .none
        return tempTableView
    }()
    
    //排序规则：
    var isOrderByRecommend:Bool = false // false表示排行榜
    
    init(listType:productListType) {
        super.init(nibName: nil, bundle: nil)
        _listType = listType
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = foodlistTableViewCell.customCell(tableView: productListTable)
        cell.selectionStyle = .none
        if indexPath.row >= 4{
            cell.rankingBGView.image = UIImage(named: "rankinglabelimg-gray")
        }else{
            cell.rankingBGView.image = UIImage(named: "rankinglabelimg")
        }
        cell.productImage.image = UIImage(named: "food\(indexPath.row + 1)")
        cell.productTitle.text = proTitle.value(forKey: "\(indexPath.row + 1)") as? String
        cell.promoTitle.text = "满199元减100"
        let randomPrice = arc4random()%200 + 1
        cell.productPrice.text = "¥\(randomPrice).00"
        cell.sellPara.text = "销售指数100"
        cell.officialSellLabl.text = "自营"
        cell.rankingValue.text = "\(indexPath.row)"
        return cell
    }
    
    func setupUI(){
        self.view.backgroundColor = UIColor.backgroundColors(color: .lightestgray)
        let orderBG:UIView = UIView.init(frame: CGRect(x: 0, y: 0, width: kWidth, height: 42))
        orderBG.backgroundColor = UIColor.backgroundColors(color: .mainColor)
        
        recommendBtn.frame = CGRect(x: 20, y: 10, width: 60, height: 22)
        recommendBtn.setTitle("推荐", for: .normal)
        recommendBtn.setTitleColor(UIColor.backgroundColors(color: .white), for: .normal)
        recommendBtn.titleLabel?.font = UIFont.systemFont(ofSize: 16)
        recommendBtn.addTarget(self, action: #selector(rankingChanged), for: .touchUpInside)
        
        rankingBtn.frame = CGRect(x: 80, y: 10, width: 60, height: 22)
        rankingBtn.setTitle("排行榜", for: .normal)
        rankingBtn.setTitleColor(UIColor.backgroundColors(color: .black), for: .normal)
        rankingBtn.titleLabel?.font = UIFont.systemFont(ofSize: 16)
        rankingBtn.addTarget(self, action: #selector(rankingChanged), for: .touchUpInside)
        
        nextUpdateTime.frame = CGRect(x: 0, y: 48, width: kWidth, height: 22)
        nextUpdateTime.text = "距离下次更新8分钟"
        nextUpdateTime.textAlignment = .center
        nextUpdateTime.textColor = UIColor.titleColors(color: .gray)
        nextUpdateTime.font = UIFont.systemFont(ofSize: 16)
        
        self.view.addSubview(orderBG)
        orderBG.addSubview(recommendBtn)
        orderBG.addSubview(rankingBtn)
        self.view.addSubview(nextUpdateTime)
        self.view.addSubview(productListTable)
    }
    
    @objc func rankingChanged(){
        if isOrderByRecommend{
            
            recommendBtn.setTitleColor(UIColor.backgroundColors(color: .white), for: .normal)
            rankingBtn.setTitleColor(UIColor.backgroundColors(color: .black), for: .normal)
        }else{
            recommendBtn.setTitleColor(UIColor.backgroundColors(color: .black), for: .normal)
            rankingBtn.setTitleColor(UIColor.backgroundColors(color: .white), for: .normal)
        }
        isOrderByRecommend = !isOrderByRecommend
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
