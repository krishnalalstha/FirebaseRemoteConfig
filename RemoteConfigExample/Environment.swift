//
//  Environment.swift
//  RemoteConfigExample
//
//  Created by Krishna Shrestha on 12/19/18.
//  Copyright © 2018 Krishna Shrestha. All rights reserved.
//

import Foundation
import FirebaseRemoteConfig
class Environment: AbstractEnvironment{
   
    let remoteConfig:RemoteConfig
    public static let shared = Environment()
     private init(){
         remoteConfig = RemoteConfig.remoteConfig()
    }
    
    func initRemoteConfig(){
        remoteConfig.configSettings = RemoteConfigSettings(developerModeEnabled: true)
        remoteConfig.setDefaults(fromPlist: "AppSettings")
    }
   
    func fetchConfig() {
        var expirationDuration = 3600
        if remoteConfig.configSettings.isDeveloperModeEnabled {
            expirationDuration = 0
        }
        remoteConfig.fetch(withExpirationDuration: TimeInterval(expirationDuration)) { (status, error) -> Void in
            if status == .success {
                print("Config fetched!")
                self.remoteConfig.activateFetched()
                print(self.remoteConfig["app_settings"].stringValue! )
                
            } else {
                print("Config not fetched")
                print("Error: \(error?.localizedDescription ?? "No error available.")")
            }
            
        }
    }
    func getAppSettings() -> AppSettings{
    let jsonData = remoteConfig["app_settings"].stringValue!.data(using: .utf8)!
    let appSettings = try! JSONDecoder().decode(AppSettings.self, from: jsonData)
    return appSettings
    }
    
    func isLocationEnabled() -> Bool {
       return getAppSettings().enableLocation
    }
    
    func isSBDEnabled() -> Bool {
        return false
    }
    
    
}
