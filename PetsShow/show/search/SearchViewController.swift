//
//  SearchViewController.swift
//  PetsShow
//
//  Created by Kevin on 2018/6/18.
//  Copyright © 2018 Kevin. All rights reserved.
//

import UIKit

class SearchViewController: UIViewController {

    //搜索
    let searchView:UITextField = UITextField.init()
    let searchSign:UIImageView = UIImageView.init()
    //取消按钮
    let cancelBtn:UIButton = UIButton.init(type: .custom)
    //搜索历史
    let lastSearchRecord:UIView = UIView.init()
    let lastSearchICon:UIImageView = UIImageView.init()
    let lastSearchText:UILabel = UILabel.init()
    let deleteRecordsBtn:UIButton = UIButton.init(type: .custom)
    //内容分类
    let contentTypes:UILabel = UILabel.init()
    //文字
    let TextCategory:UIImageView = UIImageView.init()
    let TextCategoryLabel:UILabel = UILabel.init()
    //图片
    let PicCategory:UIImageView = UIImageView.init()
    let PicCategoryLabel:UILabel = UILabel.init()
    //音频
    let AudioCategory:UIImageView = UIImageView.init()
    let AudioCategoryLabel:UILabel = UILabel.init()
    //视频
    let VideoCategory:UIImageView = UIImageView.init()
    let VideoCategoryLabel:UILabel = UILabel.init()
    //精品
    let BestCategory:UIImageView = UIImageView.init()
    let BestCategoryLabel:UILabel = UILabel.init()
    //热门标签
    let hotTags:UILabel = UILabel.init()
    //热门标签库
    let hotTagsArray:[String] = ["#差不多先生","#拉布拉多","#搞怪猫的日常","#疯狂宠物城","#30天健康宠物大挑战","#宠物馆计划"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        steupUI()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func steupUI(){
        self.view.backgroundColor = UIColor.backgroundColors(color: .lightestgray)
        
        searchView.frame = CGRect(x: 15, y: 26 + heightChangeForiPhoneXFromTop, width:kWidth - 70 , height: 27)
        searchView.backgroundColor = UIColor.backgroundColors(color: .white)
        searchView.placeholder = "30天健康宠物大挑战"
        searchView.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 27, height: 27))
        searchView.leftViewMode = UITextFieldViewMode.always
        searchView.returnKeyType = UIReturnKeyType.done
        searchView.layer.cornerRadius = 6
        //索索图标
        searchSign.frame = CGRect(x: 10, y: 7, width: 14, height: 14)
        searchSign.image = UIImage(named:"searchicon")
        searchView.leftView!.addSubview(searchSign)
        
