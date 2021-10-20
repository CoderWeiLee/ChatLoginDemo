//
//  WelcomeViewController.swift
//  WelcomeViewController
//
//  Created by 李伟 on 2021/8/2.
//

import UIKit
import SnapKit
class WelcomeViewController: UIViewController {
    var logoImgV: UIImageView!
    var bgImgV: UIImageView!
    var signInBtn: UIButton!
    var signUpBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        logoImgV = UIImageView(image: UIImage(named: "logo"))
        bgImgV = UIImageView(image: UIImage(named: "bg"))
        view.addSubview(logoImgV)
        logoImgV.snp.makeConstraints { make in
            make.top.equalTo(view.snp_top).offset(topSafeAreaHeight + 21 + statusBarHeight);
            make.centerX.equalTo(view)
        }
        view.addSubview(bgImgV)
        bgImgV.snp.makeConstraints { make in
            make.top.equalTo(logoImgV.snp.bottom).offset(35)
            make.centerX.equalTo(view)
        }
        
        signInBtn = UIButton(type: .custom)
        signUpBtn = UIButton(type: .custom)
        view.addSubview(signInBtn)
        signInBtn.snp.makeConstraints { make in
            make.left.equalTo(view).offset(40)
            make.right.equalTo(view).offset(-40)
            make.top.equalTo(bgImgV.snp_bottom).offset(40)
            make.height.equalTo(44)
        }
        
        view.addSubview(signUpBtn)
        signUpBtn.snp.makeConstraints { make in
            make.left.right.equalTo(signInBtn)
            make.top.equalTo(signInBtn.snp_bottom).offset(20)
            make.height.equalTo(44)
        }
        view.layoutIfNeeded()
        let signInGradientLayer = CAGradientLayer().jk.gradientLayer(.horizontal, [UIColor(hexString: "#EB48B1")!.cgColor, UIColor(hexString: "#F4B177")!.cgColor ],nil)
        signInGradientLayer.frame = CGRect(x: 0, y: 0, width: signInBtn.jk.width, height: signInBtn.jk.height)
        signInBtn.layer.insertSublayer(signInGradientLayer, at: 0)
        signInBtn.setTitle("Sign In", for: .normal)
        signInBtn.setTitleColor(.white, for: .normal)
        signInBtn.titleLabel?.font = UIFont.systemFont(ofSize: 16)
        signInBtn.layer.cornerRadius = 22
        signInBtn.layer.masksToBounds = true
        signInBtn.addTarget(self, action: #selector(signInAction), for: .touchUpInside)
        
        let signUpGradientLayer = CAGradientLayer().jk.gradientLayer(.horizontal, [UIColor(hexString: "#EB48B1")!.cgColor, UIColor(hexString: "#F4B177")!.cgColor ],nil)
        signUpGradientLayer.frame = CGRect(x: 0, y: 0, width: signUpBtn.jk.width, height: signUpBtn.jk.height)
        signUpBtn.layer.insertSublayer(signUpGradientLayer, at: 0)
        signUpBtn.setTitle("Sign Up", for: .normal)
        signUpBtn.setTitleColor(.white, for: .normal)
        signUpBtn.titleLabel?.font = UIFont.systemFont(ofSize: 16)
        signUpBtn.layer.cornerRadius = 22
        signUpBtn.layer.masksToBounds = true
        signUpBtn.addTarget(self, action: #selector(signUpAction), for: .touchUpInside)
    }


    @objc func signInAction() {
        let loginVc = LoginViewController()
        navigationController?.pushViewController(loginVc, animated: true)
    }
    
    @objc func signUpAction() {
        let registerVc = RegisterViewController()
        navigationController?.pushViewController(registerVc, animated: true)
    }
}
