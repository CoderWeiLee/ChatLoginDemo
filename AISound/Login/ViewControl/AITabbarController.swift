//
//  AITabbarViewController.swift.swift
//  AISound
//
//  Created by 李伟 on 2021/8/23.
//

import UIKit
class AITabbarController: UITabBarController {
    var tabbar3: UITabBarItem!
    override func viewDidLoad() {
        super.viewDidLoad()
        let nav1 = UINavigationController(rootViewController: RecordViewController())
        let nav2 = UINavigationController(rootViewController: FileViewController())
        let nav3 = UINavigationController(rootViewController: MeViewController())
        let tabbar1 = UITabBarItem(title: "", image: UIImage(named: "Home"), selectedImage: UIImage(named: "Home_select"))
        let tabbar2 = UITabBarItem(title: "", image: UIImage(named: "Msg"), selectedImage: UIImage(named: "Msg_select"))
        
        let girlImg = UIImage(named: "girl")?.reSizeImage(reSize: CGSize(width: 27, height: 27)).createImage(isCornored: true, size: CGSize(width: 27, height: 27), backgroundColor: .clear)
        let normalImg = girlImg?.merge(big: UIImage(named: "Profile")!).withRenderingMode(.alwaysOriginal)
        let selectImg = girlImg?.merge(big: UIImage(named: "Profile_select")!).withRenderingMode(.alwaysOriginal)
        tabbar3 = UITabBarItem(title: "", image: normalImg, selectedImage: selectImg)
        nav1.tabBarItem = tabbar1
        nav2.tabBarItem = tabbar2
        nav3.tabBarItem = tabbar3
        addChild(nav1)
        addChild(nav2)
        addChild(nav3)
        nav1.navigationBar.isHidden = true
        nav2.navigationBar.isHidden = true
        nav3.navigationBar.isHidden = true
        NotificationCenter.default.addObserver(self, selector: #selector(updateUser), name: NSNotification.Name(rawValue: "user"), object: nil)
        if AILoginManager.sharedLoginManager.login {
            updateUser()
        }
        
    }
    
    @objc func updateUser() {
        //0.将Data转为图片
        let girlImg = UIImage(data: AILoginManager.sharedLoginManager.currentUser!.icon)!.reSizeImage(reSize: CGSize(width: 27, height: 27)).createImage(isCornored: true, size: CGSize(width: 27, height: 27), backgroundColor: .clear)
        let normalImg = girlImg.merge(big: UIImage(named: "Profile")!).withRenderingMode(.alwaysOriginal)
        let selectImg = girlImg.merge(big: UIImage(named: "Profile_select")!).withRenderingMode(.alwaysOriginal)
        tabbar3.image = normalImg
        tabbar3.selectedImage = selectImg
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
}

extension  UIImage  {
     /**
      *  重设图片大小
      */
     func  reSizeImage(reSize: CGSize )-> UIImage  {
         UIGraphicsBeginImageContextWithOptions (reSize, false , UIScreen.main.scale);
         draw(in: CGRect(x: 0, y: 0, width: reSize.width, height: reSize.height))
         let reSizeImage = UIGraphicsGetImageFromCurrentImageContext() ?? UIImage()
         UIGraphicsEndImageContext()
         return reSizeImage
     }
     
     /**
      *  等比率缩放
      */
     func  scaleImage(scaleSize: CGFloat )-> UIImage  {
         let reSize = CGSize(width: size.width * scaleSize, height: size.height * scaleSize)
         return reSizeImage(reSize: reSize)
     }
    
    /*
     *   合并两张图片
     */
    func merge(big: UIImage) -> UIImage {
        UIGraphicsBeginImageContext(big.size)
        big.draw(in: CGRect(x: 0, y: 0, width: big.size.width, height: big.size.height))
        draw(in: CGRect(x: 4, y: 4, width: size.width, height: size.height))
        let resultImg = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return resultImg ?? UIImage()
    }
    
    /*
     *  图片裁剪成圆角
     */
        func createImage(isCornored: Bool = true,size: CGSize = CGSize.zero,backgroundColor: UIColor = UIColor.white) -> UIImage {
    //在子线程中执行
                let rect = CGRect(origin: CGPoint.zero, size: size)
                //1. 开启上下文
                UIGraphicsBeginImageContext(size)
//                //2. 设置颜色
//                backgroundColor.setFill()
//                //3. 颜色填充
//                UIRectFill(rect)
                //4. 图像绘制
                //切回角
                let path = UIBezierPath(ovalIn: rect)
                path.addClip()
                
                self.draw(in: rect)
                //5. 获取图片
               let image = UIGraphicsGetImageFromCurrentImageContext() ?? UIImage()
              //6 关闭上下文 ??
                UIGraphicsEndImageContext()
                return image
            }
}
