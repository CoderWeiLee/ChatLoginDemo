//
//  BaseSetting.swift
//  AISound
//
//  Created by 李伟 on 2021/10/13.
//

import Foundation
import UIKit
class BaseSettingViewController: UIViewController {
    var gradientView: UIView!
    var backImgV: UIImageView!
    var backBtn: UIButton!
    var titleLabel: UILabel!
    var serviceView: UIView!
    var serviceLabel: UILabel!
    var serviceBtn: UIButton!
    var privacyView: UIView!
    var privacyLabel: UILabel!
    var privacyBtn: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(hexString: "#F5F5F5")
        gradientView = UIView()
        view.addSubview(gradientView)
        gradientView.snp.makeConstraints { make in
            make.left.top.right.equalTo(view)
            make.height.equalTo(navigationHeight)
        }
        view.layoutIfNeeded()
        let signInGradientLayer = CAGradientLayer().jk.gradientLayer(.horizontal, [UIColor(hexString: "#EB48B1")!.cgColor, UIColor(hexString: "#F3B277")!.cgColor ],nil)
        signInGradientLayer.startPoint = CGPoint(x: 0, y: 1)
        signInGradientLayer.endPoint = CGPoint(x: 1, y: 1)
        signInGradientLayer.frame = CGRect(x: 0, y: 0, width: gradientView.jk.width, height: gradientView.jk.height)
        gradientView.layer.insertSublayer(signInGradientLayer, at: 0)
        
        backImgV = UIImageView(image: UIImage(named: "whiteBack"))
        gradientView.addSubview(backImgV)
        backImgV.snp.makeConstraints { make in
            make.left.equalTo(gradientView).offset(15)
            make.bottom.equalTo(gradientView).offset(-11)
        }
       
        backBtn = UIButton(type: .custom)
        gradientView.addSubview(backBtn)
        backBtn.addTarget(self, action: #selector(backAction), for: .touchUpInside)
        backBtn.snp.makeConstraints { make in
            make.left.top.bottom.equalTo(gradientView).offset(0)
            make.width.equalTo(150)
        }
        
        titleLabel = UILabel()
        titleLabel.text = "Base Setting"
        titleLabel.textColor = .white
        titleLabel.font = UIFont.boldSystemFont(ofSize: 18)
        gradientView.addSubview(titleLabel)
        titleLabel.snp.makeConstraints { make in
            make.centerX.equalTo(gradientView)
            make.centerY.equalTo(backImgV)
        }
        
        serviceView = UIView()
        serviceView.backgroundColor = .white
        serviceView.layer.cornerRadius = 5
        serviceView.layer.masksToBounds = true
        view.addSubview(serviceView)
        serviceView.snp.makeConstraints { make in
            make.left.equalTo(view).offset(15)
            make.right.equalTo(view).offset(-15)
            make.top.equalTo(gradientView.snp_bottom).offset(10)
            make.height.equalTo(60)
        }
        
        serviceLabel = UILabel()
        serviceLabel.text = "Delete Account"
        serviceLabel.font = UIFont.boldSystemFont(ofSize: 18)
        serviceView.addSubview(serviceLabel)
        serviceLabel.snp.makeConstraints { make in
            make.left.equalTo(serviceView).offset(18)
            make.centerY.equalTo(serviceView)
        }
        
        serviceBtn = UIButton(type: .custom)
        serviceBtn.addTarget(self, action: #selector(serviceAction), for: .touchUpInside)
        serviceView.addSubview(serviceBtn)
        serviceBtn.snp.makeConstraints { make in
            make.edges.equalTo(serviceView)
        }
        
        privacyView = UIView()
        privacyView.backgroundColor = .white
        privacyView.layer.cornerRadius = 5
        privacyView.layer.masksToBounds = true
        view.addSubview(privacyView)
        privacyView.snp.makeConstraints { make in
            make.left.equalTo(view).offset(15)
            make.right.equalTo(view).offset(-15)
            make.top.equalTo(serviceView.snp_bottom).offset(13)
            make.height.equalTo(60)
        }
        
        privacyLabel = UILabel()
        privacyLabel.text = "Sign Out"
        privacyLabel.font = UIFont.boldSystemFont(ofSize: 18)
        privacyView.addSubview(privacyLabel)
        privacyLabel.snp.makeConstraints { make in
            make.left.equalTo(privacyView).offset(18)
            make.centerY.equalTo(privacyView)
        }
        
        privacyBtn = UIButton(type: .custom)
        privacyBtn.addTarget(self, action: #selector(privacyAction), for: .touchUpInside)
        privacyView.addSubview(privacyBtn)
        privacyBtn.snp.makeConstraints { make in
            make.edges.equalTo(privacyView)
        }
        
        
    }
    
    @objc func backAction() {
        navigationController?.popViewController(animated: true)
    }
    
    //Delete
    @objc func serviceAction() {
        let deleteVc = DeleteAccountViewController()
        deleteVc.hidesBottomBarWhenPushed = true
        navigationController?.pushViewController(deleteVc, animated: true)
    }
    
    //Sign Out
    @objc func privacyAction() {
        //1.弹出确认框
        let confirmV = ConfirmView(frame: CGRect(x: 0, y: 0, width: kScrrnWidth, height: kScreenHeight))
        confirmV.title = "Are you sure you want to sign out?"
        confirmV.rightStr = "Sign out"
        confirmV.rightClick = {
            defaults.setValue(AILoginManager.sharedLoginManager.currentUser?.email, forKey: "loginEmail")
            defaults.setValue(AILoginManager.sharedLoginManager.currentUser?.password, forKey: "loginPwd")
            defaults.setValue(false, forKey: loginKey)
            defaults.set(nil, forKey: currentUserKey)
            defaults.synchronize()
            let welVc = WelcomeViewController()
            let nav = UINavigationController(rootViewController: welVc)
            nav.navigationBar.isHidden = true
            window?.rootViewController = nav
            //发出通知
//            NotificationCenter.default.post(name: NSNotification.Name(rawValue: "signout"), object: nil)
            //将最近登出的用户名和密码写入到本地
        }
        view.addSubview(confirmV)
    }
}
