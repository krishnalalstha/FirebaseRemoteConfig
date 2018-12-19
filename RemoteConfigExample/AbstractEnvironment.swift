//
//  AbstracytEnvironment.swift
//  RemoteConfigExample
//
//  Created by Krishna Shrestha on 12/19/18.
//  Copyright © 2018 Krishna Shrestha. All rights reserved.
//

import Foundation
protocol AbstractEnvironment {
    func isLocationEnabled() ->  Bool
    func isSBDEnabled() -> Bool
}
