//
//  AppDelegate.swift
//  AISound
//
//  Created by 李伟 on 2021/7/31.
//

import UIKit
import RealmSwift
@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        Thread.sleep(forTimeInterval: 1)
        window?.backgroundColor = .white
        //查询数据库是否存在
        let fileURL = UserDefaults.standard.value(forKey: "db") as? String ?? ""
        if !FileManager.default.fileExists(atPath: fileURL) {
            //0.创建数据库
            RealmTools.configRealm(userID: "AISound")
            //1.写入默认用户信息
            let userId: Int = 1
            let rootUser = AIUser(id: userId, nickName: "Ailisa", email: "jxwts@163.com", password: "123456", icon: UIImage(named: "girl")!.pngData()!, age: "26", gender: "female")
            RealmTools.add(rootUser) {
                
            //2.设置用户id
            UserDefaults.standard.set(1, forKey: "id")
            UserDefaults.standard.synchronize()
        }
        }else {
            RealmTools.sharedInstance.currentRealm = try? Realm(fileURL: URL(fileURLWithPath: fileURL))
        }
        AILoginManager.sharedLoginManager.login = defaults.value(forKey: loginKey) as? Bool ?? false
        if AILoginManager.sharedLoginManager.login  {
//            AILoginManager.sharedLoginManager.currentUser = defaults.getCustomObject(forKey: currentUserKey) as? AIUser
            //从数据库中读取

            let email = defaults.value(forKey: "loginEmail") as! String
            if let array = RealmTools.objects(AIUser.self) {
                let userArray = array as! [AIUser]
                let emailArray = userArray.filter {$0.email == email}
                AILoginManager.sharedLoginManager.currentUser = emailArray.first
                NotificationCenter.default.post(name: NSNotification.Name(rawValue: "user"), object: nil)
                let nav = UINavigationController(rootViewController: AITabbarController())
                nav.navigationBar.isHidden = true
                window?.rootViewController = nav
            }else {
                window?.rootViewController = UIViewController()
            }
        }else {
            let welVc = WelcomeViewController()
            let nav = UINavigationController(rootViewController: welVc)
            nav.navigationBar.isHidden = true
            window?.rootViewController = nav
        }
        window?.makeKeyAndVisible()
        return true
    }

}

extension UserDefaults {
    func saveCustomObject(customObject object: NSCoding, key: String) {
        let encodedObject = try? NSKeyedArchiver.archivedData(withRootObject: object, requiringSecureCoding: true)
        setValue(encodedObject, forKey: key)
        synchronize()
    }
    
    func getCustomObject(forKey key: String) -> AnyObject? {
        let decodedObject = object(forKey: key) as? Data
        if let decoded = decodedObject {
            let object = try? NSKeyedUnarchiver.unarchivedObject(ofClass: AIUser.self, from: decoded)
            return object
        }
        return nil
    }
}

