//
//  RecordViewController.swift
//  RecordViewController
//
//  Created by 李伟 on 2021/8/1.
//

import UIKit
import JKSwiftExtension
class RecordViewController: UIViewController {
    var chatImgV: UIImageView!
    var topBgImgV: UIImageView!
    var btn1: UIButton!
    var btn2: UIButton!
    var btn3: UIButton!
    var bgImgV: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        chatImgV = UIImageView(image: UIImage(named: "chat"))
        view.addSubview(chatImgV)
        chatImgV.snp.makeConstraints { make in
            make.top.equalTo(view).offset(topSafeAreaHeight + statusBarHeight + 14)
            make.centerX.equalTo(view)
        }
        
        topBgImgV = UIImageView(image: UIImage(named: "topBg"))
        view.addSubview(topBgImgV)
        topBgImgV.snp.makeConstraints { make in
            make.centerX.equalTo(view)
            make.top.equalTo(chatImgV.snp_bottom).offset(24.5)
        }
        
        btn1 = UIButton(type: .custom)
        btn1.setImage(UIImage(named: "1"), for: .normal)
        btn1.addTarget(self, action: #selector(btn1Action), for: .touchUpInside)
        topBgImgV.addSubview(btn1)
        btn1.snp.makeConstraints { make in
            make.left.equalTo(topBgImgV).offset(11)
            make.centerY.equalTo(topBgImgV)
            make.width.height.equalTo(40)
        }
        
        btn2 = UIButton(type: .custom)
        btn2.setImage(UIImage(named: "2"), for: .normal)
        btn2.addTarget(self, action: #selector(btn2Action), for: .touchUpInside)
        topBgImgV.addSubview(btn2)
        btn2.snp.makeConstraints { make in
            make.centerX.centerY.equalTo(topBgImgV)
            make.width.height.equalTo(39)
        }
        
        btn3 = UIButton(type: .custom)
        btn3.setImage(UIImage(named: "3"), for: .normal)
        btn3.addTarget(self, action: #selector(btn3Action), for: .touchUpInside)
        topBgImgV.addSubview(btn3)
        btn3.snp.makeConstraints { make in
            make.right.equalTo(topBgImgV).offset(-11)
            make.centerY.equalTo(topBgImgV)
            make.width.height.equalTo(40)
        }
        
        bgImgV = UIImageView(image: UIImage(named: "bg"))
        view.addSubview(bgImgV)
        bgImgV.snp.makeConstraints { make in
            make.top.equalTo(btn3.snp_bottom).offset(32.5)
            make.centerX.equalTo(view)
        }
      
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    @objc func btn1Action() {
        
    }
    
    @objc func btn2Action() {
        
    }

    @objc func btn3Action() {
        
    }

}


