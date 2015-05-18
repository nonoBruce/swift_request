//
//  HttpLoginRequest.swift
//  Swift-HttpRequest
//
//  Created by yanwen on 15/5/4.
//  Copyright (c) 2015年 GameBegin. All rights reserved.
//
//
// 数据解析和请求
//
//
import UIKit

class HttpLoginRequest: HttpConnect {
    
    //发送请求
    class func getRequest(dic:NSDictionary!, delegate:HttpResultProtocol, ctType:HttpCommunicationType){
        
        //在这里拼接参数
        var url :NSURL = NSURL(string:"http://httpbin.org/get")!
        self.getRequest(url, delegate: delegate, ctType: ctType);
//        self.postRequest(url, dic: dic, delegate: delegate, ctType: HttpCommunicationType.ctLogin)
        
    }
    
    //解析数据
    override class func parse(data: NSDictionary, httpResult:HttpCommunicationResult )->HttpCommunicationResult{
        println("override parse");
        
        httpResult.isSucess = true;
        var loginInfo =  HttpLoginInfo()
        loginInfo.name = data.objectForKey("url") as? String
        loginInfo.id = data.objectForKey("origin") as? String
        
        httpResult.returnData = loginInfo
        
        
        return httpResult
    }

}
