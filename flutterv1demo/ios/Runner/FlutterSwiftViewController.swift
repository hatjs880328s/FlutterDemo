//
//  *******************************************
//  
//  FlutterSwiftViewController.swift
//  Runner
//
//  Created by Noah_Shan on 2019/1/29.
//  Copyright © 2018 Inpur. All rights reserved.
//  
//  *******************************************
//


import UIKit

class FlutterSwiftViewController: UIViewController,FlutterStreamHandler {



    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "hello,flutterswift"
        self.view.backgroundColor = UIColor.white
        // Do any additional setup after loading the view.
        createVw()
    }

    func createVw() {
        let tap = UIButton()
        tap.frame = CGRect(x: 100, y: 100, width: 50, height: 50)
        tap.backgroundColor = UIColor.red
        self.view.addSubview(tap)
        tap.addTarget(self, action: #selector(self.tapAction), for: UIControl.Event.touchUpInside)
    }

    @objc func tapAction() {
        let con = FlutterViewController()
        con.navigationItem.title = "Demo---"
        con.setInitialRoute("home")
        let channelName = "com.inspur.www/iiplatform";
        let evenChannal = FlutterEventChannel(name: channelName, binaryMessenger: con)
        evenChannal.setStreamHandler(self)
        self.progress(flutterCon: con)
        self.navigationController?.isNavigationBarHidden = true
        self.navigationController?.pushViewController(con, animated: true)
    }

    func onListen(withArguments arguments: Any?, eventSink events: @escaping FlutterEventSink) -> FlutterError? {
        print("swift - - ")
        print(events)
        return nil
    }

    func onCancel(withArguments arguments: Any?) -> FlutterError? {
        print("swift - - -")
        return nil
    }

    func progress(flutterCon: FlutterViewController) {
        let batteryChannel = FlutterMethodChannel(name: "com.inspur.www/iiplatform1", binaryMessenger: flutterCon)
        batteryChannel.setMethodCallHandler { (call, result) in
            if call.method == "getBatteryLevel" {
                result(90)
            }
        }
    }
}
