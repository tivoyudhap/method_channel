//
//  NextViewController.swift
//  Runner
//
//  Created by Tivo Yudha on 26/12/19.
//  Copyright © 2019 The Chromium Authors. All rights reserved.
//

import UIKit

class NextViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func onCallFlutterCodeClicked(_ sender: Any) {
        (UIApplication.shared.delegate as! AppDelegate).flutterMethodChannel.invokeMethod("sendMessage", arguments: "Hello from native side!")
    }
}