        cancelBtn.frame = CGRect(x: searchView.frame.maxX + 10, y: 29 + heightChangeForiPhoneXFromTop, width: 40, height: 20)
        cancelBtn.setTitle("取消", for: .normal)
        cancelBtn.titleLabel?.font = UIFont.systemFont(ofSize: 16)
        cancelBtn.setTitleColor(UIColor.titleColors(color: .darkGray), for: .normal)
        cancelBtn.addTarget(self, action: #selector(cancelBtnClicked), for: .touchUpInside)
        
        //搜索历史
        lastSearchRecord.frame = CGRect(x: 0, y: searchView.frame.maxY + 10, width: kWidth, height: 41)
        lastSearchRecord.backgroundColor = UIColor.backgroundColors(color: .white)
        
        lastSearchICon.frame = CGRect(x: 15, y: 14, width: 18, height: 15)
        lastSearchICon.image = UIImage(named: "searchhistoryimg")
        
        lastSearchText.frame = CGRect(x: lastSearchICon.frame.maxX + 20, y: 10, width: lastSearchRecord.frame.width, height: 20)
        lastSearchText.textColor = UIColor.titleColors(color: .black)
        lastSearchText.text = "搞怪猫的日常"
        lastSearchText.font = UIFont.systemFont(ofSize: 16)
        
        deleteRecordsBtn.frame = CGRect(x: kWidth - 30, y: 13, width: 15, height: 15)
        deleteRecordsBtn.setImage(UIImage(named: "deletebtnimg"), for: .normal)
        
        //内容分类
        contentTypes.frame = CGRect(x: 15, y: lastSearchRecord.frame.maxY + 10, width: 200, height: 25)
        contentTypes.text = "内容分类"
        contentTypes.textColor = UIColor.titleColors(color: .darkGray)
        contentTypes.font = UIFont.systemFont(ofSize: 18)
        
        let horizental = (kWidth - 86)/4
        //文字
        TextCategory.frame = CGRect(x: 30, y: contentTypes.frame.maxY + 20, width: 38, height: 22)
        TextCategory.image = UIImage(named: "textcategoryimg")
        
        TextCategoryLabel.frame = CGRect(x: 30, y: TextCategory.frame.maxY + 5, width: 38, height: 20)
        TextCategoryLabel.text = "文字"
        TextCategoryLabel.textAlignment = .center
        TextCategoryLabel.textColor = UIColor.titleColors(color: .darkGray)
        TextCategoryLabel.font = UIFont.systemFont(ofSize: 16)
        
        //图片
        PicCategory.frame = CGRect(x: 30 + horizental, y: contentTypes.frame.maxY + 20, width: 30, height: 24)
        PicCategory.image = UIImage(named: "piccategoryimg")
        
        PicCategoryLabel.frame = CGRect(x: 30 + horizental - 4, y: PicCategory.frame.maxY + 5, width: 38, height: 20)
        PicCategoryLabel.text = "图片"
        PicCategoryLabel.textAlignment = .center
        PicCategoryLabel.textColor = UIColor.titleColors(color: .darkGray)
        PicCategoryLabel.font = UIFont.systemFont(ofSize: 16)
        //音频
        AudioCategory.frame = CGRect(x: 30 + horizental*2, y: contentTypes.frame.maxY + 20, width: 27, height: 25)
        AudioCategory.image = UIImage(named: "audiocategoryimg")
        
        AudioCategoryLabel.frame = CGRect(x: 30 + horizental*2 - 6, y: AudioCategory.frame.maxY + 5, width: 38, height: 20)
        AudioCategoryLabel.text = "音频"
        AudioCategoryLabel.textAlignment = .center
        AudioCategoryLabel.textColor = UIColor.titleColors(color: .darkGray)
        AudioCategoryLabel.font = UIFont.systemFont(ofSize: 16)
        //视频
        VideoCategory.frame = CGRect(x: 30 + horizental*3, y: contentTypes.frame.maxY + 20, width: 28, height: 24)
        VideoCategory.image = UIImage(named: "videocategoryimg")
        
        VideoCategoryLabel.frame = CGRect(x: 30 + horizental*3 - 5, y: VideoCategory.frame.maxY + 5, width: 38, height: 20)
        VideoCategoryLabel.text = "视频"
        VideoCategoryLabel.textAlignment = .center
        VideoCategoryLabel.textColor = UIColor.titleColors(color: .darkGray)
        VideoCategoryLabel.font = UIFont.systemFont(ofSize: 16)
        //精品
        BestCategory.frame = CGRect(x: 30 + horizental*4, y: contentTypes.frame.maxY + 20, width: 26, height: 25)
        BestCategory.image = UIImage(named: "bestcategoryimg")
        
        BestCategoryLabel.frame = CGRect(x: 30 + horizental*4 - 6, y: BestCategory.frame.maxY + 5, width: 38, height: 20)
        BestCategoryLabel.text = "精品"
        BestCategoryLabel.textAlignment = .center
        BestCategoryLabel.textColor = UIColor.titleColors(color: .darkGray)
        BestCategoryLabel.font = UIFont.systemFont(ofSize: 16)
        //热门标签
        hotTags.frame = CGRect(x: 15, y: TextCategoryLabel.frame.maxY + 36, width: 200, height: 25)
        hotTags.text = "内容分类"
        hotTags.textColor = UIColor.titleColors(color: .red)
        hotTags.font = UIFont.systemFont(ofSize: 18)
        
        //标签库
        for i in 0..<hotTagsArray.count{
            var tempStringLength:CGFloat = 0.0
            var tempHeight:CGFloat = 25.0
            let item = hotTagsArray[i]
            let size = calculateLabelSizeWithText(with: item, labelWidth: kWidth - 40, textFont: UIFont.systemFont(ofSize: 14))
            let length = size.width + 40
          //  print("string in \(i) length was: \(length)")
            for j in 0..<i{ //遍历之前的标签
                let string = hotTagsArray[j]
                tempStringLength += calculateLabelSizeWithText(with: string, labelWidth: kWidth - 40, textFont: UIFont.systemFont(ofSize: 14)).width
                tempStringLength += 45//CGFloat(Double(item.lengthOfBytes(using: String.Encoding.utf8)) * 1.5)
            }
            //计算什么时候该换行了
            tempHeight = CGFloat(Int((tempStringLength + length) / (kWidth - 40)) * 30)
//print("while \(i) and Height is \(tempHeight), length: \(tempStringLength), \(kWidth - 40)")
            
            var startX:CGFloat = 20.0
            
            if ((tempStringLength).truncatingRemainder(dividingBy: (kWidth - 40))) <= (kWidth - 40) && (((tempStringLength).truncatingRemainder(dividingBy: (kWidth - 40))) + length) >= (kWidth - 40){
                startX = 20.0
            }else{
                startX = CGFloat(20.0 + ((tempStringLength).truncatingRemainder(dividingBy: (kWidth - 40))))
            }
            
            let tabButtons:UIButton = UIButton.init(frame: CGRect(x: startX , y: hotTags.frame.maxY + tempHeight + 10, width: length, height: size.height))
            tabButtons.tag = i
            tabButtons.setTitle(item, for: .normal)
            tabButtons.setTitleColor(UIColor.backgroundColors(color: .mainColor), for: .normal)
            self.view.addSubview(tabButtons)
        }

        //searchSign
       // cancelBtn
        
        self.view.addSubview(searchView)
        self.view.addSubview(cancelBtn)
        self.view.addSubview(lastSearchRecord)
        lastSearchRecord.addSubview(lastSearchICon)
        lastSearchRecord.addSubview(lastSearchText)
        lastSearchRecord.addSubview(deleteRecordsBtn)
        self.view.addSubview(contentTypes)
        self.view.addSubview(TextCategory)
        self.view.addSubview(AudioCategory)
        self.view.addSubview(PicCategory)
        self.view.addSubview(VideoCategory)
        self.view.addSubview(BestCategory)
        self.view.addSubview(TextCategoryLabel)
        self.view.addSubview(AudioCategoryLabel)
        self.view.addSubview(PicCategoryLabel)
        self.view.addSubview(VideoCategoryLabel)
        self.view.addSubview(BestCategoryLabel)
        self.view.addSubview(hotTags)
        
    }
    
    @objc func cancelBtnClicked(){
        self.dismiss(animated: true, completion: nil)
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
