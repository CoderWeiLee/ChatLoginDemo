//
//  SearchViewController.swift
//  AISound
//
//  Created by 李伟 on 2021/10/15.
//

import Foundation
class SearchViewController: UIViewController {
    var gradientView: UIView!
    var backImgV: UIImageView!
    var backBtn: UIButton!
    var titleLabel: UILabel!
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
        titleLabel.text = "Search"
        titleLabel.textColor = .white
        titleLabel.font = UIFont.boldSystemFont(ofSize: 18)
        gradientView.addSubview(titleLabel)
        titleLabel.snp.makeConstraints { make in
            make.centerX.equalTo(gradientView)
            make.centerY.equalTo(backImgV)
        }
    }
    
    @objc func backAction() {
        self.navigationController?.popViewController(animated: true)
    }
}
