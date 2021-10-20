//
//  BaseProfileViewController.swift
//  AISound
//
//  Created by 李伟 on 2021/10/13.
//

import UIKit
import SnapKit
import JKSwiftExtension
import McPicker
import ZLPhotoBrowser
import KRProgressHUD
class BaseProfileViewController: UIViewController {
    var gradientView: UIView!
    var backImgV: UIImageView!
    var backBtn: UIButton!
    var titleLabel: UILabel!
    var saveLabel: UILabel!
    var saveBtn: UIButton!
    var uploadImgV: UIImageView!
    var uploadLabel: UILabel!
    var nickNameView: UIView!
    var nickNameImgV: UIImageView!
    var nickTF: UITextField!
    var ageView: UIView!
    var ageImgV: UIImageView!
    var ageTF: UITextField!
    var ageBtn: UIButton!
    var genderView: UIView!
    var genderImgV: UIImageView!
    var genderTF: UITextField!
    var genderBtn: UIButton!
    private var currentDateCom: DateComponents = Calendar.current.dateComponents([.year, .month, .day], from: Date())
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
        
        backImgV = UIImageView(image: UIImage(named: "back_white"))
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
        titleLabel.text = "Base Profile"
        titleLabel.textColor = .white
        titleLabel.font = UIFont.boldSystemFont(ofSize: 18)
        gradientView.addSubview(titleLabel)
        titleLabel.snp.makeConstraints { make in
            make.centerX.equalTo(gradientView)
            make.centerY.equalTo(backImgV)
        }
        
        saveLabel = UILabel()
        saveLabel.text = "Save"
        saveLabel.textColor = .white
        saveLabel.font = UIFont.boldSystemFont(ofSize: 18)
        gradientView.addSubview(saveLabel)
        saveLabel.snp.makeConstraints { make in
            make.right.equalTo(gradientView).offset(-18)
            make.centerY.equalTo(titleLabel)
        }
        
