//
//  ViewController.swift
//  RemoteConfigExample
//
//  Created by Krishna Shrestha on 12/19/18.
//  Copyright © 2018 Krishna Shrestha. All rights reserved.
//

import UIKit
import FirebaseRemoteConfig

class ViewController: UIViewController {
    
    @IBOutlet weak var lblEnableLocation: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        Environment.shared.initRemoteConfig()
        Environment.shared.fetchConfig()
        print("Remote Config \(Environment.shared.getAppSettings().enableLocation)")
        lblEnableLocation.text="Some test"
        
    }
    


    
}

