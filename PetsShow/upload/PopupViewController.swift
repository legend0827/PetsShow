//
//  PopupViewController.swift
//  PetsShow
//
//  Created by Kevin on 2018/6/5.
//  Copyright © 2018 Kevin. All rights reserved.
//

import UIKit

class PopupViewController: UIViewController {
    let darkView:UIView = UIView.init(frame: CGRect(x: 0, y: 0, width: kWidth, height: kHight))

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.colorWithRgba(4, g: 4, b: 15, a: 40)//UIColor.clear
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func shareView(){
        //self.view.backgroundColor = UIColor.clear
       // darkView.backgroundColor = UIColor.colorWithRgba(4, g: 4, b: 15, a: 40)
       // self.view.addSubview(darkView)
        
        let tapOne = UITapGestureRecognizer(target: self, action: #selector(tabOneClicked))
        //通过numberOfTouchesRequired属性设置触摸点数，比如设置2表示必须两个手指触摸时才会触发
        tapOne.numberOfTapsRequired = 1
        //通过numberOfTapsRequired属性设置点击次数，单击设置为1，双击设置为2
        tapOne.numberOfTouchesRequired = 1
//        //双击
//        let tapTwo = UITapGestureRecognizer(target: self, action: #selector(ViewController.tapTwo))
//        tapTwo.numberOfTapsRequired = 2
//        tapTwo.numberOfTouchesRequired = 1
//        //声明点击事件需要双击事件检测失败后才会执行
//        tapOne.requireGestureRecognizerToFail(tapTwo)
        self.view.addGestureRecognizer(tapOne)
       // let guesture:UITapGestureRecognizer =
    }
    
    @objc func tabOneClicked(){
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