        saveBtn = UIButton(type: .custom)
        saveBtn.addTarget(self, action: #selector(saveAction), for: .touchUpInside)
        gradientView.addSubview(saveBtn)
        saveBtn.snp.makeConstraints { make in
            make.top.right.bottom.equalTo(gradientView)
            make.left.equalTo(150)
        }
        
        if AILoginManager.sharedLoginManager.currentUser?.icon != nil {
            let img = UIImage(data: AILoginManager.sharedLoginManager.currentUser!.icon)
            uploadImgV = UIImageView(image: img)
            uploadImgV.layer.cornerRadius = 73.3
            uploadImgV.layer.masksToBounds = true
            uploadImgV.layer.borderColor = UIColor(hexString: "#FFAB6C")?.cgColor
            uploadImgV.layer.borderWidth = 2
        }else {
            uploadImgV = UIImageView(image: UIImage(named: "uploadphoto"))
        }
        uploadImgV.isUserInteractionEnabled = true
        uploadImgV.contentMode = .scaleAspectFill
        let tapGes = UITapGestureRecognizer(target: self, action: #selector(uploadAction(tap:)))
        uploadImgV.addGestureRecognizer(tapGes)
        view.addSubview(uploadImgV)
        uploadImgV.snp.makeConstraints { make in
            make.width.height.equalTo(146.6)
            make.centerX.equalTo(view)
            make.top.equalTo(view).offset(topSafeAreaHeight + statusBarHeight + 88)
        }
        
        uploadLabel = UILabel()
        uploadLabel.text = "Upload your photo"
        uploadLabel.font = UIFont.systemFont(ofSize: 16)
        view.addSubview(uploadLabel)
        uploadLabel.snp.makeConstraints { make in
            make.centerX.equalTo(view)
            make.top.equalTo(uploadImgV.snp_bottom).offset(24.5)
        }
        
        nickNameView = UIView()
        nickNameView.layer.borderColor = UIColor(hexString: "#FFAB6C")?.cgColor
        nickNameView.layer.borderWidth = 1
        nickNameView.layer.cornerRadius = 10
        nickNameView.layer.masksToBounds = true
        view.addSubview(nickNameView)
        nickNameView.snp.makeConstraints { make in
            make.left.equalTo(view).offset(29)
            make.right.equalTo(view).offset(-29)
            make.top.equalTo(uploadLabel.snp_bottom).offset(46.5)
            make.height.equalTo(48)
        }
        
        nickNameImgV = UIImageView(image: UIImage(named: "nickName"))
        nickNameView.addSubview(nickNameImgV)
        nickNameImgV.snp.makeConstraints { make in
            make.left.equalTo(nickNameView).offset(10)
            make.centerY.equalTo(nickNameView)
            make.width.equalTo(15)
            make.height.equalTo(17)
        }
        
        nickTF = UITextField()
        //0.显示用户的昵称
        nickTF.text = AILoginManager.sharedLoginManager.currentUser?.nickName
        //1.昵称不能被编辑
        nickTF.isUserInteractionEnabled = false
        nickNameView.addSubview(nickTF)
        nickTF.snp.makeConstraints { make in
            make.left.equalTo(nickNameImgV.snp_right).offset(28)
            make.right.top.bottom.equalTo(nickNameView)
        }
        
        ageView = UIView()
        ageView.layer.borderColor = UIColor(hexString: "#FFAB6C")?.cgColor
        ageView.layer.borderWidth = 1
        ageView.layer.cornerRadius = 10
        ageView.layer.masksToBounds = true
        view.addSubview(ageView)
        ageView.snp.makeConstraints { make in
            make.left.equalTo(view).offset(29)
            make.right.equalTo(view).offset(-29)
            make.top.equalTo(nickNameView.snp_bottom).offset(39)
            make.height.equalTo(48)
        }
        
        ageImgV = UIImageView(image: UIImage(named: "age"))
        ageView.addSubview(ageImgV)
        ageImgV.snp.makeConstraints { make in
            make.left.equalTo(ageView).offset(10)
            make.centerY.equalTo(ageView)
        }
        
        ageTF = UITextField()
        if (AILoginManager.sharedLoginManager.currentUser?.age != nil && AILoginManager.sharedLoginManager.currentUser?.age.count ?? 0 > 0) {
            ageTF.text = AILoginManager.sharedLoginManager.currentUser?.age
            ageTF.isUserInteractionEnabled = false
        }else {
            ageTF.placeholder = "Choose your age"
        }
        ageView.addSubview(ageTF)
        ageTF.snp.makeConstraints { make in
            make.left.equalTo(ageImgV.snp_right).offset(24)
            make.right.top.bottom.equalTo(ageView)
        }
        
        ageBtn = UIButton(type: .custom)
        ageBtn.addTarget(self, action: #selector(ageAction), for: .touchUpInside)
        ageView.addSubview(ageBtn)
        ageBtn.snp.makeConstraints { make in
            make.edges.equalTo(ageView)
        }
        
        genderView = UIView()
        genderView.layer.borderColor = UIColor(hexString: "#FFAB6C")?.cgColor
        genderView.layer.borderWidth = 1
        genderView.layer.cornerRadius = 10
        genderView.layer.masksToBounds = true
        view.addSubview(genderView)
        genderView.snp.makeConstraints { make in
            make.left.equalTo(view).offset(29)
            make.right.equalTo(view).offset(-29)
            make.top.equalTo(ageView.snp_bottom).offset(39)
            make.height.equalTo(48)
        }
        
        genderImgV = UIImageView(image: UIImage(named: "gender"))
        genderView.addSubview(genderImgV)
        genderImgV.snp.makeConstraints { make in
            make.left.equalTo(genderView).offset(10)
            make.centerY.equalTo(genderView)
        }
        
        genderTF = UITextField()
        if (AILoginManager.sharedLoginManager.currentUser?.gender != nil && AILoginManager.sharedLoginManager.currentUser?.gender.count ?? 0 > 0) {
            genderTF.text = AILoginManager.sharedLoginManager.currentUser?.gender
            genderTF.isUserInteractionEnabled = false
        }else {
            genderTF.placeholder = "Choose your gender"
        }
        genderView.addSubview(genderTF)
        genderTF.snp.makeConstraints { make in
            make.left.equalTo(genderImgV.snp_right).offset(24)
            make.right.top.bottom.equalTo(genderView)
        }
        
        genderBtn = UIButton(type: .custom)
        genderBtn.addTarget(self, action: #selector(genderAction), for: .touchUpInside)
        genderView.addSubview(genderBtn)
        genderBtn.snp.makeConstraints { make in
            make.edges.equalTo(genderView)
        }
    }
    
  
    
    @objc func backAction() {
        navigationController?.popViewController(animated: true)
    }
    
    
    @objc func ageAction() {
        McPicker.show(data: [[Int](18...99).map {"\($0)"}]) { selections in
            self.ageTF.text = selections.values.first
        } cancelHandler: {
            
        } selectionChangedHandler: { selections, componentThatChanged in
            self.ageTF.text = selections.values.first
            
        }
    }
    
    @objc func genderAction() {
        McPicker.show(data: [["male","female"]]) { selections in
            self.genderTF.text = selections.values.first
        } cancelHandler: {
            
        } selectionChangedHandler: { selections, componentThatChanged in
            self.genderTF.text = selections.values.first
            
        }
    }
    
    @objc func uploadAction(tap: UITapGestureRecognizer) {
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
            self?.uploadImgV.image = images.first
            self?.uploadImgV.layer.cornerRadius = 73.3
            self?.uploadImgV.layer.masksToBounds = true
            self?.uploadImgV.layer.borderColor = UIColor(hexString: "#FFAB6C")?.cgColor
            self?.uploadImgV.layer.borderWidth = 2
//            //保存用户信息
//            if AILoginManager.sharedLoginManager.currentUser == nil {
//                AILoginManager.sharedLoginManager.currentUser = AIUser(firstName: "", lastName: "", email: "", password: "", icon: self?.uploadImgV.image, age: 0, gender: "")
//
//            }else {
//                AILoginManager.sharedLoginManager.currentUser?.icon = self?.uploadImgV.image
//            }
//            //存储在本地
//            UserDefaults.standard.saveCustomObject(customObject: AILoginManager.sharedLoginManager.currentUser!, key: currentUserKey)
//            NotificationCenter.default.post(name: NSNotification.Name(rawValue: "user"), object: nil)
        }
        ps.showPhotoLibrary(sender: self)
    }
    
    @objc func saveAction() {
        //检测文本框是否都有值 可以去除空格后结合正则表达式再判断 这里简单判断什么也不输入的情况
        guard let nick = nickTF.text,nick.count > 0 else {
            KRProgressHUD.showMessage("Please enter your nickname")
            return
        }
        guard let age = ageTF.text, age.count > 0 else {
            KRProgressHUD.showMessage("Please enter your age")
            return
        }
        guard let gender = genderTF.text, gender.count > 0 else {
            KRProgressHUD.showMessage("Please enter your gender")
            return
        }
        //检测图片是否上传
        //保存用户数据
        let data = uploadImgV.image!.pngData()
        try? RealmTools.sharedInstance.currentRealm?.write({
            AILoginManager.sharedLoginManager.currentUser?.icon = data!
            AILoginManager.sharedLoginManager.currentUser?.nickName = nick
            AILoginManager.sharedLoginManager.currentUser?.age = age
            AILoginManager.sharedLoginManager.currentUser?.gender = gender
        })
        //写入到数据库中
        
        RealmTools.update(object: AILoginManager.sharedLoginManager.currentUser!)
        //存储在本地
        defaults.saveCustomObject(customObject: AILoginManager.sharedLoginManager.currentUser!, key: currentUserKey)
        KRProgressHUD.showMessage("save success")
        NotificationCenter.default.post(name: NSNotification.Name(rawValue: "user"), object: nil)
        //返回到上一个界面
        navigationController?.popViewController(animated: true)
    }
}

