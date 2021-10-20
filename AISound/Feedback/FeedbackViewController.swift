//
//  FeedbackViewController.swift
//  FeedbackViewController
//
//  Created by 李伟 on 2021/8/1.
//

import UIKit
import RSKPlaceholderTextView
import KRProgressHUD
import JKSwiftExtension
import ZLPhotoBrowser
import MBProgressHUD
class FeedbackViewController: UIViewController {
    var gradientView: UIView!
    var backImgV: UIImageView!
    var backBtn: UIButton!
    var titleLabel: UILabel!
    var selectView: UIView!
    var btn1: UIButton!
    var btn2: UIButton!
    var selectTitle: UILabel!
    var title1: UILabel!
    var title2: UILabel!
    var feedView: UIView!
    var textView: RSKPlaceholderTextView!
    var countLabel: UILabel!
    var selectImgV: UIImageView!
    var submitBtn: UIButton!
    
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
        titleLabel.text = "Send us feedback"
        titleLabel.textColor = .white
        titleLabel.font = UIFont.boldSystemFont(ofSize: 18)
        gradientView.addSubview(titleLabel)
        titleLabel.snp.makeConstraints { make in
            make.centerX.equalTo(gradientView)
            make.centerY.equalTo(backImgV)
        }
        
        selectView = UIView()
        selectView.layer.cornerRadius = 15
        selectView.layer.masksToBounds = true
        selectView.layer.borderWidth = 1
        selectView.layer.borderColor = UIColor(hexString: "#FFAB6C")?.cgColor
        view.addSubview(selectView)
        selectView.snp.makeConstraints { make in
            make.left.equalTo(view).offset(14)
            make.right.equalTo(view).offset(-10.5)
            make.top.equalTo(view).offset(57.5 + topSafeAreaHeight + statusBarHeight)
            make.height.equalTo(144 * kScreenH / 667.0)
        }
        
