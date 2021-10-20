//
//  MeViewController.swift
//  MeViewController
//
//  Created by 李伟 on 2021/8/1.
//

import UIKit
import ZLPhotoBrowser
import JKSwiftExtension
class MeViewController: UIViewController {
    var iconImgV: UIImageView!
    var editImgV: UIImageView!
    var nameLabel: UILabel!
    var aboutView: UIView!
    var contactView: UIView!
    var settingView: UIView!
    var aboutUsImgV: UIImageView!
    var aboutUsLabel: UILabel!
    var aboutUsBtn: UIButton!
    var contactUsImgV: UIImageView!
    var contactUsLabel: UILabel!
    var contactUsBtn: UIButton!
    var settingImgV: UIImageView!
    var settingLabel: UILabel!
    var settingBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        iconImgV = UIImageView(image: UIImage(data: AILoginManager.sharedLoginManager.currentUser!.icon))
        iconImgV.isUserInteractionEnabled = true
        let tapGes = UITapGestureRecognizer(target: self, action: #selector(editAction))
        iconImgV.addGestureRecognizer(tapGes)
        iconImgV.contentMode = .scaleAspectFill
        iconImgV.layer.cornerRadius = 70
        iconImgV.layer.masksToBounds = true
        iconImgV.layer.borderColor = UIColor(hexString: "#FFAB6C")?.cgColor
        iconImgV.layer.borderWidth = 2
        view.addSubview(iconImgV)
        iconImgV.snp.makeConstraints { make in
            make.width.height.equalTo(140)
            make.top.equalTo(view).offset(navigationHeight)
            make.centerX.equalTo(view)
        }
        
        editImgV = UIImageView(image: UIImage(named: "edit"))
        view.addSubview(editImgV)
        editImgV.snp.makeConstraints { make in
            make.width.height.equalTo(50)
            make.right.equalTo(iconImgV).offset(10)
            make.bottom.equalTo(iconImgV)
        }
        
        nameLabel = UILabel()
        nameLabel.text = AILoginManager.sharedLoginManager.currentUser?.nickName
        nameLabel.textColor = .black
        nameLabel.font = UIFont.boldSystemFont(ofSize: 24)
        view.addSubview(nameLabel)
        nameLabel.snp.makeConstraints { make in
            make.top.equalTo(iconImgV.snp_bottom).offset(24.5)
            make.centerX.equalTo(view)
        }
        
        aboutView = UIView()
        aboutView.layer.cornerRadius = 15
        aboutView.layer.masksToBounds = false
        aboutView.jk.addShadow(shadowColor: UIColor(hexString: "#FF9A71")!, shadowOffset: CGSize(width: 3, height: 3), shadowOpacity: 0.4, shadowRadius: 15)
        aboutView.backgroundColor = .white
        view.addSubview(aboutView)
        aboutView.snp.makeConstraints { make in
            make.left.equalTo(view).offset(37.5)
            make.right.equalTo(view).offset(-37.5)
            make.top.equalTo(nameLabel.snp_bottom).offset(68.5)
            make.height.equalTo(60)
        }
        
        aboutUsImgV = UIImageView(image: UIImage(named: "aboutUs"))
        aboutView.addSubview(aboutUsImgV)
        aboutUsImgV.snp.makeConstraints { make in
            make.left.equalTo(aboutView).offset(40.5)
            make.centerY.equalTo(aboutView)
        }
        
        aboutUsLabel = UILabel()
        aboutUsLabel.text = "About Us"
        aboutUsLabel.textColor = UIColor(hexString: "#FF33B5")
        aboutUsLabel.font = UIFont.boldSystemFont(ofSize: 18)
        aboutView.addSubview(aboutUsLabel)
        aboutUsLabel.snp.makeConstraints { make in
            make.left.equalTo(aboutUsImgV.snp_right).offset(23.5)
            make.centerY.equalTo(aboutView)
        }
        
        aboutUsBtn = UIButton(type: .custom)
        aboutUsBtn.addTarget(self, action: #selector(aboutUsAction), for: .touchUpInside)
        aboutView.addSubview(aboutUsBtn)
        aboutUsBtn.snp.makeConstraints { make in
            make.edges.equalTo(aboutView)
        }
        
        contactView = UIView()
        contactView.layer.cornerRadius = 15
        contactView.layer.masksToBounds = false
        contactView.jk.addShadow(shadowColor: UIColor(hexString: "#FF9A71")!, shadowOffset: CGSize(width: 1, height: 1), shadowOpacity: 0.4, shadowRadius: 15)
        contactView.backgroundColor = .white
        view.addSubview(contactView)
        contactView.snp.makeConstraints { make in
            make.left.equalTo(view).offset(37.5)
            make.right.equalTo(view).offset(-37.5)
            make.top.equalTo(aboutView.snp_bottom).offset(30)
            make.height.equalTo(60)
        }
        
        contactUsImgV = UIImageView(image: UIImage(named: "contactUs"))
        contactView.addSubview(contactUsImgV)
        contactUsImgV.snp.makeConstraints { make in
            make.left.equalTo(contactView).offset(40.5)
            make.centerY.equalTo(contactView)
        }
        
        contactUsLabel = UILabel()
        contactUsLabel.text = "Contact Us"
        contactUsLabel.textColor = UIColor(hexString: "#FF33B5")
        contactUsLabel.font = UIFont.boldSystemFont(ofSize: 18)
        contactView.addSubview(contactUsLabel)
        contactUsLabel.snp.makeConstraints { make in
            make.left.equalTo(contactUsImgV.snp_right).offset(23.5)
            make.centerY.equalTo(contactView)
        }
        
        contactUsBtn = UIButton(type: .custom)
        contactUsBtn.addTarget(self, action: #selector(contactUsAction), for: .touchUpInside)
        contactView.addSubview(contactUsBtn)
        contactUsBtn.snp.makeConstraints { make in
            make.edges.equalTo(contactView)
        }
        
        settingView = UIView()
        settingView.layer.cornerRadius = 15
        settingView.layer.masksToBounds = false
        settingView.jk.addShadow(shadowColor: UIColor(hexString: "#FF9A71")!, shadowOffset: CGSize(width: 3, height: 3), shadowOpacity: 0.4, shadowRadius: 15)
        settingView.backgroundColor = .white
        view.addSubview(settingView)
        settingView.snp.makeConstraints { make in
            make.left.equalTo(view).offset(37.5)
            make.right.equalTo(view).offset(-37.5)
            make.top.equalTo(contactView.snp_bottom).offset(30)
            make.height.equalTo(60)
        }
        
        settingImgV = UIImageView(image: UIImage(named: "setting"))
        settingView.addSubview(settingImgV)
        settingImgV.snp.makeConstraints { make in
            make.left.equalTo(settingView).offset(40.5)
            make.centerY.equalTo(settingView)
        }
        
        settingLabel = UILabel()
        settingLabel.text = "Base Setting"
        settingLabel.textColor = UIColor(hexString: "#FF33B5")
        settingLabel.font = UIFont.boldSystemFont(ofSize: 18)
        settingView.addSubview(settingLabel)
        settingLabel.snp.makeConstraints { make in
            make.left.equalTo(settingImgV.snp_right).offset(23.5)
            make.centerY.equalTo(settingView)
        }
        
        settingBtn = UIButton(type: .custom)
        settingBtn.addTarget(self, action: #selector(settingAction), for: .touchUpInside)
        settingView.addSubview(settingBtn)
        settingBtn.snp.makeConstraints { make in
            make.edges.equalTo(settingView)
        }
        NotificationCenter.default.addObserver(self, selector: #selector(updateUser), name: NSNotification.Name(rawValue: "user"), object: nil)
}
    
   
    
    @objc func aboutUsAction() {
        let aboutVc = AboutUsViewController()
        aboutVc.hidesBottomBarWhenPushed = true
        navigationController?.pushViewController(aboutVc, animated: true)
    }
    
    @objc func contactUsAction() {
        let feedVc = FeedbackViewController()
        feedVc.hidesBottomBarWhenPushed = true
        navigationController?.pushViewController(feedVc, animated: true)
    }
    
    @objc func settingAction() {
        let settingVc = BaseSettingViewController()
        settingVc.hidesBottomBarWhenPushed = true
        navigationController?.pushViewController(settingVc, animated: true)
    }
    
    @objc func editAction() {
        let baseVc = BaseProfileViewController()
        baseVc.hidesBottomBarWhenPushed = true
        navigationController?.pushViewController(baseVc, animated: true)
    }
    
    @objc func updateUser() {
        iconImgV.image = UIImage(data: AILoginManager.sharedLoginManager.currentUser!.icon)
        nameLabel.text = AILoginManager.sharedLoginManager.currentUser?.nickName
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
}
