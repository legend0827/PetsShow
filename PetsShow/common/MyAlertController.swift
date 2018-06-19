//
//  MyAlertController.swift
//  PetsShow
//
//  Created by Kevin on 2018/6/18.
//  Copyright © 2018 Kevin. All rights reserved.
//

import UIKit

class MyAlertController: UIAlertController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func addAction(_ action: UIAlertAction) {
        super.addAction(action)
        //通过tintColor实现按钮颜色的修改。
        self.view.tintColor = UIColor.backgroundColors(color: .mainColor)
        //也可以通过设置 action.setValue 来实现
        //action.setValue(UIColor.orange, forKey:"titleTextColor")
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
