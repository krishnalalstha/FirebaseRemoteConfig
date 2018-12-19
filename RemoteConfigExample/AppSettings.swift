//
//  AppSettings.swift
//  RemoteConfigExample
//
//  Created by Krishna Shrestha on 12/19/18.
//  Copyright © 2018 Krishna Shrestha. All rights reserved.
//

import Foundation
struct AppSettings: Codable {
    let enableLocation: Bool
    let wellcomeMessage: String
    
    enum CodingKeys: String, CodingKey {
        case enableLocation = "enable_location"
        case wellcomeMessage = "wellcome_message"
    }
}
