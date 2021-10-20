//
//  DeleteAccountViewController.swift
//  AISound
//
//  Created by 李伟 on 2021/10/13.
//

import Foundation
import UIKit
import KRProgressHUD
import MBProgressHUD
class DeleteAccountViewController: UIViewController {
    var gradientView: UIView!
    var backImgV: UIImageView!
    var backBtn: UIButton!
    var titleLabel: UILabel!
    var topLabel: UILabel!
    var pwdView: UIView!
    var pwdImgV: UIImageView!
    var pwdTF: UITextField!
    var deleteBtn: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
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
        titleLabel.text = "Delete Account"
        titleLabel.textColor = .black
        titleLabel.font = UIFont.boldSystemFont(ofSize: 18)
        gradientView.addSubview(titleLabel)
        titleLabel.snp.makeConstraints { make in
            make.centerX.equalTo(gradientView)
            make.centerY.equalTo(backImgV)
        }
        
        topLabel = UILabel()
        topLabel.text = "Enter your password"
        topLabel.font = UIFont.boldSystemFont(ofSize: 24)
        view.addSubview(topLabel)
        topLabel.snp.makeConstraints { make in
            make.top.equalTo(view).offset(201.5 + topSafeAreaHeight + statusBarHeight)
            make.centerX.equalTo(view)
        }
        
        pwdView = UIView()
        pwdView.layer.borderColor = UIColor(hexString: "#FFAB6C")?.cgColor
        pwdView.layer.borderWidth = 1
        pwdView.layer.cornerRadius = 10
        pwdView.layer.masksToBounds = true
        view.addSubview(pwdView)
        pwdView.snp.makeConstraints { make in
            make.left.equalTo(view).offset(29)
            make.right.equalTo(view).offset(-29)
            make.top.equalTo(topLabel.snp_bottom).offset(35)
            make.height.equalTo(48)
        }
        
        pwdImgV = UIImageView(image: UIImage(named: "pwd"))
        pwdView.addSubview(pwdImgV)
        pwdImgV.snp.makeConstraints { make in
            make.left.equalTo(pwdView).offset(10)
            make.centerY.equalTo(pwdView)
        }
        
        pwdTF = UITextField()
        let place = NSMutableAttributedString(string: "Please input in here")
        place.addAttribute(.foregroundColor, value: UIColor(hexString: "#9E9E9E") as Any, range: NSMakeRange(0, place.length))
        place.addAttribute(.font, value: UIFont.systemFont(ofSize: 18), range: NSMakeRange(0, place.length))
        pwdTF.attributedPlaceholder = place
        pwdView.addSubview(pwdTF)
        pwdTF.snp.makeConstraints { make in
            make.left.equalTo(pwdImgV.snp_right).offset(24)
            make.right.top.bottom.equalTo(pwdView)
        }
        
        deleteBtn = UIButton(type: .custom)
        view.addSubview(deleteBtn)
        deleteBtn.snp.makeConstraints { make in
            make.left.equalTo(view).offset(49.5)
            make.right.equalTo(view).offset(-49.5)
            make.top.equalTo(pwdView.snp_bottom).offset(41.5)
            make.height.equalTo(53)
        }
        deleteBtn.setTitle("Delete Account", for: .normal)
        deleteBtn.addTarget(self, action: #selector(deleteAction), for: .touchUpInside)
        deleteBtn.setTitleColor(.white, for: .normal)
        deleteBtn.titleLabel?.font = UIFont.boldSystemFont(ofSize: 18)
        deleteBtn.layer.cornerRadius = 25
        deleteBtn.layer.masksToBounds = true
        view.layoutIfNeeded()
        let deleteGradientLayer = CAGradientLayer().jk.gradientLayer(.horizontal, [UIColor(hexString: "#EB48B1")!.cgColor, UIColor(hexString: "#F4B177")!.cgColor ],nil)
        deleteGradientLayer.frame = CGRect(x: 0, y: 0, width: deleteBtn.jk.width, height: deleteBtn.jk.height)
        deleteBtn.layer.insertSublayer(deleteGradientLayer, at: 0)
    }
    
    @objc func backAction() {
        navigationController?.popViewController(animated: true)
    }
    
    @objc func deleteAction() {
        //0.先判断有没有输入内容
        if (pwdTF.text == nil || pwdTF.text?.count ?? 0 <= 0) {
            KRProgressHUD.showMessage("Please enter the password")
        }
        //1.检测密码是否正确
        if pwdTF.text != AILoginManager.sharedLoginManager.currentUser?.password {
            KRProgressHUD.showMessage("Please enter the correct password")
            return
        }
        
        //1.弹出确认框
        let confirmV = ConfirmView(frame: CGRect(x: 0, y: 0, width: kScrrnWidth, height: kScreenHeight))
        confirmV.title = "Are you sure you want to delete your  account?"
        confirmV.rightStr = "Delete"
        confirmV.rightClick = {
            //0.删除当前账号
            RealmTools.delete(AILoginManager.sharedLoginManager.currentUser!) {
                
            }
            //1.清空本地保存的用户上一次登陆的数据
//            UserDefaults.standard.setValue(AILoginManager.sharedLoginManager.currentUser?.email, forKey: "loginEmail")
//            UserDefaults.standard.setValue(AILoginManager.sharedLoginManager.currentUser?.password, forKey: "loginPwd")
            defaults.setValue(nil, forKey: "loginEmail")
            defaults.setValue(nil, forKey: "loginPwd")
            defaults.setValue(false, forKey: loginKey)
            defaults.setValue(nil, forKey: currentUserKey)
            defaults.synchronize()
            confirmV.removeFromSuperview()
            let hud = MBProgressHUD.showAdded(to: self.view, animated: true)
            hud.mode = .indeterminate
            hud.show(animated: true)
            DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                hud.hide(animated: true)
                //跳转到首页
                let welVc = WelcomeViewController()
                let nav = UINavigationController(rootViewController: welVc)
                nav.navigationBar.isHidden = true
                window?.rootViewController = nav
            }
        }
        view.addSubview(confirmV)
    }
    
    
}
