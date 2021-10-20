//
//  LoginViewController.swift
//  LoginViewController
//
//  Created by 李伟 on 2021/8/8.
//
import UIKit
import KRProgressHUD
class LoginViewController: UIViewController {
    var backImgV: UIImageView!
    var backBtn: UIButton!
    var titleLabel: UILabel!
    var emailView: UIView!
    var pwdView: UIView!
    var emailImgV: UIImageView!
    var pwdImgV: UIImageView!
    var emailTF: UITextField!
    var pwdTF: UITextField!
    var signInBtn: UIButton!
    var forgetPwdBtn: UIButton!
    var sepView: UIView!
    var termsBtn: UIButton!
    var privacyBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        backImgV = UIImageView(image: UIImage(named: "back"))
        view.addSubview(backImgV)
        backImgV.snp.makeConstraints { make in
            make.left.equalTo(view).offset(15)
            make.top.equalTo(view).offset(topSafeAreaHeight + statusBarHeight + 16)
        }
        
        backBtn = UIButton(type: .custom)
        backBtn.addTarget(self, action: #selector(backAction), for: .touchUpInside)
        view.addSubview(backBtn)
        backBtn.snp.makeConstraints { make in
            make.left.equalTo(view).offset(0)
            make.top.equalTo(view)
            make.width.height.equalTo(150)
        }

        titleLabel = UILabel()
        titleLabel.text = "Sign In"
        titleLabel.textColor = UIColor(hexString: "#FF31B6")
        titleLabel.font = UIFont.boldSystemFont(ofSize: 18)
        view.addSubview(titleLabel)
        titleLabel.snp.makeConstraints { make in
            make.centerX.equalTo(view)
            make.centerY.equalTo(backImgV)
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
            make.top.equalTo(view).offset(topSafeAreaHeight + statusBarHeight + 143)
            make.height.equalTo(48)
        }
        
        pwdView = UIView()
        pwdView.layer.borderColor = UIColor(hexString: "#FFAB6C")?.cgColor
        pwdView.layer.borderWidth = 1
        pwdView.layer.cornerRadius = 10
        pwdView.layer.masksToBounds = true
        view.addSubview(pwdView)
        pwdView.snp.makeConstraints { make in
            make.left.right.height.equalTo(emailView)
            make.top.equalTo(emailView.snp_bottom).offset(21)
        }
        
        emailImgV = UIImageView(image: UIImage(named: "email"))
        emailView.addSubview(emailImgV)
        emailImgV.snp.makeConstraints { make in
            make.left.equalTo(emailView).offset(10.5)
            make.centerY.equalTo(emailView)
            make.width.equalTo(19)
            make.height.equalTo(14)
        }
        
        pwdImgV = UIImageView(image: UIImage(named: "pwd"))
        pwdView.addSubview(pwdImgV)
        pwdImgV.snp.makeConstraints { make in
            make.left.equalTo(pwdView).offset(10.5)
            make.centerY.equalTo(pwdView)
            make.width.equalTo(14)
            make.height.equalTo(17)
        }
        
        emailTF = UITextField()
        let emailPlace = NSMutableAttributedString(string: "Enter your email")
        if let email = UserDefaults.standard.value(forKey: "loginEmail") as? String {
            emailTF.text = email
        }
        
        emailPlace.addAttribute(.foregroundColor, value: UIColor.black, range: NSMakeRange(0, emailPlace.length))
        emailPlace.addAttribute(.font, value: UIFont.systemFont(ofSize: 16), range: NSMakeRange(0, emailPlace.length))
        emailTF.attributedPlaceholder = emailPlace
        emailView.addSubview(emailTF)
        emailTF.delegate = self
        emailTF.snp.makeConstraints { make in
            make.left.equalTo(emailImgV.snp_right).offset(15)
            make.top.right.bottom.equalTo(emailView)
        }
        
        pwdTF = UITextField()
        let pwdPlace = NSMutableAttributedString(string: "Enter your password")
        if let pwd = UserDefaults.standard.value(forKey: "loginPwd") as? String {
            pwdTF.text = pwd
        }
        
        pwdPlace.addAttribute(.foregroundColor, value: UIColor.black, range: NSMakeRange(0, pwdPlace.length))
        pwdPlace.addAttribute(.font, value: UIFont.systemFont(ofSize: 16), range: NSMakeRange(0, pwdPlace.length))
        pwdTF.attributedPlaceholder = pwdPlace
        pwdTF.delegate = self
        pwdView.addSubview(pwdTF)
        pwdTF.snp.makeConstraints { make in
            make.left.equalTo(pwdImgV.snp_right).offset(15)
            make.top.right.bottom.equalTo(pwdView)
        }
        
        signInBtn = UIButton(type: .custom)
        view.addSubview(signInBtn)
        signInBtn.snp.makeConstraints { make in
            make.left.equalTo(view).offset(49.5)
            make.right.equalTo(view).offset(-49.5)
            make.top.equalTo(pwdView.snp_bottom).offset(41.5)
            make.height.equalTo(53)
        }
        signInBtn.setTitle("Sign In", for: .normal)
        signInBtn.addTarget(self, action: #selector(signInAction), for: .touchUpInside)
        signInBtn.setTitleColor(.white, for: .normal)
        signInBtn.titleLabel?.font = UIFont.boldSystemFont(ofSize: 18)
        signInBtn.layer.cornerRadius = 25
        signInBtn.layer.masksToBounds = true
        view.layoutIfNeeded()
        let signInGradientLayer = CAGradientLayer().jk.gradientLayer(.horizontal, [UIColor(hexString: "#EB48B1")!.cgColor, UIColor(hexString: "#F4B177")!.cgColor ],nil)
        signInGradientLayer.frame = CGRect(x: 0, y: 0, width: signInBtn.jk.width, height: signInBtn.jk.height)
        signInBtn.layer.insertSublayer(signInGradientLayer, at: 0)
        
        forgetPwdBtn = UIButton(type: .custom)
        forgetPwdBtn.addTarget(self, action: #selector(forgetAction), for: .touchUpInside)
        forgetPwdBtn.setTitle("Forgot Password?", for: .normal)
        forgetPwdBtn.titleLabel?.font = UIFont.systemFont(ofSize: 16)
        forgetPwdBtn.setTitleColor(.black, for: .normal)
        view.addSubview(forgetPwdBtn)
        forgetPwdBtn.snp.makeConstraints { make in
            make.left.right.equalTo(signInBtn)
            make.top.equalTo(signInBtn.snp_bottom).offset(20)
            make.height.equalTo(44)
        }
        
        sepView = UIView()
        sepView.backgroundColor = .black
        view.addSubview(sepView)
        sepView.snp.makeConstraints { make in
            make.width.equalTo(1)
            make.height.equalTo(12.5)
            make.centerX.equalTo(view)
            make.bottom.equalTo(view).offset(-28.5)
        }
        
        termsBtn = UIButton(type: .custom)
        termsBtn.addTarget(self, action: #selector(termsAction), for: .touchUpInside)
        termsBtn.setTitle("Terms", for: .normal)
        termsBtn.setTitleColor(UIColor(hexString: "#FF31B6"), for: .normal)
        termsBtn.titleLabel?.font = UIFont.systemFont(ofSize: 12)
        view.addSubview(termsBtn)
        termsBtn.snp.makeConstraints { make in
            make.centerY.equalTo(sepView)
            make.right.equalTo(sepView).offset(-6.5)
        }
        
        privacyBtn = UIButton(type: .custom)
        privacyBtn.addTarget(self, action: #selector(privacyAction), for: .touchUpInside)
        privacyBtn.setTitle("Privacy", for: .normal)
        privacyBtn.setTitleColor(UIColor(hexString: "#FF31B6"), for: .normal)
        privacyBtn.titleLabel?.font = UIFont.systemFont(ofSize: 12)
        view.addSubview(privacyBtn)
        privacyBtn.snp.makeConstraints { make in
            make.centerY.equalTo(sepView)
            make.left.equalTo(sepView).offset(6.5)
        }
        //添加通知
//        NotificationCenter.default.addObserver(self, selector: #selector(signOut), name: NSNotification.Name(rawValue: "signout"), object: nil)
}
    
    @objc func backAction() {
        self.navigationController?.popViewController(animated: true)
    }
    
    @objc func signInAction() {
        //0.邮箱和密码判空
        guard let email = emailTF.text,email.count > 0 else {
            KRProgressHUD.showMessage("email is empty")
            return
        }
        guard let pwd = pwdTF.text,pwd.count > 0 else {
            KRProgressHUD.showMessage("password is empty")
            return
        }
        //1.匹配本地保存的邮箱和密码
        guard let array = RealmTools.objects(AIUser.self) else {
            //显示红色的占位提示文字
            let redPlace = NSMutableAttributedString(string: "Email does not exist")
            redPlace.addAttribute(.foregroundColor, value: UIColor.red, range: NSMakeRange(0, redPlace.length))
            redPlace.addAttribute(.font, value: UIFont.systemFont(ofSize: 16), range: NSMakeRange(0, redPlace.length))
            emailTF.text = ""
            emailTF.attributedPlaceholder = redPlace
            return
        }
        let userArray = array as! [AIUser]
        let emailArray = userArray.filter {$0.email == email}
        if emailArray.count == 0 {
            //显示红色的占位提示文字
            let redPlace = NSMutableAttributedString(string: "Email does not exist")
            redPlace.addAttribute(.foregroundColor, value: UIColor.red, range: NSMakeRange(0, redPlace.length))
            redPlace.addAttribute(.font, value: UIFont.systemFont(ofSize: 16), range: NSMakeRange(0, redPlace.length))
            emailTF.text = ""
            emailTF.attributedPlaceholder = redPlace
            return
        }
        let emailPwdArray = emailArray.filter {$0.password == pwd}
        if emailPwdArray.count == 0 {
            let redPlace = NSMutableAttributedString(string: "password is error")
            redPlace.addAttribute(.foregroundColor, value: UIColor.red, range: NSMakeRange(0, redPlace.length))
            redPlace.addAttribute(.font, value: UIFont.systemFont(ofSize: 16), range: NSMakeRange(0, redPlace.length))
            pwdTF.text = ""
            pwdTF.attributedPlaceholder = redPlace
            return
        }
//        guard let _ = RealmTools.objectsWithPredicate(object: AIUser.self, predicate: NSPredicate(format: "email like \(email)")) else {
//            KRProgressHUD.showMessage("Email does not exist")
//            return
//        }
//        guard let userArray = RealmTools.objectsWithPredicate(object: AIUser.self, predicate: NSPredicate(format: "(email like \(email)) AND (password like \(pwd)")) else {
//            KRProgressHUD.showMessage("password is error")
//            return
//        }
        //2.设置为当前登陆的用户，跳转到首页
        let currentUser = emailPwdArray.first
        AILoginManager.sharedLoginManager.currentUser = currentUser
        //3.保存到本地
        UserDefaults.standard.saveCustomObject(customObject: currentUser!, key: currentUserKey)
        UserDefaults.standard.setValue(true, forKey: loginKey)
        UserDefaults.standard.synchronize()
        //4.跳转到首页
        let nav = UINavigationController(rootViewController: AITabbarController())
        nav.isNavigationBarHidden = true
        window?.rootViewController = nav
        NotificationCenter.default.post(name: NSNotification.Name(rawValue: "user"), object: nil)
    }
    
    @objc func forgetAction() {
        let forgetVc = ForgetViewController()
        navigationController?.pushViewController(forgetVc, animated: true)
    }
    
    @objc func termsAction() {
        let webVc = WebViewController()
        webVc.url = "https://www.baidu.com/"
        webVc.modalPresentationStyle = .pageSheet
        present(webVc, animated: true, completion: nil)
    }
    
    @objc func privacyAction() {
        let webVc = WebViewController()
        webVc.url = "https://www.360.com/"
        webVc.modalPresentationStyle = .pageSheet
        present(webVc, animated: true, completion: nil)
    }
    
    @objc func signOut() {
        //设置文本框的默认文字
        emailTF.text = AILoginManager.sharedLoginManager.currentUser?.email
        pwdTF.text = AILoginManager.sharedLoginManager.currentUser?.password
    }
    
//    deinit {
//        NotificationCenter.default.removeObserver(self)
//    }
}

extension LoginViewController: UITextFieldDelegate {
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        if textField == emailTF {
            let emailPlace = NSMutableAttributedString(string: "Enter your email")
            emailPlace.addAttribute(.foregroundColor, value: UIColor.black, range: NSMakeRange(0, emailPlace.length))
            emailPlace.addAttribute(.font, value: UIFont.systemFont(ofSize: 16), range: NSMakeRange(0, emailPlace.length))
            emailTF.attributedPlaceholder = emailPlace
        }else {
            let pwdPlace = NSMutableAttributedString(string: "Enter your password")
            pwdPlace.addAttribute(.foregroundColor, value: UIColor.black, range: NSMakeRange(0, pwdPlace.length))
            pwdPlace.addAttribute(.font, value: UIFont.systemFont(ofSize: 16), range: NSMakeRange(0, pwdPlace.length))
            pwdTF.attributedPlaceholder = pwdPlace
        }
        return true
    }
}
