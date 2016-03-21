//
//  QPMemberUtils.swift
//  QHProject
//
//  Created by quickplain on 15/12/24.
//  Copyright © 2015年 quickplain. All rights reserved.
//

import UIKit

private let KEY_LOGIN = "LOGIN"
private let KEY_ACCOUNT = "ACCOUNT"
private let KEY_PASSWORD = "PASSWORD"
private let KEY_YES = "YES"
private let KEY_NO = "NO"

public class QPMemberUtils: NSObject {
    
    public var memberInfo = NSDictionary() {
        didSet {
            if let imToken = memberInfo["imToken"] as? String {
                self.imToken = imToken
            }
        }
    }
    
    public var loginFlag = false
    
    public class func login(){
        QPMemberUtils.sharedInstance.loginFlag = true
    }
    
    public var imToken = ""
    public class func logout(){
//        QPHttpUtils.sharedInstance.logout({ (resp) -> Void in
//            //
//            }) { () -> Void in
//                //
//        }
    }
    
    //    class func isLogin() -> Bool{
    //        if let str = QPKeyChainUtils.stringForKey(KEY_LOGIN) {
    //            if str == KEY_YES {
    //                return true
    //            }
    //        }
    //        return false
    //    }
    
    public class func clearUserInfo(){
        QPKeyChainUtils.removeKey(KEY_PASSWORD)
        QPKeyChainUtils.removeKey(KEY_ACCOUNT)
    }
    
    public class func isLoginInfoExist(){
        if QPKeyChainUtils.stringForKey(KEY_ACCOUNT) != nil && QPKeyChainUtils.stringForKey(KEY_PASSWORD) != nil {
        }
    }
    
    public class func saveInfo(account:String,password:String){
        QPKeyChainUtils.setString(account, forKey: KEY_ACCOUNT)
        QPKeyChainUtils.setString(password, forKey: KEY_PASSWORD)
        QPMemberUtils.login()
    }
    
    public class func account() -> String? {
        return QPKeyChainUtils.stringForKey(KEY_ACCOUNT)
    }
    
    public class func password() -> String? {
        return QPKeyChainUtils.stringForKey(KEY_PASSWORD)
    }
    
    public class var sharedInstance : QPMemberUtils {
        struct Static {
            static var onceToken : dispatch_once_t = 0
            static var instance : QPMemberUtils? = nil
        }
        dispatch_once(&Static.onceToken) {
            Static.instance = QPMemberUtils()
        }
        return Static.instance!
    }
    
    public var memberId : Int {
        if let id = memberInfo["id"] as? Int {
            return id
        }
        return -1
    }
    
    public var name : String {
        if let value = memberInfo["name"] as? String {
            return value
        }
        return ""
    }
    
    public var thumbnail : String {
        let tmp = logo.stringByReplacingOccurrencesOfString(".png", withString: "_s.png")
        return tmp
    }
    
    public var logo : String {
        if let value = memberInfo["logo"] as? String {
            return value
        }
        return ""
    }
}
