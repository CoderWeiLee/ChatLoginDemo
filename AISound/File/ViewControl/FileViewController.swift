//
//  FileViewController.swift
//  FileViewController
//
//  Created by 李伟 on 2021/8/1.
//

import UIKit
import SnapKit
class FileViewController: UIViewController {
    var gradientView: UIView!
    var backImgV: UIImageView!
    var backBtn: UIButton!
    var titleLabel: UILabel!
    var labelBg: UIView!
    var noMsgImgV: UIImageView!
    var tipsLabel: UILabel!
    var descLabel: UILabel!
    var searchBtn: UIButton!
    //渐变层
    var gradientLayer:CAGradientLayer!
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
        titleLabel.text = "MESSAGE"
        titleLabel.textColor = .white
        titleLabel.font = UIFont.boldSystemFont(ofSize: 18)
        gradientView.addSubview(titleLabel)
        titleLabel.snp.makeConstraints { make in
            make.centerX.equalTo(gradientView)
            make.centerY.equalTo(backImgV)
        }
        
        noMsgImgV = UIImageView(image: UIImage(named: "OmgMessageNoDate"))
        view.addSubview(noMsgImgV)
        noMsgImgV.snp.makeConstraints { make in
            make.centerX.equalTo(view)
            make.top.equalTo(view).offset(214.5)
        }
        
        labelBg = UIView()
        view.addSubview(labelBg)
        labelBg.snp.makeConstraints { make in
            make.centerX.equalTo(view)
            make.top.equalTo(noMsgImgV.snp_bottom).offset(23)
            make.width.height.equalTo(110)
        }
        
        titleLabel = UILabel()
        labelBg.addSubview(titleLabel)
        titleLabel.font = UIFont.boldSystemFont(ofSize: 18)
        titleLabel.text = "No messages"
        titleLabel.snp.makeConstraints { make in
            make.top.equalTo(labelBg)
            make.centerX.equalTo(labelBg)
        }
        view.layoutIfNeeded()
        //创建CAGradientLayer对象
        gradientLayer = CAGradientLayer()
        
        //设置初始渐变色
        gradientLayer.colors = [UIColor(hexString: "#FF686B")?.cgColor as Any,
                                UIColor(hexString: "#FFB06C")?.cgColor as Any,
                                UIColor(hexString: "#FCDD9A")?.cgColor as Any]
        //设置每种颜色初始所在的位置
        gradientLayer.locations = [0, 0.25, 0.15]
        //设置渲染的起始结束位置（横向渐变）
        gradientLayer.startPoint = CGPoint(x: 0, y: 0.5)
        gradientLayer.endPoint = CGPoint(x: 0, y: 0)
        
        //设置其CAGradientLayer对象的frame，并插入view的layer
        gradientLayer.frame = CGRect(x: 0, y: 0,
                                     width: titleLabel.frame.size.width,
                                     height: titleLabel.frame.size.height)
        
        //将渐变层添加到文本标签背景上
        self.labelBg.layer.insertSublayer(gradientLayer, at: 0)
        //设置遮罩，让渐变层透过文字显示出来
        self.labelBg.mask = titleLabel
        
        descLabel = UILabel()
        descLabel.text = "The more messages you send, he more responses you will receive. So start contacting potential matches now."
        descLabel.numberOfLines = 3
        descLabel.lineBreakMode = .byCharWrapping
        descLabel.font = UIFont.systemFont(ofSize: 15)
        descLabel.textColor = UIColor(hexString: "#FFA96C")
        view.addSubview(descLabel)
        descLabel.snp.makeConstraints { make in
            make.centerX.equalTo(view)
            make.top.equalTo(titleLabel.snp_bottom).offset(18)
            make.left.equalTo(view).offset(57.5)
            make.right.equalTo(view).offset(-52.5)
        }
        
        searchBtn = UIButton(type: .custom)
        view.addSubview(searchBtn)
        searchBtn.snp.makeConstraints { make in
            make.left.equalTo(view).offset(49.5)
            make.right.equalTo(view).offset(-49.5)
            make.top.equalTo(descLabel.snp_bottom).offset(43)
            make.height.equalTo(53)
        }
        searchBtn.setTitle("Search match", for: .normal)
        searchBtn.addTarget(self, action: #selector(searchAction), for: .touchUpInside)
        searchBtn.setTitleColor(.white, for: .normal)
        searchBtn.titleLabel?.font = UIFont.boldSystemFont(ofSize: 18)
        searchBtn.layer.cornerRadius = 25
        searchBtn.layer.masksToBounds = true
        view.layoutIfNeeded()
        let searchGradientLayer = CAGradientLayer().jk.gradientLayer(.horizontal, [UIColor(hexString: "#EB48B1")!.cgColor, UIColor(hexString: "#F4B177")!.cgColor ],nil)
        searchGradientLayer.frame = CGRect(x: 0, y: 0, width: searchBtn.jk.width, height: searchBtn.jk.height)
        searchBtn.layer.insertSublayer(searchGradientLayer, at: 0)
    }
    
    @objc func backAction() {
        self.navigationController?.popViewController(animated: true)
    }

    
    @objc func searchAction() {
//        let searchVc = SearchViewController()
//        searchVc.hidesBottomBarWhenPushed = true
//        navigationController?.pushViewController(searchVc, animated: true)
        
        let navVC = UIApplication.shared.keyWindow?.rootViewController as! UINavigationController
        let rootVc = navVC.children.first as! AITabbarController
        rootVc.selectedIndex = 0
    }

}
