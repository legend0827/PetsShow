//
//  ContentViewController.swift
//  PetsShow
//
//  Created by Kevin on 2018/5/27.
//  Copyright © 2018 Kevin. All rights reserved.
//

import UIKit
import PagingMenuController

private struct PagingMenuOptions:PagingMenuControllerCustomizable{
    
    //作品
    private let workVC = WorksViewController(workType: .works)
    
    //喜欢
    private let likesVC = WorksViewController(workType: .likes)
    
    var backgroundColor: UIColor = UIColor.backgroundColors(color: .black) // 设置菜单栏底色
    
    //组件类型
    fileprivate var componentType: ComponentType{
        return .all(menuOptions: MenuOptions(), pagingControllers: pagingControllers)
    }

    //所有子视图控制器
    fileprivate var pagingControllers: [UIViewController] {
        return [workVC,likesVC]
    }
    
    //菜单配置项
    fileprivate struct MenuOptions: MenuViewCustomizable {
        //菜单显示模式
        var displayMode: MenuDisplayMode {
            return .segmentedControl
        }
        //菜单项
        var itemsOptions: [MenuItemViewCustomizable] {
            return [MenuItem1(), MenuItem2()]
        }
        //设置选中栏下方条的颜色
        var focusMode:MenuFocusMode {
            return .underline(height: 2, color: UIColor.orange, horizontalPadding: 12, verticalPadding: 5) // 水平间距 0 ，垂直间距 0
        }
        
    }
    
    //第1个菜单项
    fileprivate struct MenuItem1: MenuItemViewCustomizable {
        //自定义菜单项名称
        var displayMode: MenuItemDisplayMode {
            //return .text(title: MenuItemText(text: "全部"))
            return .text(title: MenuItemText(text: "作品", color: UIColor.titleColors(color: .black), selectedColor: UIColor.titleColors(color: .red), font: UIFont.systemFont(ofSize: 16), selectedFont: UIFont.systemFont(ofSize: 16)))
        }
    }
    
    //第2个菜单项
    fileprivate struct MenuItem2: MenuItemViewCustomizable {
        //自定义菜单项名称
        var displayMode: MenuItemDisplayMode {
            return .text(title: MenuItemText(text: "喜欢", color: UIColor.titleColors(color: .black), selectedColor: UIColor.titleColors(color: .red), font: UIFont.systemFont(ofSize: 16), selectedFont: UIFont.systemFont(ofSize: 16)))
        }
    }
    
}
class ContentViewController: UIView {
    var meVC = MeViewController()
    override init(frame:CGRect) {
        super.init(frame: frame)
        /// 菜单栏配置
        
        //分页菜单配置
        let options = PagingMenuOptions()
        //分页菜单控制器初始化
        let pagingMenuController = PagingMenuController(options: options)
        //分页菜单控制器尺寸设置
        pagingMenuController.view.frame.origin.y += 28 //(4 + heightChangeForiPhoneXFromTop)*3
        pagingMenuController.view.frame.size.height -= 5
        
        if UIDevice.current.isX(){
            heightChangeForiPhoneXFromTop = 24.0
            pagingMenuController.view.frame.origin.y += 56
        }else{
            heightChangeForiPhoneXFromTop = 0.0
            pagingMenuController.view.frame.origin.y += 32//5
        }
        //建立父子关系
        meVC.addChildViewController(pagingMenuController)
        //分页菜单控制器视图添加到当前视图中
        self.addSubview(pagingMenuController.view)
        // Do any additional setup after loading the view.
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
