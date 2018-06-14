//
//  Extentsions.swift
//  ZhibaoZone
//
//  Created by Kevin on 2018/4/29.
//  Copyright © 2018 Kevin. All rights reserved.
//

import UIKit

//随机头像列表
let avatars:NSDictionary = [
    "1":"default1",
    "2":"default2",
    "3":"default3",
    "4":"default4",
    "5":"default5",
    "6":"default6",
    "7":"default7",
    "8":"default8",
    "9":"default9",
    "10":"default10"
]

//随机背景
let backgrounds:NSDictionary = [
    "1":"bg1",
    "2":"bg2",
    "3":"bg3",
    "4":"bg4",
    "5":"bg5"
]

//随机标题
let titles:NSDictionary = [
    "1":"来PetsShow show你的宠物吧，快来，我们等你",
    "2":"赠送宠物保障权益哦，还不快来",
    "3":"来PetsShow关注我，每天上传有意思的宠物Show视频和照片",
    "4":"大家一起来云养宠物吧，不怕过敏啦，一起养只喜欢的宠物",
    "5":"来PetsShow购买物品，能获得正品保证，假一赔三"
]
//随机用户名
let authors:NSDictionary = [
    "1":"云帆风清",
    "2":"Mr.疯子",
    "3":"云养蜂",
    "4":"自由风",
    "5":"差不多得了"
]
//产品名字
let proTitle:NSDictionary = [
    "1":"爱倍 宠物狗主粮狗粮天然全犬种通用成犬粮10kg金毛哈士奇萨摩耶拉布拉多泰迪德牧边牧专用中小20斤",
    "2":"麦富迪Myfoodie宠物狗粮藻趣儿天然成犬粮牛肉味7.5kg",
    "3":"好主人幼犬狗粮 通用型幼犬粮2.5kg 天然营养狗粮 泰迪贵宾博美雪纳瑞巴哥柯基狗粮 不吃免邮包退",
    "4":"皇家 (royal canin) 狗粮 CC优选成犬粮 8KG",
    "5":"耐威克（Navarch）狗粮 成犬 宠物天然粮全犬种犬粮10kg",
    "6":"比瑞吉狗粮 天然粮 泰迪贵宾成犬粮2.2kg",
    "7":"皇家 (royal canin) 狗粮 A3优选幼犬粮 3KG",
    "8":"耐威克（Navarch） 宠物天然粮贵宾/泰迪成犬狗粮5kg",
    "9":"雷米高（RAMICAL） 宠物狗粮 澳丽得牛肉加深海鱼油成犬粮20kg",
    "10":"爱倍 宠物主粮狗粮天然营养配方幼犬粮10kg 比熊泰迪金毛拉布拉多德牧哈士奇阿拉斯加20斤博美萨摩耶"
]
//屏幕宽度和高度
let kWidth = UIScreen.main.bounds.width
let kHight = UIScreen.main.bounds.height

//调整iPhone X高度
var heightChangeForiPhoneXFromTop:CGFloat = 0.0
var heightChangeForiPhoneXFromBottom:CGFloat = 0.0

//标题颜色枚举
enum titleColorsType{
    case red
    case white
    case transparentWhite
    case black
    case lightGray
    case gray
    case darkGray
    case blue
    case clear
}

//图标颜色枚举
enum iconColorsType{
    case red
    case lightRed
    case lightestRed
    case white
    case orange
    case darkGray
    case clear
}

//线条颜色枚举
enum lineColorsType{
    case red
    case white
    case lightGray
    case gray
    case darkGray
    case clear
}

//背景颜色枚举
enum backgroundColorsType{
    case mainColor
    case red
    case lightRed
    case lightestgray
    case white
    case black
    case clear
}

//数据验证格式
enum validateType {
    case EMAIL
    case CNPHONENUM
    case CNIDCARD
}
//登录框状态枚举
enum LoginShowType {
    case NONE
    case USER
    case PASS
}

//检索内容枚举
enum searchContentsType {
    case orderidOnly
    case orderidAndWangWangID
}

//作品分类举例：
enum contentCategoryType{
    case works
    case likes
    case stories
}
// 菜单状态枚举
enum MenuState {
    case Collapsed  // 未显示(收起)
    case Expanding   // 展开中
    case Expanded   // 展开
}

//头像外框形状类型
enum AvatarShape: String {
    /// 圆角正方形
    case AvatarShapeTypeSquareWithRadius = "Radius"
    /// 圆形
    case AvatarShapeTypeRound
    /// 正方形
    case AvatarShapeTypeSquare
    
}

