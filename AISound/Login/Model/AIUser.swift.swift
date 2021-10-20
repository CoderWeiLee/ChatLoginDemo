//
//  AIUser.swift.swift
//  AISound
//
//  Created by 李伟 on 2021/8/19.
//

import Foundation
import UIKit
import RealmSwift
class AIUser: Object, NSCoding, NSSecureCoding{
    static var supportsSecureCoding: Bool = true
    
    struct PropertyKey {
        static let idKey = "idKey"
        static let nickNameKey = "nickNameKey"
        static let emailKey = "email"
        static let passwordKey = "password"
        static let iconKey = "iconKey"
        static let ageKey = "ageKey"
        static let genderKey = "genderKey"
    }
     @objc dynamic var id: Int = 1
     @objc dynamic var nickName = ""
     @objc dynamic var email = ""
     @objc dynamic var password = ""
     @objc dynamic var icon = Data()
     @objc dynamic var age = ""
     @objc dynamic var gender = ""
    override init() {
        super.init()
        
    }
    
    override static func primaryKey() -> String? {
        return "id"
    }
    
    init(id i: Int, nickName nick: String, email em: String, password pw: String, icon ic: Data, age a: String,gender gen: String) {
        super.init()
        id = i
        nickName = nick
        email = em
        password = pw
        icon = ic
        age = a
        gender = gen
    }
    
    func encode(with coder: NSCoder) {
        coder.encode(id,forKey: PropertyKey.idKey)
        coder.encode(nickName, forKey: PropertyKey.nickNameKey)
        coder.encode(email, forKey: PropertyKey.emailKey)
        coder.encode(password, forKey: PropertyKey.passwordKey)
        coder.encode(icon,forKey: PropertyKey.iconKey)
        coder.encode(age,forKey: PropertyKey.ageKey)
        coder.encode(gender,forKey: PropertyKey.genderKey)
    }
    
    required init?(coder: NSCoder) {
        id = coder.decodeInteger(forKey: PropertyKey.idKey)
        nickName = coder.decodeObject(forKey: PropertyKey.nickNameKey) as! String
        email = coder.decodeObject(forKey: PropertyKey.emailKey) as! String
        password = coder.decodeObject(forKey: PropertyKey.passwordKey) as! String
        icon = coder.decodeObject(forKey: PropertyKey.iconKey) as! Data
        age = coder.decodeObject(forKey: PropertyKey.ageKey) as! String
        gender = coder.decodeObject(forKey: PropertyKey.genderKey) as! String
    }
    
}
