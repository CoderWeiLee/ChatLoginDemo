//
//  RegisterViewController.swift
//  RegisterViewController
//
//  Created by 李伟 on 2021/8/8.
//
import UIKit
import JKSwiftExtension
import KRProgressHUD
import McPicker
import ZLPhotoBrowser
import TTTAttributedLabel
import RealmSwift
class RegisterViewController: UIViewController {
    var backImgV: UIImageView!
    var backBtn: UIButton!
    var titleLabel: UILabel!
    var iconImgV: UIImageView!
    var uploadLabel: UILabel!
    var emailView: UIView!
    var pwdView: UIView!
    var emailImgV: UIImageView!
    var pwdImgV: UIImageView!
    var emailTF: UITextField!
    var pwdTF: UITextField!
    var nickView: UIView!
    var nickImgV: UIImageView!
    var nickTF: UITextField!
    var genderView: UIView!
    var genderImgv: UIImageView!
    var genderTF: UITextField!
    var btnTop: UIButton!
    var signUpBtn: UIButton!
    var policyLabel: TTTAttributedLabel!
    var genderBtn: UIButton!
    var iconSelect: Bool = false
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
            make.left.top.equalTo(view)
            make.width.height.equalTo(150)
        }
        
        titleLabel = UILabel()
        titleLabel.text = "Sign Up"
        titleLabel.textColor = UIColor(hexString: "#FF31B6")
        titleLabel.font = UIFont.boldSystemFont(ofSize: 18)
        view.addSubview(titleLabel)
        titleLabel.snp.makeConstraints { make in
            make.centerX.equalTo(view)
            make.centerY.equalTo(backImgV)
        }
        
        iconImgV = UIImageView(image: UIImage(named: "uploadphoto"))
        let tapGes = UITapGestureRecognizer(target: self, action: #selector(tapAction(tap:)))
        iconImgV.isUserInteractionEnabled = true
        iconImgV.contentMode = .scaleAspectFill
        iconImgV.layer.cornerRadius = 54.5
        iconImgV.layer.masksToBounds = true
        iconImgV.addGestureRecognizer(tapGes)
        view.addSubview(iconImgV)
        iconImgV.snp.makeConstraints { make in
            make.width.height.equalTo(109)
            make.centerX.equalTo(view)
            make.top.equalTo(view).offset(topSafeAreaHeight + statusBarHeight + 86.5)
        }
        
        uploadLabel = UILabel()
        uploadLabel.textAlignment = .center
        uploadLabel.text = "Upload your photo"
        uploadLabel.textColor = .black
        uploadLabel.font = UIFont.systemFont(ofSize: 16)
        view.addSubview(uploadLabel)
        uploadLabel.snp.makeConstraints { make in
            make.centerX.equalTo(view)
            make.top.equalTo(iconImgV.snp_bottom).offset(10)
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
            make.top.equalTo(uploadLabel.snp_bottom).offset(20)
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
        
        nickView = UIView()
        nickView.layer.borderColor = UIColor(hexString: "#FFAB6C")?.cgColor
        nickView.layer.borderWidth = 1
        nickView.layer.cornerRadius = 10
        nickView.layer.masksToBounds = true
        view.addSubview(nickView)
        nickView.snp.makeConstraints { make in
            make.left.right.height.equalTo(emailView)
            make.top.equalTo(pwdView.snp_bottom).offset(21)
        }
        
        genderView = UIView()
        genderView.layer.borderColor = UIColor(hexString: "#FFAB6C")?.cgColor
        genderView.layer.borderWidth = 1
        genderView.layer.cornerRadius = 10
        genderView.layer.masksToBounds = true
        view.addSubview(genderView)
        genderView.snp.makeConstraints { make in
            make.left.right.height.equalTo(emailView)
            make.top.equalTo(nickView.snp_bottom).offset(21)
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
        
        nickImgV = UIImageView(image: UIImage(named: "nick"))
        nickView.addSubview(nickImgV)
        nickImgV.snp.makeConstraints { make in
            make.left.equalTo(nickView).offset(10.5)
            make.centerY.equalTo(nickView)
            make.width.equalTo(14)
            make.height.equalTo(17)
        }
        
        genderImgv = UIImageView(image: UIImage(named: "gender"))
        genderView.addSubview(genderImgv)
        genderImgv.snp.makeConstraints { make in
            make.left.equalTo(genderView).offset(10.5)
            make.centerY.equalTo(genderView)
            make.width.equalTo(14)
            make.height.equalTo(17)
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
        
        pwdTF = UITextField()
        let pwdPlace = NSMutableAttributedString(string: "Enter your password")
        pwdPlace.addAttribute(.foregroundColor, value: UIColor.black, range: NSMakeRange(0, pwdPlace.length))
        pwdPlace.addAttribute(.font, value: UIFont.systemFont(ofSize: 16), range: NSMakeRange(0, pwdPlace.length))
        pwdTF.attributedPlaceholder = pwdPlace
        pwdView.addSubview(pwdTF)
        pwdTF.snp.makeConstraints { make in
            make.left.equalTo(pwdImgV.snp_right).offset(15)
            make.top.right.bottom.equalTo(pwdView)
        }
        
        nickTF = UITextField()
        let nickPlace = NSMutableAttributedString(string: "Enter your nickname")
        nickPlace.addAttribute(.foregroundColor, value: UIColor.black, range: NSMakeRange(0, pwdPlace.length))
        nickPlace.addAttribute(.font, value: UIFont.systemFont(ofSize: 16), range: NSMakeRange(0, pwdPlace.length))
        nickTF.attributedPlaceholder = nickPlace
        nickView.addSubview(nickTF)
        nickTF.snp.makeConstraints { make in
            make.left.equalTo(nickImgV.snp_right).offset(15)
            make.top.right.bottom.equalTo(nickView)
        }
        
        genderTF = UITextField()
        let genderPlace = NSMutableAttributedString(string: "Enter your gender")
        genderPlace.addAttribute(.foregroundColor, value: UIColor.black, range: NSMakeRange(0, genderPlace.length))
        genderPlace.addAttribute(.font, value: UIFont.systemFont(ofSize: 16), range: NSMakeRange(0, genderPlace.length))
        genderTF.attributedPlaceholder = genderPlace
        genderView.addSubview(genderTF)
        genderTF.snp.makeConstraints { make in
            make.left.equalTo(genderImgv.snp_right).offset(15)
            make.top.right.bottom.equalTo(genderView)
        }
        
        genderBtn = UIButton(type: .custom)
        genderBtn.addTarget(self, action: #selector(genderAction), for: .touchUpInside)
        genderView.addSubview(genderBtn)
        genderBtn.snp.makeConstraints { make in
            make.edges.equalTo(genderView)
        }
        
        btnTop = UIButton(type: .custom)
        btnTop.setImage(UIImage(named: "white"), for: .normal)
        btnTop.setImage(UIImage(named: "red"), for: .selected)
        btnTop.addTarget(self, action: #selector(btnAction(btn:)), for: .touchUpInside)
        view.addSubview(btnTop)
        btnTop.snp.makeConstraints { make in
            make.left.equalTo(emailView)
            make.top.equalTo(genderView.snp_bottom).offset(20)
            make.width.height.equalTo(22)
        }
        
        policyLabel = TTTAttributedLabel(frame: .zero)
        policyLabel.lineBreakMode = .byCharWrapping
        policyLabel.numberOfLines = 2
        let text = NSMutableAttributedString(string: "By continuing,I confirm that I have reviewed and agree to the Service Agreement and the Privacy Policy.")
        text.addAttribute(.foregroundColor, value: UIColor.black, range: NSMakeRange(0, 62))
        text.addAttribute(.font, value: UIFont.systemFont(ofSize: 12), range: NSMakeRange(0, 62))
        text.addAttribute(.foregroundColor, value: UIColor(hexString: "#FF31B6") as Any, range: NSMakeRange(62, 17))
        text.addAttribute(.font, value: UIFont.systemFont(ofSize: 12), range: NSMakeRange(62, 17))
        text.addAttribute(.foregroundColor, value: UIColor.black, range: NSMakeRange(79, 8))
        text.addAttribute(.font, value: UIFont.systemFont(ofSize: 12), range: NSMakeRange(79, 8))
        text.addAttribute(.foregroundColor, value: UIColor(hexString: "#FF31B6") as Any, range: NSMakeRange(87, 16))
        text.addAttribute(.font, value: UIFont.systemFont(ofSize: 12), range: NSMakeRange(87, 16))
        policyLabel.setText(text)
        /*
         更改链接的样式
         */
        var linkAttributes = [String : Any]()
        linkAttributes[kCTUnderlineStyleAttributeName as String] = false
        linkAttributes[kCTForegroundColorAttributeName as String] = UIColor(hexString: "#FF31B6")
        policyLabel.linkAttributes = linkAttributes
        policyLabel.delegate = self
        let serviceRange = NSString(string: text.string).range(of: "Service Agreement")
        policyLabel.addLink(to: URL(string: "https://www.baidu.com/"), with: serviceRange)
        let policyRange = NSString(string: text.string).range(of: "Privacy Policy.")
        policyLabel.addLink(to: URL(string: "https://www.360.com/"), with: policyRange)
        view.addSubview(policyLabel)
        policyLabel.snp.makeConstraints { make in
            make.left.equalTo(btnTop.snp_right).offset(6)
            make.top.equalTo(genderView.snp_bottom).offset(21.5)
            make.right.equalTo(view).offset(-24.5)
        }
        
        signUpBtn = UIButton(type: .custom)
        view.addSubview(signUpBtn)
        signUpBtn.snp.makeConstraints { make in
            make.left.equalTo(view).offset(49.5)
            make.right.equalTo(view).offset(-49.5)
            make.top.equalTo(policyLabel.snp_bottom).offset(41.5)
            make.height.equalTo(53)
        }
        signUpBtn.setTitle("Register", for: .normal)
        signUpBtn.addTarget(self, action: #selector(registerAction), for: .touchUpInside)
        signUpBtn.setTitleColor(.white, for: .normal)
        signUpBtn.titleLabel?.font = UIFont.boldSystemFont(ofSize: 18)
        signUpBtn.layer.cornerRadius = 25
        signUpBtn.layer.masksToBounds = true
        view.layoutIfNeeded()
        let signUpGradientLayer = CAGradientLayer().jk.gradientLayer(.horizontal, [UIColor(hexString: "#EB48B1")!.cgColor, UIColor(hexString: "#F4B177")!.cgColor ],nil)
        signUpGradientLayer.frame = CGRect(x: 0, y: 0, width: signUpBtn.jk.width, height: signUpBtn.jk.height)
        signUpBtn.layer.insertSublayer(signUpGradientLayer, at: 0)
    }
    
    
    @objc func backAction() {
        self.navigationController?.popViewController(animated: true)
    }
    
    @objc func btnAction(btn: UIButton) {
        btn.isSelected = !btn.isSelected
    }
    
    @objc func registerAction() {
        //0.判断头像是否为空
        guard iconSelect else {
            KRProgressHUD.showMessage("Avatar is empty")
            return
        }
        //1.昵称判空
        guard let nick = nickTF.text,nick.count > 0 else {
            KRProgressHUD.showMessage("Nickname is required")
            return
        }
        //2.判断邮箱和密码
        guard let email = emailTF.text,email.count > 0 else {
            KRProgressHUD.showMessage("Email is empty")
            return
        }
        guard let pwd = pwdTF.text,pwd.count > 0 else {
            KRProgressHUD.showMessage("Password is empty")
            return
        }
        //3.判断性别
        guard let gender = genderTF.text,gender.count > 0 else {
            KRProgressHUD.showMessage("Gender isempty")
            return
        }
        //4.判断隐私协议是否勾选
        guard btnTop.isSelected else {
            KRProgressHUD.showMessage("You must agree to the privacy and service agreement")
            return
        }
        //保存用户信息
        //获取当前用户注册的id
        let userId = (UserDefaults.standard.value(forKey: "id") as! Int) + 1
        //将这个值保存到本地
        UserDefaults.standard.setValue(userId, forKey: "id")
        UserDefaults.standard.synchronize()
        let user = AIUser(id: userId, nickName: nick, email: email, password: pwd, icon: (iconImgV.image?.pngData())!, age: "", gender: gender)
        RealmTools.add(user) {
            
        }
        KRProgressHUD.showMessage("Sign up success")
        //退出到登陆页面  让用户登陆
//        navigationController?.popViewController(animated: true)
       
        AILoginManager.sharedLoginManager.currentUser = user
        //3.保存到本地
        defaults.saveCustomObject(customObject: user, key: currentUserKey)
        defaults.setValue(email, forKey: "loginEmail")
        defaults.setValue(pwd, forKey: "loginPwd")
        defaults.setValue(true, forKey: loginKey)
        defaults.synchronize()
        //4.跳转到首页
        let nav = UINavigationController(rootViewController: AITabbarController())
        nav.isNavigationBarHidden = true
        window?.rootViewController = nav
        NotificationCenter.default.post(name: NSNotification.Name(rawValue: "user"), object: nil)
    }
    
    @objc func tapAction(tap: UITapGestureRecognizer) {
        let ps = ZLPhotoPreviewSheet()
        ZLPhotoConfiguration.default().maxSelectCount = 1
        //不允许拍照
        ZLPhotoConfiguration.default().allowTakePhotoInLibrary = false
        //不允许预览图片
        ZLPhotoConfiguration.default().allowPreviewPhotos = false
        //不显示预览的按钮
        ZLPhotoConfiguration.default().showPreviewButtonInAlbum = false
        //不允许选择原始图片
        ZLPhotoConfiguration.default().allowSelectOriginal = false
        ps.selectImageBlock = { [weak self] (images, assets, isOriginal) in
            self?.iconSelect = true
            self?.iconImgV.image = images.first
            self?.iconImgV.layer.borderColor = UIColor(hexString: "#FFAB6C")?.cgColor
            self?.iconImgV.layer.borderWidth = 2
        }
        ps.showPhotoLibrary(sender: self)
    }
    
    @objc func genderAction() {
        McPicker.show(data: [["male","female"]]) { selections in
            self.genderTF.text = selections.values.first
        } cancelHandler: {
            
        } selectionChangedHandler: { selections, componentThatChanged in
            self.genderTF.text = selections.values.first
            
        }

    }
    
}

extension RegisterViewController: TTTAttributedLabelDelegate {
    func attributedLabel(_ label: TTTAttributedLabel!, didSelectLinkWith url: URL!) {
        
//        UIApplication.shared.open(url, options: [.universalLinksOnly : false], completionHandler: nil)
        let webVc = WebViewController()
        webVc.url = url.absoluteString
        webVc.modalPresentationStyle = .pageSheet
        present(webVc, animated: true, completion: nil)
    }
}
