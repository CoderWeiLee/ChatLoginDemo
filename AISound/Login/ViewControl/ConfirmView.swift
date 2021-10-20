//
//  selectSexView.swift
//  AISound
//
//  Created by 李伟 on 2021/10/13.
//

import Foundation
import UIKit
class ConfirmView: UIView {
    var contentView: UIView!
    var titleLabel: UILabel!
    var sepLine: UIView!
    var cancelBtn: UIButton!
    var deleteBtn: GradientBorderButton!
    var title: String? {
        didSet {
            titleLabel.text = title
        }
    }
    var rightClick:(()->())?
    var rightStr: String? {
        didSet {
            deleteBtn.setTitle(rightStr, for: .normal)
        }
    }
    //这里也可以选择convenience便捷构造器来初始化
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = UIColor(white: 0, alpha: 0.7)
        contentView = UIView()
        contentView.backgroundColor = .white
        contentView.layer.cornerRadius = 15
        contentView.layer.masksToBounds = true
        addSubview(contentView)
        contentView.snp.makeConstraints { make in
            make.left.equalTo(self).offset(16)
            make.right.equalTo(self).offset(-16)
            make.height.equalTo(270)
            make.centerY.equalTo(self)
        }
    
        titleLabel = UILabel()
        titleLabel.numberOfLines = 2
        titleLabel.textAlignment = .center
        titleLabel.text = "Are you sure you want to delete your  account?"
        titleLabel.textColor = UIColor(hexString: "#FF6A6B")
        titleLabel.font = UIFont.systemFont(ofSize: 18)
        contentView.addSubview(titleLabel)
        titleLabel.snp.makeConstraints { make in
            make.top.equalTo(contentView).offset(78.5)
            make.centerX.equalTo(contentView)
            make.left.equalTo(contentView).offset(23.5)
            make.right.equalTo(contentView).offset(-25)
        }
        
        sepLine = UIView()
        sepLine.backgroundColor = UIColor(hexString: "#FFB6A5")
        sepLine.layer.cornerRadius = 0.5
        sepLine.layer.masksToBounds = true
        contentView.addSubview(sepLine)
        sepLine.snp.makeConstraints { make in
            make.left.right.equalTo(contentView)
            make.top.equalTo(titleLabel.snp_bottom).offset(45.5)
            make.height.equalTo(1)
        }
        
        cancelBtn = UIButton(type: .custom)
        contentView.addSubview(cancelBtn)
        cancelBtn.snp.makeConstraints { make in
            make.left.equalTo(contentView).offset(34)
            make.top.equalTo(sepLine.snp_bottom).offset(27)
            make.height.equalTo(40)
            make.width.equalTo(125)
        }
        cancelBtn.setTitle("Cancel", for: .normal)
        cancelBtn.addTarget(self, action: #selector(cancelAction), for: .touchUpInside)
        cancelBtn.setTitleColor(.white, for: .normal)
        cancelBtn.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        cancelBtn.layer.cornerRadius = 20
        cancelBtn.layer.masksToBounds = true
        layoutIfNeeded()
        let cancelGradientLayer = CAGradientLayer().jk.gradientLayer(.horizontal, [UIColor(hexString: "#EB48B1")!.cgColor, UIColor(hexString: "#F4B177")!.cgColor ],nil)
        cancelGradientLayer.frame = CGRect(x: 0, y: 0, width: cancelBtn.jk.width, height: cancelBtn.jk.height)
        cancelBtn.layer.insertSublayer(cancelGradientLayer, at: 0)
        
        let options = GradientButtonOptions(direction: .horizontal, borderWidth: 2, colors: [UIColor(hexString: "#FF33B1")!, UIColor(hexString: "#FFAC6E")!], cornerRadius: 20)
        deleteBtn = GradientBorderButton()
        deleteBtn.addTarget(self, action: #selector(deleteAction), for: .touchUpInside)
        deleteBtn.setTitle("Delete", for: .normal)
        deleteBtn.setTitleColor(UIColor(hexString: "#FF686B"), for: .normal)
        deleteBtn.titleLabel?.font = UIFont.systemFont(ofSize: 16)
        deleteBtn.configure(with: options)
        contentView.addSubview(deleteBtn)
        deleteBtn.snp.makeConstraints { make in
            make.right.equalTo(contentView).offset(-39)
            make.centerY.width.height.equalTo(cancelBtn)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc func btnAction(btn: UIButton) {
        btn.isSelected = !btn.isSelected
    }
    
    @objc func cancelAction() {
        removeFromSuperview()
    }
    
    @objc func deleteAction() {
        if rightClick != nil {
            rightClick!()
        }
    }
}
