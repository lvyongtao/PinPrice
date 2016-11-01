//
//  UserInfo.swift
//  PinPrice
//
//  Created by lvyongtao on 16/10/24.
//  Copyright © 2016年 lvyongtao. All rights reserved.
//

import UIKit
    var nickName:String = ""
    var userImage:String = ""
    var userPhone = ""
    var userid = ""
    var userPassword = ""
    private var prica = ""

class UserInfo: NSObject {
   
    func GetNickName() -> String {
        nickName = UserDefaults.standard.object(forKey: "nickName") as! String
        return nickName
    }
    func GetUserImage() -> String {
        userImage = UserDefaults.standard.object(forKey: "userImage") as! String
        return userImage
    }
    
    func GetUserPhone() -> String {
        userPhone = "phone"
        UserDefaults.standard.set(userPhone, forKey: "userPhone")
        userPhone = UserDefaults.standard.object(forKey: "userPhone") as! String
        return userPhone
    }

}

