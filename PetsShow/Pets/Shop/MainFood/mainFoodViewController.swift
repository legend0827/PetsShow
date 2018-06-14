//
//  mainFoodViewController.swift
//  PetsShow
//
//  Created by Kevin on 2018/6/2.
//  Copyright © 2018 Kevin. All rights reserved.
//

import UIKit
import PagingMenuController

private struct PagingMenuOptions:PagingMenuControllerCustomizable{
    
    //宠物主食
    private let mainFoodListVC = foodListViewController(listType: productListType.mainFood)
    //猫粮
    private let catFoodListVC = foodListViewController(listType: productListType.catsFood)
    //狗粮
    private let dogFoodListVC = foodListViewController(listType: productListType.dogsFood)
    //猫罐头/湿粮
    private let catWeatFoodListVC = foodListViewController(listType: productListType.catsWeatFood)
    //狗罐头/湿粮
    private let dogWeatFoodListVC = foodListViewController(listType: productListType.dosWeatFood)
 
    
    //论坛
    ///暂时不加
    //
    
    var backgroundColor: UIColor = UIColor.backgroundColors(color: .white)// UIColor.colorWithRgba(19, g: 18, b: 43, a: 1.0)//UIColor.backgroundColors(color: .black) // 设置菜单栏底色
    
    //组件类型
    fileprivate var componentType: ComponentType{
        return .all(menuOptions: MenuOptions(), pagingControllers: pagingControllers)
    }
    
    //所有子视图控制器
    fileprivate var pagingControllers: [UIViewController] {
        return [mainFoodListVC,dogFoodListVC,catFoodListVC,dogWeatFoodListVC,catWeatFoodListVC]
    }
    
    //菜单配置项
    fileprivate struct MenuOptions: MenuViewCustomizable {
        var backgroundColor: UIColor = UIColor.backgroundColors(color: .white)
        var selectedBackgroundColor: UIColor = UIColor.backgroundColors(color: .white)
        //菜单显示模式
        var displayMode: MenuDisplayMode {
            return .standard(widthMode: .fixed(width: kWidth/8), centerItem: false, scrollingMode: MenuScrollingMode.scrollEnabled)
            //  return .segmentedControl
        }
        var menuItemMode: MenuItemWidthMode{
            return .flexible
            //return .fixed(width: kWidth/4)
        }
        //菜单项
        var itemsOptions: [MenuItemViewCustomizable] {
            return [MenuItem1(), MenuItem2(), MenuItem3(), MenuItem4(), MenuItem5()]
        }
        //设置选中栏下方条的颜色
        var focusMode:MenuFocusMode {
            return .underline(height: 2, color: UIColor.backgroundColors(color: .mainColor), horizontalPadding: 12, verticalPadding: 5) // 水平间距 0 ，垂直间距 0
        }
        
    }
    
    //第1个菜单项
    fileprivate struct MenuItem1: MenuItemViewCustomizable {
        //自定义菜单项名称
        var displayMode: MenuItemDisplayMode {
            //return .text(title: MenuItemText(text: "全部"))
            return .text(title: MenuItemText(text: "宠物主粮", color: UIColor.backgroundColors(color: .black), selectedColor: UIColor.backgroundColors(color: .mainColor), font: UIFont.systemFont(ofSize: 16), selectedFont: UIFont.boldSystemFont(ofSize: 16)))
        }
    }
    
    //第2个菜单项
    fileprivate struct MenuItem2: MenuItemViewCustomizable {
        //自定义菜单项名称
        var displayMode: MenuItemDisplayMode {
            return .text(title: MenuItemText(text: "狗粮", color: UIColor.backgroundColors(color: .black), selectedColor: UIColor.backgroundColors(color: .mainColor), font: UIFont.systemFont(ofSize: 16), selectedFont: UIFont.boldSystemFont(ofSize: 16)))
        }
    }
    
