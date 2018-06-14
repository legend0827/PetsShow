//
//  LikeAnimation.swift
//  PetsShow
//
//  Created by Kevin on 2018/5/19.
//  Copyright © 2018 Kevin. All rights reserved.
//

import Foundation
import UIKit

extension UIView{
    public func followAnimation(followBtn:UIButton,checkedBtn:UIButton,followStatus:Bool){
        //let originalFrame = followBtn.frame
        UIView.animate(withDuration: 0.1, delay: 0, options: [.beginFromCurrentState], animations: {
            followBtn.transform = CGAffineTransform(scaleX: 0, y: 0)
        }) { (finished) in
            checkedBtn.isHidden = false
            UIView.animate(withDuration: 0.2, delay: 0.1, options: [.autoreverse], animations: {
                checkedBtn.transform = CGAffineTransform(rotationAngle: -0.25)
            }, completion: { (finished) in
                UIView.animate(withDuration: 0.8,delay: 2, animations: {
                    checkedBtn.transform = CGAffineTransform(scaleX: 0, y: 0)
                })
            })
        }
    }
    public func likeAnimation(likeBtn:UIView,likeStatus:Bool){
       
        let x = likeBtn.frame.minX - 30
        let y = likeBtn.frame.minY
        let originalFrame:CGRect = likeBtn.frame
        let likeBtnAnimateView:UIImageView = UIImageView.init(frame: originalFrame)
        likeBtnAnimateView.image = UIImage(named: "likeicon")
        self.addSubview(likeBtnAnimateView)
        
        let plusOneImg:UIImageView = UIImageView.init(frame: CGRect(x: x, y: y, width: 20, height: 20))
        plusOneImg.image = UIImage(named: "plusoneicon")
        self.addSubview(plusOneImg)
        
        UIView.animate(withDuration: 0.2, delay: 0.1, options: [.autoreverse,.curveEaseOut], animations: {
            likeBtnAnimateView.transform = CGAffineTransform(scaleX: 1.2, y: 1.2)
        }) {(finished) in
            likeBtnAnimateView.removeFromSuperview()
        }
        
        UIView.animate(withDuration: 0.5, delay: 0, options: [.curveEaseOut], animations: {
            () -> Void in
            plusOneImg.transform = CGAffineTransform(translationX: 0, y: -40)
            //  plusOneImg.transform = CGAffineTransform(scaleX: 1.5, y: 1.5)
        }) { (finished) in
            plusOneImg.removeFromSuperview()
        }
    }
    public func unlikeAnimation(){
        
    }
    public func likeAnimationInScreen(position:CGPoint,likeStatus:Bool){
        let x = position.x
        let y = position.y
       // let plusOneImg:UIImageView = UIImageView.init(frame: CGRect(x: x, y: y, width: 20, height: 20))
        
        if likeStatus{
            let firstImg:UIImageView = UIImageView.init(frame: CGRect(x: x, y: y, width: 20, height: 20))
            firstImg.image = UIImage(named: "likeicon")
            self.addSubview(firstImg)
            UIView.animate(withDuration: 0.5, delay: 0, options: [.curveEaseOut], animations: {
                () -> Void in
                firstImg.transform = CGAffineTransform(translationX: 0, y: -40)
            }) { (finished) in
                firstImg.removeFromSuperview()
            }
            
            let secondImg:UIImageView = UIImageView.init(frame: CGRect(x: x, y: y, width: 20, height: 20))
            secondImg.image = UIImage(named: "likeicon")
            self.addSubview(secondImg)
            UIView.animate(withDuration: 0.3, delay: 0.1, options: [.curveEaseOut], animations: {
                () -> Void in
                //plusOneImg.transform = CGAffineTransform(translationX: 0, y: -40)
                  secondImg.transform = CGAffineTransform(scaleX: 1.5, y: 1.5)
            }) { (finished) in
                secondImg.removeFromSuperview()
            }
            
            let thridImg:UIImageView = UIImageView.init(frame: CGRect(x: x + 10, y: y-25, width: 20, height: 20))
            thridImg.image = UIImage(named: "likeicon")
            self.addSubview(thridImg)
            UIView.animate(withDuration: 0.2, delay: 0.2, options: [.curveEaseOut], animations: {
                () -> Void in
                //plusOneImg.transform = CGAffineTransform(translationX: 0, y: -40)
                thridImg.transform = CGAffineTransform(rotationAngle: 0.3)
            }) { (finished) in
                thridImg.removeFromSuperview()
            }
        }
//        self.addSubview(plusOneImg)
//        UIView.animate(withDuration: 0.5, delay: 0, options: [.curveEaseOut], animations: {
//            () -> Void in
//            plusOneImg.transform = CGAffineTransform(translationX: 0, y: -40)
//          //  plusOneImg.transform = CGAffineTransform(scaleX: 1.5, y: 1.5)
//        }) { (finished) in
//            plusOneImg.removeFromSuperview()
//        }

    }
}
