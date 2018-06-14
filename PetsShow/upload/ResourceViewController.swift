//
//  VideoViewController.swift
//  PetsShow
//
//  Created by Kevin on 2018/6/5.
//  Copyright © 2018 Kevin. All rights reserved.
//

import UIKit

class ResourceViewController: UIViewController {

    var _listType:resourceListType = .Video
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    init(listType:resourceListType) {
        super.init(nibName: nil, bundle: nil)
        _listType = listType
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
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
