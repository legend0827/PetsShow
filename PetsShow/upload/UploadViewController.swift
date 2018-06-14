//
//  UploadViewController.swift
//  PetsShow
//
//  Created by Kevin on 2018/5/19.
//  Copyright © 2018 Kevin. All rights reserved.
//

import UIKit

class UploadViewController: UIViewController {
    
    //显示还是隐藏
    var isPresenting:Bool = true

    //定义毛玻璃灰层
    lazy var grayLayer:UIView = {
        //y= 64表示要显示上方的切换按钮
        var tempView = UIView.init(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height))
        tempView.backgroundColor = UIColor.gray
        tempView.alpha = 0.2
        return tempView
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        setStatusBarBackgroundColor(color: .backgroundColors(color: .black))
        self.view.backgroundColor = UIColor.clear
        self.view.addSubview(blurEffectView(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height:UIScreen.main.bounds.height ))) //UIColor(red: 0.5, green: 0.5, blue: 0.5, alpha: 0.5)
        self.view.addSubview(self.grayLayer)
        
        
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        if isPresenting{
            let popUpVC = PopupViewController()
            popUpVC.modalPresentationCapturesStatusBarAppearance = true
            popUpVC.modalPresentationStyle = UIModalPresentationStyle.overCurrentContext //
            
            let uploadView = UploadActionView(frame: CGRect(x: 0, y: 26+heightChangeForiPhoneXFromTop, width: kWidth, height: kHight + 106))
            uploadView.titleOfView.text = "上传作品"
            uploadView.popupVC = popUpVC
            uploadView.uploadVC = self
            popUpVC.view.addSubview(uploadView)
            self.present(popUpVC, animated: true, completion: nil)

        }
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