//客户心理价溢价类型
enum productListType: String {
    //宠物主食
    case mainFood
    /// 猫粮
    case catsFood
    // 狗粮
    case dogsFood
    //猫罐头/湿粮
    case catsWeatFood
    //狗罐头/湿粮
    case dosWeatFood
}
//客户心理价溢价类型
enum resourceListType: String {
    //视频
    case Video
    /// 相册
    case Photo
}
class Extentsions: NSObject {

}

//颜色拓展
extension UIColor {
    
    //rgb转Color值
    class func colorWithRgba(_ r: CGFloat, g: CGFloat, b: CGFloat, a:CGFloat)-> UIColor {
        return UIColor(red: r/255.0, green: g/255.0, blue: b/255.0, alpha: a)
        
    }
    
    //设置标题颜色
    class func titleColors(color:titleColorsType) ->UIColor{
        var tempColor = UIColor.colorWithRgba(232, g: 75, b: 76, a: 1.0)
        switch color {
        case .red:
            tempColor = UIColor.colorWithRgba(232, g: 75, b: 76, a: 1.0)
        case .white:
            tempColor = UIColor.colorWithRgba(255, g: 255, b: 255, a: 1.0)
        case .transparentWhite:
            tempColor = UIColor.colorWithRgba(255, g: 255, b: 255, a: 0.7)
        case .black:
            tempColor = UIColor.colorWithRgba(51, g: 51, b: 51, a: 1.0)
        case .lightGray:
            tempColor = UIColor.colorWithRgba(221, g: 221, b: 221, a: 1.0)
        case .gray:
            tempColor = UIColor.colorWithRgba(153, g: 153, b: 153, a: 1.0)
        case .darkGray:
            tempColor = UIColor.colorWithRgba(102, g: 102, b: 102, a: 1.0)
        case .blue:
            tempColor = UIColor.colorWithRgba(16, g: 142, b: 233, a: 1.0)
        case .clear:
            tempColor = UIColor.clear
        default:
            tempColor = UIColor.colorWithRgba(68, g: 68, b: 68, a: 1.0)
        }
        return tempColor
    }
    
    //设置图标颜色
    class func iconColors(color:iconColorsType) ->UIColor{
        var tempColor =  UIColor.colorWithRgba(232, g: 75, b: 76, a: 1.0)
        switch color {
        case .red:
            tempColor = UIColor.colorWithRgba(232, g: 75, b: 76, a: 1.0)
        case .lightRed:
            tempColor = UIColor.colorWithRgba(255, g: 177, b: 177, a: 1.0)
        case .lightestRed:
            tempColor = UIColor.colorWithRgba(251, g: 242, b: 242, a: 1.0)
        case .white:
            tempColor = UIColor.colorWithRgba(255, g: 255, b: 255, a: 1.0)
        case .darkGray:
            tempColor = UIColor.colorWithRgba(102, g: 102, b: 102, a: 1.0)
        case .orange:
            tempColor = UIColor.colorWithRgba(255, g: 144, b: 23, a: 1.0)
        case .clear:
            tempColor = UIColor.clear
        default:
            tempColor = UIColor.colorWithRgba(68, g: 68, b: 68, a: 1.0)
        }
        return tempColor
    }
    
    //设置线条颜色
    class func lineColors(color:lineColorsType) ->UIColor{
        var tempColor = UIColor.colorWithRgba(102, g: 102, b: 102, a: 1.0)
        switch color {
        case .red:
            tempColor = UIColor.colorWithRgba(236, g: 113, b: 113, a: 1.0)
        case .lightGray:
            tempColor = UIColor.colorWithRgba(221, g: 221, b: 221, a: 1.0)
        case .white:
            tempColor = UIColor.colorWithRgba(255, g: 255, b: 255, a: 1.0)
        case .darkGray:
            tempColor = UIColor.colorWithRgba(102, g: 102, b: 102, a: 1.0)
        case .gray:
            tempColor = UIColor.colorWithRgba(155, g: 155, b: 155, a: 1.0)
        case .clear:
            tempColor = UIColor.clear
        default:
            tempColor = UIColor.colorWithRgba(102, g: 102, b: 102, a: 1.0)
        }
        return tempColor
    }
    
