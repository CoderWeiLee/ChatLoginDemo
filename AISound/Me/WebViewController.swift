//
//  WebViewController.swift
//  AISound
//
//  Created by 李伟 on 2021/10/15.
//

import Foundation
import WebKit
class WebViewController: UIViewController {
    var gradientView: UIView!
    var backImgV: UIImageView!
    var backBtn: UIButton!
    var webView: WKWebView!
    var url: String!
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
            make.centerY.equalTo(gradientView)
        }
        
        backBtn = UIButton(type: .custom)
        gradientView.addSubview(backBtn)
        backBtn.addTarget(self, action: #selector(backAction), for: .touchUpInside)
        backBtn.snp.makeConstraints { make in
            make.left.top.bottom.equalTo(gradientView).offset(0)
            make.width.equalTo(150)
        }
        webView = WKWebView()
        view.addSubview(webView)
        webView.snp.makeConstraints { make in
            make.left.right.bottom.equalTo(view)
            make.top.equalTo(gradientView.snp_bottom)
        }
        webView.load(URLRequest(url: URL(string: url)!))
    }
    
    @objc func backAction() {
        dismiss(animated: true, completion: nil)
    }
}
