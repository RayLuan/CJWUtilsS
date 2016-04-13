//
//  QPKeyChainUtils.swift
//  QHProject
//
//  Created by quickplain on 15/12/24.
//  Copyright © 2015年 quickplain. All rights reserved.
//

import UIKit
//import SSKeychain

private let service = "com.cenjiawen.app"
public class QPKeyChainUtils: NSObject {
    
//    public class func save(key: String , value: String ){
//        SSKeychain.setPassword(value, forService: service, account: key)
//    }
//    
//    public class func value(key: String) -> String?{
//        if let value = SSKeychain.passwordForService(service, account: key) {
//            return value
//        }else{
//            return nil
//        }
//    }
//    
//    class func debug(){
//        let accounts = SSKeychain.accountsForService(service)
//        print("accounts \(accounts)")
//    }
//    
//    public class func deleteValue(key: String) -> Bool{
//        return SSKeychain.deletePasswordForService(service, account: key)
//    }
    
    public class var sharedInstance : QPKeyChainUtils {
        struct Static {
            static var onceToken : dispatch_once_t = 0
            static var instance : QPKeyChainUtils? = nil
        }
        dispatch_once(&Static.onceToken) {
            Static.instance = QPKeyChainUtils()
        }
        return Static.instance!
    }
    
    override init() {
    }
    
    public class func setString(value:String, forKey key:String){
//        let userDefault = NSUserDefaults.standardUserDefaults()
//        let secretKey = key.encryptToAESString()
//        let secretValue = value.encryptToAESString()
//        userDefault.setObject(secretValue, forKey: secretKey)
    }
    
    public class func stringForKey(key:String) -> String?{
//        let userDefault = NSUserDefaults.standardUserDefaults()
//        let secretKey = key.encryptToAESString()
//        if let secretValue = userDefault.objectForKey(secretKey) as? String {
//            let value = secretValue.decryptAESString()
//            return value
//        }else{
            return nil
//        }
    }
    
    public class func removeKey(key:String){
//        let secretKey = key.encryptToAESString()
//        let userDefault = NSUserDefaults.standardUserDefaults()
//        userDefault.removeObjectForKey(secretKey)
    }
    
    public class func removeAllItems(){
    }
}