    //设置背景颜色
    class func backgroundColors(color:backgroundColorsType) ->UIColor{
        var tempColor = UIColor.colorWithRgba(245, g: 245, b: 245, a: 1.0)
        switch color {
        case .mainColor:
            tempColor = UIColor.colorWithRgba(209, g: 150, b: 102, a: 1.0)
        case .red:
            tempColor = UIColor.colorWithRgba(232, g: 75, b: 76, a: 1.0)
        case .lightRed:
            tempColor = UIColor.colorWithRgba(255, g: 246, b: 246, a: 1.0)
        case .lightestgray:
            tempColor = UIColor.colorWithRgba(245, g: 245, b: 245, a: 1.0)
        case .white:
            tempColor = UIColor.colorWithRgba(255, g: 255, b: 255, a: 1.0)
        case .black:
            tempColor = UIColor.colorWithRgba(18, g: 18, b: 18, a: 1.0)
        case .clear:
            tempColor = UIColor.clear
        default:
            tempColor = UIColor.colorWithRgba(245, g: 245, b: 245, a: 1.0)
        }
        return tempColor
    }
}

//检测设备属性
extension UIDevice{
    public func isX() ->Bool{
        if UIScreen.main.bounds.height == 812 {
            return true
        }
        return false
    }
}

extension String{
    func stringHeightWith(fontSize:CGFloat,width:CGFloat)->CGFloat{
        
        let font = UIFont.systemFont(ofSize: fontSize)
        let size = CGSize(width: width, height: CGFloat.greatestFiniteMagnitude)
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineBreakMode = .byWordWrapping
        let attributes = NSDictionary(object: font, forKey: kCTFontAttributeName as! NSCopying)
        //        let attributes:NSDictionary = NSDictionary(object:UIFont.systemFont(ofSize: 15),                                                   forKey: NSAttributedStringKey.font as NSCopying)
        //[NSFontAttributeName:font, NSParagraphStyleAttributeName:paragraphStyle.copy()]
        let text = self as NSString
        let rect = text.boundingRect(with: size, options: .usesLineFragmentOrigin, attributes: attributes as? [NSAttributedStringKey : Any], context: nil)
        print("height in extension calc as \(rect.size.height)")
        return rect.size.height
    }
}
extension UITextView {
    //添加链接文本（链接为空时则表示普通文本）
    func appendLinkString(string:String, withURLString:String) {
        //原来的文本内容
        let attrString:NSMutableAttributedString = NSMutableAttributedString()
        attrString.append(self.attributedText!)
        
        //新增的文本内容（使用默认设置的字体样式）
        let attrs = [NSAttributedStringKey.font : self.font!]
        let appendString = NSMutableAttributedString(string: string, attributes:attrs)
        //判断是否是链接文字
        if withURLString != "" {
            let range:NSRange = NSMakeRange(0, appendString.length)
            appendString.beginEditing()
            appendString.addAttribute(NSAttributedStringKey.link, value:withURLString, range:range)
            appendString.endEditing()
        }
        //合并新的文本
        attrString.append(appendString)
        print(appendString)
        print(attrString)
        //设置合并后的文本
        self.attributedText = attrString
    }
}


func getRandomName()->String{
    var randomCharactors = ""
    let repeatCount = 6 + arc4random()%120
    for i in 1 ... repeatCount{
        var num = 0 + arc4random()%61 // 自定义ASCII码范围从48到122
        if num >= 0 && num <= 9{
            num += 48
        }else if (num >= 10 && num <= 35){
            num += 55
        }else if (num >= 36 && num <= 61){
            num += 61
        }
        var randomCharactor = Character(UnicodeScalar(num)!)
        randomCharactors.append(randomCharactor)
    }
    return randomCharactors
}

func getRandomNumbers() -> String{
    let tempNumber = Int(arc4random()%1000000 + 1)
    if tempNumber > 10000{
        return "\(Int(tempNumber/10000)).\(Int(tempNumber%10000/1000))W"
    }else{
        return "\(Int(tempNumber))"
    }
}
//颜色渐变
// UIView 渐变色 , UIView及其子类都可以使用，比如UIButton、UILabel等。
//
// Usage:
// myButton.gradientColor(CGPoint(x: 0, y: 0.5), CGPoint(x: 1, y: 0.5), [UIColor(hex: "#FF2619").cgColor, UIColor(hex: "#FF8030").cgColor])

public extension UIView {
    
