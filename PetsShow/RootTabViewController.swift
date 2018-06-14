//
//  RootTabViewController.swift
//  PetsShow
//
//  Created by Kevin on 2018/5/19.
//  Copyright © 2018 Kevin. All rights reserved.
//

import UIKit

class RootTabViewController: UITabBarController {
    
    let petsShowVC = PetsShowViewController()
    let petsVC = PetsViewController()
    let uploadVC = UploadViewController()
    let msgVC = MSGViewController()
    var meVC = MeViewController()
    
    //初始化
    init() {
        super.init(nibName: nil, bundle: nil)

        
        petsShowVC.tabBarItem.image = UIImage(named: "petsshowiconintabbar-dis")
        petsVC.tabBarItem.image = UIImage(named: "petsiconintabbar-dis")
        uploadVC.tabBarItem.image = UIImage(named: "uploadiconintabbar")
        msgVC.tabBarItem.image = UIImage(named: "msgiconintabbar-dis")
        meVC.tabBarItem.image = UIImage(named: "meiconintabbar-dis")
        
        petsShowVC.tabBarItem.selectedImage = UIImage(named: "petsshowiconintabbar")
        petsVC.tabBarItem.selectedImage = UIImage(named: "petsiconintabbar")
        uploadVC.tabBarItem.selectedImage = UIImage(named: "uploadiconintabbar")
        msgVC.tabBarItem.selectedImage = UIImage(named: "msgiconintabbar")
        meVC.tabBarItem.selectedImage = UIImage(named: "meiconintabbar")
        
        self.viewControllers = [petsShowVC,petsVC,uploadVC,msgVC,meVC]
      //  self.tabBar.tintColor = UIColor.backgroundColors(color: .white)
        
        self.tabBar.backgroundColor = UIColor.clear
        self.tabBar.isOpaque = true

        self.tabBar.backgroundColor = UIColor.clear
        self.tabBar.backgroundImage = UIImage()
        self.tabBar.shadowImage = UIImage()
//        //右滑监听
//        let swipeLeft = UIPanGestureRecognizer(target: self, action: #selector(swiptedLeft(_:)))
//        petsShowVC.view.addGestureRecognizer(swipeLeft)
//        
//        view.addSubview(petsShowVC.view)
//        
//        //建立父子关系
//        addChildViewController(petsShowVC)
//        petsShowVC.didMove(toParentViewController: self)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @objc func swiptedLeft(_ swipe:UIPanGestureRecognizer){
        switch swipe.state {
        case .began:
            //判断拖动方向
            let dragFromRightToLeft = (swipe.velocity(in: view).x > 0)
            //如果刚刚开始滑动的时候还处于主页面。从右向左加入侧面菜单
            if (dragFromRightToLeft){
                addUserInfoView()
            }
        case .changed:
            let positionX = (swipe.view?.frame.origin.x)! + swipe.translation(in: view).x
            //页面滑倒最左侧的话，就不允许继续往左滑动
            swipe.view!.frame.origin.x = positionX < 0 ? 0 : positionX
            swipe.setTranslation(.zero, in: view)
        case .ended:
            //根据页面滑动是否过半，判断后面是自动展开还是收缩
            let hasMovedhanHalfway = swipe.view!.center.x > view.bounds.size.width
            animateMainView(shouldExpand: hasMovedhanHalfway)
        default:
            break
        }
        
        //        let meVC = MeViewController()
        //        petsVC.present(meVC, animated: true, completion: nil)
    }
    
    //添加用户信息页面
    func addUserInfoView(){
       // if (meVC == nil) {
            meVC = MeViewController()
            
            // 插入当前视图并置顶
            view.insertSubview(meVC.view, at: 0)
            
            // 建立父子关系
            addChildViewController(meVC)
            meVC.didMove(toParentViewController: self)
       // }
    }
    
    //主页自动展开、收起动画
    func animateMainView(shouldExpand: Bool) {
        // 如果是用来展开
        if (shouldExpand) {
            // 更新当前状态
            // currentState = .Expanded
            // 动画
            animateMainViewXPosition(targetPosition: petsVC.view.frame.width )
        }
            // 如果是用于隐藏
        else {
            // 动画
            animateMainViewXPosition(targetPosition: 0) { finished in
                // 动画结束之后s更新状态
                // self.currentState = .Collapsed
                // 移除左侧视图
                 self.meVC.view.removeFromSuperview()
                // 释放内存
                // meVC = nil
               // self.meVC = nil
            }
        }
    }
    
    //主页移动动画（在x轴移动）
    func animateMainViewXPosition(targetPosition: CGFloat,
                                  completion: ((Bool) -> Void)! = nil) {
        //usingSpringWithDamping：1.0表示没有弹簧震动动画
        UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 1.0,
                       initialSpringVelocity: 0, options: .curveEaseInOut, animations: {
                        self.petsVC.view.frame.origin.x = targetPosition
        }, completion: completion)
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

// 外部接口
extension RootTabViewController {
    
    // 判断当前是否在主界面（主界面指：消息、联系人、动态这三个）
    func isUserInMainView() -> Bool {
        var userIsInMain = false
        
        switch selectedIndex {
        case 0:
            userIsInMain = true// petsShowVC.navigationController?.visibleViewController is RootTabViewController//is SBTabMainBaseViewController
        case 1:
            userIsInMain = false//petsVC.navigationController?.visibleViewController is RootTabViewController
        case 2:
            userIsInMain = false// uploadVC.navigationController?.visibleViewController is RootTabViewController
        case 3:
            userIsInMain = false//msgVC.navigationController?.visibleViewController is RootTabViewController
        case 4:
            userIsInMain = false//meVC.navigationController?.visibleViewController is RootTabViewController
        default:
            userIsInMain = false// petsShowVC.navigationController?.visibleViewController is RootTabViewController
            //nav = self?.rootController.dynamicViewController.navigationController
        }
        
//        switch selectedIndex {
//        case 0:
//            userIsInMain = messageViewController.navigationController?.visibleViewController is SBTabMainBaseViewController
//        case 1:
//            userIsInMain = contactsViewController.navigationController?.visibleViewController is SBTabMainBaseViewController
//        default:
//            userIsInMain = dynamicViewController.navigationController?.visibleViewController is SBTabMainBaseViewController
//        }
        return userIsInMain
    }
}