        btn1 = UIButton(type: .custom)
        btn1.setImage(UIImage(named: "round"), for: .normal)
        btn1.setImage(UIImage(named: "roundSelect"), for: .selected)
        btn1.addTarget(self, action: #selector(btnAction(btn:)), for: .touchUpInside)
        selectView.addSubview(btn1)
        btn1.snp.makeConstraints { make in
            make.left.equalTo(selectView).offset(30.5)
            make.top.equalTo(selectView).offset(65)
            make.width.height.equalTo(15)
        }
        
        btn2 = UIButton(type: .custom)
        btn2.setImage(UIImage(named: "round"), for: .normal)
        btn2.setImage(UIImage(named: "roundSelect"), for: .selected)
        btn2.addTarget(self, action: #selector(btnAction(btn:)), for: .touchUpInside)
        selectView.addSubview(btn2)
        btn2.snp.makeConstraints { make in
            make.left.width.height.equalTo(btn1)
            make.top.equalTo(btn1.snp_bottom).offset(22.5)
        }
        
        selectTitle = UILabel()
        selectTitle.text = "Select type"
        selectTitle.textColor = .black
        selectTitle.font = UIFont.boldSystemFont(ofSize: 18)
        selectView.addSubview(selectTitle)
        selectTitle.snp.makeConstraints { make in
            make.top.equalTo(selectView).offset(19)
            make.centerX.equalTo(selectView)
        }
        
        title1 = UILabel()
        title1.text = "Meet problem"
        title1.font = UIFont.systemFont(ofSize: 15)
        view.addSubview(title1)
        title1.snp.makeConstraints { make in
            make.left.equalTo(btn1.snp_right).offset(15.5)
            make.centerY.equalTo(btn1)
        }
        
        title2 = UILabel()
        title2.text = "Suggestions for improvement"
        title2.font = UIFont.systemFont(ofSize: 15)
        view.addSubview(title2)
        title2.snp.makeConstraints { make in
            make.left.equalTo(btn2.snp_right).offset(15.5)
            make.centerY.equalTo(btn2)
        }
        
        feedView = UIView()
        feedView.layer.cornerRadius = 15
        feedView.layer.masksToBounds = true
        feedView.layer.borderWidth = 1
        feedView.layer.borderColor = UIColor(hexString: "#FFAB6C")?.cgColor
        view.addSubview(feedView)
        feedView.snp.makeConstraints { make in
            make.left.right.equalTo(selectView)
            make.top.equalTo(selectView.snp_bottom).offset(7 * kScreenH / 667.0)
            make.height.equalTo(170 * kScreenH / 667.0)
        }
        
        textView = RSKPlaceholderTextView()
        textView.delegate = self
        let attr = NSMutableAttributedString(string: "Write your suggestions here, and we will have a professional customer service team to serve you.Thank you for your feedback.")
        attr.addAttribute(.foregroundColor, value: UIColor(hexString: "#494949") as Any, range: NSMakeRange(0, attr.length))
        attr.addAttribute(.font, value: UIFont.systemFont(ofSize: 15), range: NSMakeRange(0, attr.length))
        textView.attributedPlaceholder = attr
        textView.backgroundColor = .white
        textView.textColor = UIColor(hexString: "#494949")
        textView.font = UIFont.systemFont(ofSize: 15)
        feedView.addSubview(textView)
        textView.snp.makeConstraints { make in
            make.left.equalTo(feedView).offset(8)
            make.top.equalTo(feedView).offset(18)
            make.right.equalTo(feedView).offset(-17.5)
            make.bottom.equalTo(feedView).offset(-30)
        }
        
        countLabel = UILabel()
        countLabel.text = "0/500"
        countLabel.textColor = UIColor(hexString: "#3D3D3D")
        countLabel.font = UIFont.systemFont(ofSize: 15)
        feedView.addSubview(countLabel)
        countLabel.snp.makeConstraints { make in
            make.right.equalTo(feedView).offset(-11.5)
            make.bottom.equalTo(feedView).offset(-11)
        }
         
        selectImgV = UIImageView(image: UIImage(named: "addImg"))
        selectImgV.isUserInteractionEnabled = true
        let tapGes = UITapGestureRecognizer(target: self, action: #selector(selectImgAction(tap:)))
        selectImgV.addGestureRecognizer(tapGes)
        view.addSubview(selectImgV)
        selectImgV.snp.makeConstraints { make in
            make.width.height.equalTo(104.5 * kScreenH / 667.0)
            make.left.equalTo(view).offset(22.5)
            make.top.equalTo(feedView.snp_bottom).offset(18 * kScreenH / 667.0)
        }
        
        submitBtn = UIButton(type: .custom)
        view.addSubview(submitBtn)
        submitBtn.snp.makeConstraints { make in
            make.left.equalTo(view).offset(49.5)
            make.right.equalTo(view).offset(-49.5)
            make.bottom.equalTo(view).offset(-6 * kScreenH / 667.0)
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
    
    @objc func submitAction() {
        //0.增加文字的判空处理
        guard let text = textView.text,text.count > 0 else {
            KRProgressHUD.showMessage("Please enter your problems")
            return
        }
        textView.text = ""
        let hud = MBProgressHUD.showAdded(to: view, animated: true)
        hud.mode = .indeterminate
        hud.show(animated: true)
        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
            hud.hide(animated: true)
            KRProgressHUD.showMessage("send successful")
        }
    }
    
    @objc func backAction() {
        navigationController?.popViewController(animated: true)
    }
    
    @objc func btnAction(btn: UIButton) {
        btn.isSelected = !btn.isSelected
    }
    
    @objc func selectImgAction(tap: UITapGestureRecognizer) {
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
            self?.selectImgV.image = images.first
        }
        ps.showPhotoLibrary(sender: self)
    }

}

extension FeedbackViewController: UITextViewDelegate {
    func textViewDidChange(_ textView: UITextView) {
        countLabel.text = "\(textView.text.count)/500"
    }
    
    func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
        return textView.jk.inputRestrictions(shouldChangeTextIn: range, replacementText: text, maxCharacters: 500, regex: nil)
    }
    
}