    // MARK: 添加渐变色图层
    public func gradientColor(_ startPoint: CGPoint, _ endPoint: CGPoint, _ colors: [Any]) {
        
        guard startPoint.x >= 0, startPoint.x <= 1, startPoint.y >= 0, startPoint.y <= 1, endPoint.x >= 0, endPoint.x <= 1, endPoint.y >= 0, endPoint.y <= 1 else {
            return
        }
        
        // 外界如果改变了self的大小，需要先刷新
        layoutIfNeeded()
        
        var gradientLayer: CAGradientLayer!
        
        removeGradientLayer()
        
        gradientLayer = CAGradientLayer()
        gradientLayer.frame = self.layer.bounds
        gradientLayer.startPoint = startPoint
        gradientLayer.endPoint = endPoint
        gradientLayer.colors = colors
        gradientLayer.cornerRadius = self.layer.cornerRadius
        gradientLayer.masksToBounds = true
        // 渐变图层插入到最底层，避免在uibutton上遮盖文字图片
        self.layer.insertSublayer(gradientLayer, at: 0)
        self.backgroundColor = UIColor.clear
        // self如果是UILabel，masksToBounds设为true会导致文字消失
        self.layer.masksToBounds = false
    }
    
    // MARK: 移除渐变图层
    // （当希望只使用backgroundColor的颜色时，需要先移除之前加过的渐变图层）
    public func removeGradientLayer() {
        if let sl = self.layer.sublayers {
            for layer in sl {
                if layer.isKind(of: CAGradientLayer.self) {
                    layer.removeFromSuperlayer()
                }
            }
        }
    }
}

extension Dictionary {
    
    func readBool(_ key: String, defaultValue: Bool! = false) -> Bool! {
        if let dic = self as? Dictionary<String, Any> {
            if dic.keys.contains(key) {
                
                if dic[key] is Int {
                    return (dic[key] as! Int != 0)
                } else if dic[key] is NSNumber {
                    return (dic[key] as! NSNumber).boolValue
                }
                
                return defaultValue
            }
            
            return defaultValue
        }
        
        return defaultValue
    }
    
    
    func readInt(_ key: String, defaultValue: Int! = 0) -> Int! {
        if let dic = self as? Dictionary<String, Any> {
            if dic.keys.contains(key) {
                
                if dic[key] is Int {
                    return dic[key] as! Int
                } else if dic[key] is NSNumber {
                    return (dic[key] as! NSNumber).intValue
                }
                
                return defaultValue
            }
            
            return defaultValue
        }
        
        return defaultValue
    }
    
    func readInt64(_ key: String, defaultValue: Int64! = 0) -> Int64! {
        if let dic = self as? Dictionary<String, Any> {
            if dic.keys.contains(key) {
                
                if dic[key] is Int64 {
                    return dic[key] as! Int64
                } else if dic[key] is NSNumber {
                    return (dic[key] as! NSNumber).int64Value
                }
                
                return defaultValue
            }
            
            return defaultValue
        }
        
        return defaultValue
    }
    
    func readFloat(_ key: String, defaultValue: Float! = 0) -> Float! {
        if let dic = self as? Dictionary<String, Any> {
            if dic.keys.contains(key) {
                
                if dic[key] is Float {
                    return dic[key] as! Float
                } else if dic[key] is NSNumber {
                    return (dic[key] as! NSNumber).floatValue
                }
                
                return defaultValue
            }
            
            return defaultValue
        }
        
        return defaultValue
    }
    
    func readDouble(_ key: String, defaultValue: Double! = 0) -> Double! {
        if let dic = self as? Dictionary<String, Any> {
            if dic.keys.contains(key) {
                
                if dic[key] is Double {
                    return dic[key] as! Double
                } else if dic[key] is NSNumber {
                    return (dic[key] as! NSNumber).doubleValue
                }
                
                return defaultValue
            }
            
            return defaultValue
        }
        
        return defaultValue
    }
    
    
    
    func readString(_ key: String, defaultValue: String! = "") -> String! {
        if let dic = self as? Dictionary<String, Any> {
            if dic.keys.contains(key) {
                
                if dic[key] is String {
                    return dic[key] as! String
                } else if dic[key] is NSString {
                    return dic[key] as! String
                }
                
                return defaultValue
            }
            
            return defaultValue
        }
        
        return defaultValue
    }
    
    func readArray(_ key: String, defaultValue: Array<Any>! = Array<Any>()) -> Array<Any>! {
        if let dic = self as? Dictionary<String, Any> {
            if dic.keys.contains(key) {
                
                if dic[key] is NSArray {
                    return dic[key] as! Array<Any>
                } else if dic[key] is Array<Any> {
                    return dic[key] as! Array<Any>
                }
                
                return defaultValue
            }
            
            return defaultValue
        }
        
        return defaultValue
    }
    
