//
//  AppVersionFile.swift
//  DeepSleep
//
//  Created by Renata Silva on 08/05/23.
//

import Foundation

func getVersion() -> String {
    
    let kVersion = "version"
    
    let dictionary = Bundle.main.infoDictionary!
    let version = dictionary[kVersion] as! String
    
//    let buildNumber = Bundle.main.object(forInfoDictionaryKey: "CFBundleVersion") as? String
//
//    if let appVersion = Bundle.main.object(forInfoDictionaryKey: "CFBundleShortVersionString") as? String {
//        print("App version: \(appVersion)")
//    } else {
//        print("your platform does not support this feature.")
//    }
//
//    if let buildNumber = Bundle.main.object(forInfoDictionaryKey: "CFBundleVersion") as? String {
//        print("Build number: \(buildNumber)")
//    } else {
//        print("your platform does not support this feature.")
//    }
    
    return version
}


