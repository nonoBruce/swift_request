//
//  HttpCommunication.swift
//  Swift-HttpRequest
//
//  Created by yanwen on 15/5/4.
//  Copyright (c) 2015年 GameBegin. All rights reserved.
//

import UIKit

////----请求结果的返回类型
class HttpCommunicationResult : NSObject{
    
    var resultInfo:String = ""
    var returnData:AnyObject = ""
    var isSucess:Bool = false
    var error:AnyObject?
    
}



//MARK: - 网络请求结果协议/回调
protocol HttpResultProtocol {
    
    func requestFinishedSuccess(ctType:HttpCommunicationType, result:HttpCommunicationResult)
    func requestFinishedError(ctType:HttpCommunicationType, result:HttpCommunicationResult)

}


//MARK: - 网络请求类型
enum HttpCommunicationType : Int {
    case ctLogin = 0
    case ctHome
    
}

private let sharedInstance = MyManager()

class MyManager  {
    class var sharedManager : MyManager {
        return sharedInstance
    }
}

//MARK: - 网络请求类

private let mInstance = HttpCommunication()
class HttpCommunication: NSObject {
    
    //创建单例
    class var  sharedInstance : HttpCommunication{
        return mInstance
    }
    
    class func request(dic:NSDictionary!, delegate:HttpResultProtocol, ctType:HttpCommunicationType){
        
        switch ctType {
        case .ctLogin:
            HttpLoginRequest.getRequest(dic, delegate: delegate, ctType: ctType)
            
        case .ctHome:
            println("ctHome1")
            
//        default:
//            println("default")
        }
    
    }
    
    
    

}
