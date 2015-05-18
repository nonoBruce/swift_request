//
//  ViewController.swift
//  Swift-HttpRequest
//
//  Created by yanwen on 15/5/3.
//  Copyright (c) 2015年 GameBegin. All rights reserved.
//

import UIKit

class ViewController: UIViewController,HttpResultProtocol {

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func buttonAction(sender: UIButton) {
        request()
    }
    
    //发送一个请求，就有回调了，
    func request(){
        

        HttpCommunication.request(nil, delegate: self, ctType: HttpCommunicationType.ctLogin)
        
        
    }
    
    func result() {
        println("abc")
    }
    
    //MARK: - request delegate
    func requestFinishedSuccess(ctType:HttpCommunicationType, result:HttpCommunicationResult){
        println("success")
        if(ctType == HttpCommunicationType.ctLogin){
            var loginInfo = result.returnData as! HttpLoginInfo
            println(loginInfo.id)
            println(loginInfo.name)
        }
        
    }
    func requestFinishedError(ctType:HttpCommunicationType, result:HttpCommunicationResult){
        println("failed")
    }
    
}