    //第3个菜单项
    fileprivate struct MenuItem3: MenuItemViewCustomizable {
        //自定义菜单项名称
        var displayMode: MenuItemDisplayMode {
            return .text(title: MenuItemText(text: "猫粮", color: UIColor.backgroundColors(color: .black), selectedColor: UIColor.backgroundColors(color: .mainColor), font: UIFont.systemFont(ofSize: 16), selectedFont: UIFont.boldSystemFont(ofSize: 16)))
        }
    }
    //第4个菜单项
    fileprivate struct MenuItem4: MenuItemViewCustomizable {
        //自定义菜单项名称
        var displayMode: MenuItemDisplayMode {
            return .text(title: MenuItemText(text: "狗罐头/湿", color: UIColor.backgroundColors(color: .black), selectedColor: UIColor.backgroundColors(color: .mainColor), font: UIFont.systemFont(ofSize: 16), selectedFont: UIFont.boldSystemFont(ofSize: 16)))
        }
    }
    //第5个菜单项
    fileprivate struct MenuItem5: MenuItemViewCustomizable {
        //自定义菜单项名称
        var displayMode: MenuItemDisplayMode {
            return .text(title: MenuItemText(text: "猫罐头/湿", color: UIColor.backgroundColors(color: .black), selectedColor: UIColor.backgroundColors(color: .mainColor), font: UIFont.systemFont(ofSize: 16), selectedFont: UIFont.boldSystemFont(ofSize: 16)))
        }
    }
}

class mainFoodViewController: UIViewController {
 
    override func viewDidLoad() {
        super.viewDidLoad()
       // self.view.backgroundColor = UIColor.backgroundColors(color: .black)// UIColor.backgroundColors(color: .)
        //先隐藏系统提供的导航栏
        self.navigationController?.isNavigationBarHidden = true
        
        //自定义导航栏 navigationBar
        let navBar = UINavigationBar(frame: CGRect(x:0, y:20 + heightChangeForiPhoneXFromTop, width:kWidth, height:44))
        // 导航栏背景颜色
        navBar.backgroundColor = UIColor.backgroundColors(color: .mainColor)
        navBar.barTintColor = UIColor.backgroundColors(color: .mainColor)
        navBar.isTranslucent = false //关闭模糊效果
        //这里是导航栏透明
        //navBar.shadowImage = UIImage()
        //navBar.setBackgroundImage(UIImage(), for: UIBarMetrics.default)
        
        // 自定义导航栏的title，用UILabel实现
        let titleLabel = UILabel(frame: CGRect(x:0,y:0,width:50,height:60))
        titleLabel.text = "宠物主粮"
        titleLabel.textColor = UIColor.titleColors(color: .white)
        // 这里使用系统自定义的字体
        titleLabel.font = UIFont.systemFont(ofSize: 18)
        
        // 创建导航栏组件
        let navItem = UINavigationItem()
        // 设置自定义的title
        navItem.titleView = titleLabel
        
        //        // 创建左侧按钮
        let backImg=UIImage(named: "left-arrow-white")
        let leftBarItem=UIBarButtonItem(image: backImg, style: UIBarButtonItemStyle.plain, target: self, action: #selector(cancelBtnClicked))
        leftBarItem.tintColor = UIColor.backgroundColors(color: .white)
        
        
        navItem.setLeftBarButton(leftBarItem, animated: false)
        
        navigationItem.setHidesBackButton(true, animated: false)
        // 把导航栏组件加入导航栏
        navBar.pushItem(navItem, animated: false)
        
        // 导航栏添加到view上
        self.view.addSubview(navBar)
        
        /// 菜单栏配置
        
        //分页菜单配置
        let options = PagingMenuOptions()
        //分页菜单控制器初始化
        let pagingMenuController = PagingMenuController(options: options)
        //分页菜单控制器尺寸设置
        pagingMenuController.view.frame.origin.y += 20 //28 //(4 + heightChangeForiPhoneXFromTop)*3
        pagingMenuController.view.frame.size.height -= 5
        
        if UIDevice.current.isX(){
            heightChangeForiPhoneXFromTop = 24.0
            pagingMenuController.view.frame.origin.y += 64//56
        }else{
            heightChangeForiPhoneXFromTop = 0.0
            pagingMenuController.view.frame.origin.y += 40//32//5
        }
        //建立父子关系
        addChildViewController(pagingMenuController)
        //分页菜单控制器视图添加到当前视图中
        self.view.addSubview(pagingMenuController.view)
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
