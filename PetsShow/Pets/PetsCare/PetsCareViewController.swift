//
//  PetsCareViewController.swift
//  PetsShow
//
//  Created by Kevin on 2018/5/28.
//  Copyright © 2018 Kevin. All rights reserved.
//

import UIKit

class PetsCareViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
   //添加宠物
    let addPetsBtn:UIButton = UIButton.init(type: .custom)
    
    //宠物页面Banner
    let bannerView1:UIImageView = UIImageView.init()
    //宠物信息页面
    let titleForPetsArea:UILabel = UILabel.init()
    lazy var PetsListTable:UITableView = {
        let tempTableView:UITableView = UITableView.init()
        tempTableView.delegate = self
        tempTableView.dataSource = self
        return tempTableView
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        steupUI()
        // Do any additional setup after loading the view.
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = PetsListTableViewCell.customCell(tableView: PetsListTable)
        cell.selectionStyle = .none
        
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 336
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func steupUI(){
        self.view.backgroundColor = UIColor.backgroundColors(color: .lightestgray)
        let bgOfTab:UIView = UIView.init(frame: CGRect(x: 0, y: kHight - 146 - heightChangeForiPhoneXFromBottom, width: kWidth, height: 64 + heightChangeForiPhoneXFromBottom)) //
        bgOfTab.backgroundColor = UIColor.backgroundColors(color: .mainColor)
        
        bannerView1.frame = CGRect(x: 0, y: 5, width: kWidth, height: 257)
        bannerView1.image = UIImage(named: "banner1")
        
        let petsListAreaNameLabel:UILabel = UILabel.init(frame: CGRect(x: 20, y: 270, width: 200, height: 22))
        petsListAreaNameLabel.text = "我的宠物"
        petsListAreaNameLabel.textColor = UIColor.titleColors(color: .gray)
        petsListAreaNameLabel.textAlignment = .left
        petsListAreaNameLabel.font = UIFont.systemFont(ofSize: 14)
        
        let plusImg:UIImageView = UIImageView.init(frame: CGRect(x: kWidth - 100, y: 273, width: 13, height: 13))
        plusImg.image = UIImage(named: "plusimg")
        
        addPetsBtn.frame = CGRect(x: kWidth - 80, y: 270, width: 60, height: 22)
        addPetsBtn.setTitle("添加宠物", for: .normal)
        addPetsBtn.titleLabel?.font = UIFont.systemFont(ofSize: 14)
        addPetsBtn.setTitleColor(UIColor.backgroundColors(color: .black), for: .normal)
        
        PetsListTable.frame = CGRect(x: 0 , y: 297 , width: kWidth, height: kHight - 477)
        
        self.view.addSubview(bgOfTab)
        self.view.addSubview(petsListAreaNameLabel)
        self.view.addSubview(bannerView1)
        self.view.addSubview(PetsListTable)
        self.view.addSubview(plusImg)
        self.view.addSubview(addPetsBtn)
        
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
