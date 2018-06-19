//
//  FollowViewController.swift
//  PetsShow
//
//  Created by Kevin on 2018/5/19.
//  Copyright © 2018 Kevin. All rights reserved.
//

import UIKit
import PagingMenuController

private struct PagingMenuOptions:PagingMenuControllerCustomizable{
    
    //宠物页面
    private let PetsCareVC = PetsCareViewController()
    
    //商店
    private let shopVC = ShopViewController()
    
    
    //论坛
    private let socialVC = SocialViewController()
    //
    
    var backgroundColor: UIColor = UIColor.backgroundColors(color: .white)// UIColor.colorWithRgba(19, g: 18, b: 43, a: 1.0)//UIColor.backgroundColors(color: .black) // 设置菜单栏底色
    
    //组件类型
    fileprivate var componentType: ComponentType{
        return .all(menuOptions: MenuOptions(), pagingControllers: pagingControllers)
    }
    
    //所有子视图控制器
    fileprivate var pagingControllers: [UIViewController] {
        return [PetsCareVC,shopVC,socialVC]
    }
    
    //菜单配置项
    fileprivate struct MenuOptions: MenuViewCustomizable {
        var backgroundColor: UIColor = UIColor.backgroundColors(color: .white)
        var selectedBackgroundColor: UIColor = UIColor.backgroundColors(color: .white)
        //水平间距
        var horizontalMargin: CGFloat = 10.0
        //菜单显示模式
        var displayMode: MenuDisplayMode {
            return .standard(widthMode: .flexible, centerItem: false, scrollingMode: MenuScrollingMode.scrollEnabled) //.fixed(width: kWidth/16)
            //  return .segmentedControl
        }
        var menuItemMode: MenuItemWidthMode{
            return .flexible//.fixed(width: kWidth/18)
        }
        //菜单项
        var itemsOptions: [MenuItemViewCustomizable] {
            return [MenuItem1(), MenuItem2(),MenuItem3()]
        }
        //设置选中栏下方条的颜色
        var focusMode:MenuFocusMode {
            return .none//.underline(height: 2, color: UIColor.clear, horizontalPadding: 2, verticalPadding: 5) // 水平间距 0 ，垂直间距 0
        }
        
    }
    
    //第1个菜单项
    fileprivate struct MenuItem1: MenuItemViewCustomizable {
        //自定义菜单项名称
        var displayMode: MenuItemDisplayMode {
            //return .text(title: MenuItemText(text: "全部"))
            return .text(title: MenuItemText(text: "我的宠物", color: UIColor.backgroundColors(color: .black), selectedColor: UIColor.backgroundColors(color: .mainColor), font: UIFont.systemFont(ofSize: 16), selectedFont: UIFont.boldSystemFont(ofSize: 16)))
        }
    }
    
    //第2个菜单项
    fileprivate struct MenuItem2: MenuItemViewCustomizable {
        //自定义菜单项名称
        var displayMode: MenuItemDisplayMode {
            return .text(title: MenuItemText(text: "商城", color: UIColor.backgroundColors(color: .black), selectedColor: UIColor.backgroundColors(color: .mainColor), font: UIFont.systemFont(ofSize: 16), selectedFont: UIFont.boldSystemFont(ofSize: 16)))
        }
    }
    
    //第2个菜单项
    fileprivate struct MenuItem3: MenuItemViewCustomizable {
        //自定义菜单项名称
        var displayMode: MenuItemDisplayMode {
            return .text(title: MenuItemText(text: "论坛", color: UIColor.backgroundColors(color: .black), selectedColor: UIColor.backgroundColors(color: .mainColor), font: UIFont.systemFont(ofSize: 16), selectedFont: UIFont.boldSystemFont(ofSize: 16)))
        }
    }
}

class PetsViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func setupUI(){
        let BGViewWithShandow:UIImageView = UIImageView.init(frame: CGRect(x: 0, y: 0, width: kWidth, height: 90+heightChangeForiPhoneXFromTop))
        BGViewWithShandow.image = UIImage(named: "hearderwithshandowimg")
        self.view.addSubview(BGViewWithShandow)
        /// 菜单栏配置
        
        //分页菜单配置
        let options = PagingMenuOptions()
        //分页菜单控制器初始化
        let pagingMenuController = PagingMenuController(options: options)
        //分页菜单控制器尺寸设置
        pagingMenuController.view.frame.origin.y += 0 //28 //(4 + heightChangeForiPhoneXFromTop)*3
        pagingMenuController.view.frame.size.height -= 5
        
        if UIDevice.current.isX(){
            heightChangeForiPhoneXFromTop = 24.0
            pagingMenuController.view.frame.origin.y += 24//56
        }else{
            heightChangeForiPhoneXFromTop = 0.0
            pagingMenuController.view.frame.origin.y += 0//32//5
        }
        //建立父子关系
        addChildViewController(pagingMenuController)
        //分页菜单控制器视图添加到当前视图中
        self.view.addSubview(pagingMenuController.view)
    }
    override func viewWillAppear(_ animated: Bool) {
        setStatusBarHiden(toHidden: true, ViewController: self)
        setStatusBarBackgroundColor(color: UIColor.backgroundColors(color: .clear))
        
//        //
//        UIApplication.shared.isStatusBarHidden = true
//        UIView.animate(withDuration: 0.5) { () -> Void in
//            self.setNeedsStatusBarAppearanceUpdate()
//        }
//
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