    func readDic(_ key: String, defaultValue: Dictionary<String, Any>! = Dictionary<String, Any>()) -> Dictionary<String, Any>! {
        if let dic = self as? Dictionary<String, Any> {
            if dic.keys.contains(key) {
                
                if dic[key] is NSDictionary {
                    return dic[key] as! Dictionary<String, Any>
                } else if dic[key] is Dictionary<String, Any> {
                    return dic[key] as! Dictionary<String, Any>
                }
                
                return defaultValue
            }
            
            return defaultValue
        }
        
        return defaultValue
    }
    
}

//设置状态栏颜色
func setStatusBarBackgroundColor(color : UIColor) {
    let statusBarWindow : UIView = UIApplication.shared.value(forKey: "statusBarWindow") as! UIView
    let statusBar : UIView = statusBarWindow.value(forKey: "statusBar") as! UIView
    if statusBar.responds(to:#selector(setter: UIView.backgroundColor)) {
        statusBar.backgroundColor = color
    }
    if color == UIColor.backgroundColors(color: .mainColor) || color == UIColor.backgroundColors(color: .black) {
        UIApplication.shared.statusBarStyle = UIStatusBarStyle.lightContent// default // 改成白色字体
    }else if color == UIColor.backgroundColors(color: .clear){
        UIApplication.shared.statusBarStyle = UIStatusBarStyle.lightContent
    }else{
        UIApplication.shared.statusBarStyle = UIStatusBarStyle.lightContent // 改成深色字体
    }
}


//创建毛玻璃效果
func blurEffectView(frame:CGRect) -> UIVisualEffectView {
    //创建一个模糊效果
    let blurEffect = UIBlurEffect(style: .light)
    //创建一个承载模糊效果的视图
    let blurView = UIVisualEffectView(effect: blurEffect)
    blurView.frame = frame//CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height:UIScreen.main.bounds.height )
//    let label = UILabel(frame: CGRect(x: 10, y: 30, width: UIScreen.main.bounds.width - 20, height: 100))
//    label.text = text
//    label.font = UIFont.systemFont(ofSize: 30)
//    label.numberOfLines = 0
//    label.textAlignment = .center
//    label.textColor = UIColor.black
//    blurView.contentView.addSubview(label)
    // blurView.contentView.addSubview(closeBtn)
    return blurView
}

//创建头像方法
func createIcon(avatar:UIImage,imageSize:CGFloat,locale:CGRect,iconShape:AvatarShape, with ring:Bool) -> UIView {
    let photo = UIImageView()
    let image = avatar
    
    photo.bounds = CGRect(x:(UIScreen.main.bounds.width - imageSize)/2,y:(UIScreen.main.bounds.height-imageSize)/2-122,width:imageSize,height:imageSize)
    photo.frame = locale
    
    // 设置图片的外围圆框*
    photo.layer.masksToBounds = true
    if ring{
        photo.layer.borderColor = UIColor.white.cgColor
        photo.layer.borderWidth = 3
    }
    
    // 用设置圆角的方法设置圆形
    switch iconShape {
    case .AvatarShapeTypeSquare:
        photo.layer.cornerRadius =  0
    case .AvatarShapeTypeRound:
        photo.layer.cornerRadius =  photo.bounds.height/2
        photo.layer.borderColor = UIColor.colorWithRgba(240, g: 240, b: 240, a: 1).cgColor
    case .AvatarShapeTypeSquareWithRadius:
        var cornerRadius = photo.bounds.height/6
        if cornerRadius >= 10{
            cornerRadius = 10
        }
        photo.layer.cornerRadius =  cornerRadius
        
    default:
        var cornerRadius = photo.bounds.height/6
        if cornerRadius >= 10{
            cornerRadius = 10
        }
        photo.layer.cornerRadius =  cornerRadius
    }
    
    photo.image = image
    return photo
}

func calculateLabelHeightWithText(with text:String , labelWidth: CGFloat ,textFont:UIFont) -> CGFloat{ // 计算Label高度
    var size = CGRect()
    let size2 = CGSize(width: labelWidth, height: 0)//设置label的最大宽度
    let attibute = [NSAttributedStringKey.font:textFont]
    size = text.boundingRect(with: size2, options: NSStringDrawingOptions.usesLineFragmentOrigin, attributes: attibute , context: nil);
    return size.size.height
}
