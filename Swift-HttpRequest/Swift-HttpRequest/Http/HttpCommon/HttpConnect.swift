//
//  HttpConnect.swift
//  Swift-HttpRequest
//
//  Created by yanwen on 15/5/4.
//  Copyright (c) 2015年 GameBegin. All rights reserved.
//
//  @description : 发起请求，数据解析，结果回调
//
//
import UIKit
import Alamofire

protocol HttpProtocol {
    
    func parse(data: NSDictionary, httpResult:HttpCommunicationResult )
    
}

class HttpConnect: NSObject {
    
    
    internal class func getRequest(url:NSURL, delegate:HttpResultProtocol, ctType:HttpCommunicationType){
        var data1: AnyObject?
        Alamofire.request(.GET, url).responseJSON{
            (request, response, data, error) in
//            println(request)
//            println(response)
//            println(error)
//            println(data)
            
            var result: HttpCommunicationResult = HttpCommunicationResult()
            if(error != nil){//有错误
                
                result.error = error
                result.isSucess = false
                delegate.requestFinishedError(ctType, result: result)
            }
            else{//表示正确了
                
                var dic = data as! NSDictionary
                result = self.parse(dic, httpResult: result)//result，其实还是上面的那个
                result.isSucess = true
                delegate.requestFinishedSuccess(ctType, result: result)
            }
        }
    }
    
    internal class func postRequest(url:NSURL,dic:NSDictionary!, delegate:HttpResultProtocol, ctType:HttpCommunicationType){
        
        //post 参数处理
        var param :[String: AnyObject]?//这个类型的数组
        if(dic != nil ){
            var array = dic.allKeys as NSArray
            for str in  array  {
                var key = str as! String
                param?.updateValue( dic.objectForKey(str)!, forKey:key )
            }
        }
        
        Alamofire.request(.POST, url,parameters:param).responseJSON{
            (request, response, data, error) in
//            println(request)
//            println(response)
//            println(error)
            var result: HttpCommunicationResult = HttpCommunicationResult()
            if(error != nil){//有错误
                
                result.error = error
                result.isSucess = false
                delegate.requestFinishedError(ctType, result: result)
            }
            else{//表示正确了
                
                var dic = data as! NSDictionary
                result = self.parse(dic, httpResult: result)//result
                result.isSucess = true
                delegate.requestFinishedSuccess(ctType, result: result)
            }

        }
    }
    
    class func parse(data: NSDictionary, httpResult:HttpCommunicationResult ) ->HttpCommunicationResult{
        
        return httpResult
    }
    
}
