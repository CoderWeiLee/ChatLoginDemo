//
//  forgetViewController.swift
//  AISound
//
//  Created by 李伟 on 2021/10/12.
//

import Foundation
import SnapKit
import JKSwiftExtension
import KRProgressHUD
class ForgetViewController: UIViewController {
    var backBtn: UIButton!
    var titleLabel: UILabel!
    var desLabel: UILabel!
    var emailView: UIView!
    var emailImgV: UIImageView!
    var emailTF: UITextField!
    var submitBtn: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        backBtn = UIButton(type: .custom)
        backBtn.setImage(UIImage(named: "back"), for: .normal)
        backBtn.addTarget(self, action: #selector(backAction), for: .touchUpInside)
        view.addSubview(backBtn)
        backBtn.snp.makeConstraints { make in
            make.left.equalTo(view).offset(15)
            make.top.equalTo(view).offset(topSafeAreaHeight + statusBarHeight + 12)
        }
        
        titleLabel = UILabel()
        titleLabel.text = "Forgot Password"
        titleLabel.textColor = UIColor(hexString: "#FF31B6")
        titleLabel.font = UIFont.boldSystemFont(ofSize: 18)
        view.addSubview(titleLabel)
        titleLabel.snp.makeConstraints { make in
            make.centerX.equalTo(view)
            make.centerY.equalTo(backBtn)
        }
        
        desLabel = UILabel()
        desLabel.text = "Please enter your email and I will send  you the reset password link.You can reset the password in the link."
        desLabel.lineBreakMode = .byCharWrapping
        desLabel.numberOfLines = 3
        desLabel.textColor = UIColor(hexString: "#2A2A2A")
        desLabel.font = UIFont.systemFont(ofSize: 18)
        view.addSubview(desLabel)
        desLabel.snp.makeConstraints { make in
            make.left.equalTo(view).offset(29.5)
            make.right.equalTo(view).offset(-29.5)
            make.top.equalTo(view).offset(topSafeAreaHeight + statusBarHeight + 124.5)
        }
        
        emailView = UIView()
        emailView.layer.borderColor = UIColor(hexString: "#FFAB6C")?.cgColor
        emailView.layer.borderWidth = 1
        emailView.layer.cornerRadius = 10
        emailView.layer.masksToBounds = true
        view.addSubview(emailView)
        emailView.snp.makeConstraints { make in
            make.left.equalTo(view).offset(29)
            make.right.equalTo(view).offset(-29)
            make.top.equalTo(desLabel.snp_bottom).offset(23.5)
            make.height.equalTo(48)
        }
        
        emailImgV = UIImageView(image: UIImage(named: "email"))
        emailView.addSubview(emailImgV)
        emailImgV.snp.makeConstraints { make in
            make.left.equalTo(emailView).offset(10.5)
            make.centerY.equalTo(emailView)
            make.width.equalTo(19)
            make.height.equalTo(14)
        }
        
        emailTF = UITextField()
        let emailPlace = NSMutableAttributedString(string: "Enter your email")
        emailPlace.addAttribute(.foregroundColor, value: UIColor.black, range: NSMakeRange(0, emailPlace.length))
        emailPlace.addAttribute(.font, value: UIFont.systemFont(ofSize: 16), range: NSMakeRange(0, emailPlace.length))
        emailTF.attributedPlaceholder = emailPlace
        emailView.addSubview(emailTF)
        emailTF.snp.makeConstraints { make in
            make.left.equalTo(emailImgV.snp_right).offset(15)
            make.top.right.bottom.equalTo(emailView)
        }
        
        submitBtn = UIButton(type: .custom)
        view.addSubview(submitBtn)
        submitBtn.snp.makeConstraints { make in
            make.left.equalTo(view).offset(49.5)
            make.right.equalTo(view).offset(-49.5)
            make.top.equalTo(emailView.snp_bottom).offset(56.5)
            make.height.equalTo(53)
        }
        submitBtn.setTitle("Submit", for: .normal)
        submitBtn.addTarget(self, action: #selector(submitAction), for: .touchUpInside)
        submitBtn.setTitleColor(.white, for: .normal)
        submitBtn.titleLabel?.font = UIFont.boldSystemFont(ofSize: 18)
        submitBtn.layer.cornerRadius = 25
        submitBtn.layer.masksToBounds = true
        view.layoutIfNeeded()
        let submitGradientLayer = CAGradientLayer().jk.gradientLayer(.horizontal, [UIColor(hexString: "#EB48B1")!.cgColor, UIColor(hexString: "#F4B177")!.cgColor ],nil)
        submitGradientLayer.frame = CGRect(x: 0, y: 0, width: submitBtn.jk.width, height: submitBtn.jk.height)
        submitBtn.layer.insertSublayer(submitGradientLayer, at: 0)
    }
    
    @objc func backAction() {
        self.navigationController?.popViewController(animated: true)
    }
    
    @objc func submitAction() {
        //0.判空处理
        guard let email = emailTF.text,email.count > 0 else {
            KRProgressHUD.showMessage("email is empty")
            return
        }
        UIView.animate(withDuration: 3.0) {
            KRProgressHUD.showMessage("send successful")
        } completion: { _ in
//            self.navigationController?.popViewController(animated: true)
        }

    }
}
