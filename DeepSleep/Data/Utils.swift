//
//  Utils.swift
//  DeepSleep
//
//  Created by Fredson Silva on 02/03/23.
//

import SwiftUI
import Foundation

struct Utils {
    
    struct SavedColors {
        static let bgColor = Color("bgColor")
        static let fontColor = Color("fontColor")
        static let lightShadow = Color("lightShadow")
        static let darkShadow = Color("darkShadow")
    }
    
    // MARK: - Shadows
    struct ShadowModifier: ViewModifier {
        func body(content: Content) -> some View {
            content
                .shadow(color: (Utils.SavedColors.lightShadow), radius: 5, x: -8, y: -8)
                .shadow(color: (Utils.SavedColors.darkShadow), radius: 5, x:8, y: 8)
        }
    }
    
    struct InfoShadowModifier: ViewModifier {
        func body(content: Content) -> some View {
            content
                .shadow(color: (Utils.SavedColors.darkShadow), radius: 15, x: -4, y: -4)
                .shadow(color: (Utils.SavedColors.darkShadow), radius: 15, x:4, y: 4)
        }
    }
    
    struct IconModifier: ViewModifier {
        func body(content: Content) -> some View {
            content
                //.shadow(color: (Utils.SavedColors.lightShadow), radius: 5, x: -8, y: -8)
                .shadow(color: (Utils.SavedColors.darkShadow), radius: 3, x:4, y: 4)
        }
    }
    
    // MARK: - Inner Shadow
    struct InnerShadowModifier: ViewModifier {
        
        @State var radius: CGFloat = 10
        
        func body(content: Content) -> some View {
            content
                .overlay (
                    RoundedRectangle(cornerRadius: radius)
                        .stroke((Utils.SavedColors.bgColor), lineWidth: 5)
                        .shadow(color: (Utils.SavedColors.darkShadow), radius: 3, x: 5, y: 5)
                        .clipShape(RoundedRectangle(cornerRadius: radius))
                        .shadow(color: (Utils.SavedColors.lightShadow), radius: 2, x: -4, y: -4)
                        .clipShape(RoundedRectangle(cornerRadius: radius))
                )
        }
    }
    
    struct GetAppVersion {
        
//        struct Test {
//
//            var config: [String: Any]?
//
//            if let infoPlistPath = Bundle.main.url(forResource: "Info", withExtension: "plist") {
//                do {
//                    let infoPlistData = try Data(contentsOf: infoPlistPath)
//
//                    if let dict = try PropertyListSerialization.propertyList(from: infoPlistData, options: [], format: nil) as? [String: Any] {
//                        config = dict
//                    }
//                } catch {
//                    print(error)
//                }
//            }
//
//                print(config?["CFBundleName"])
//                // Optional(example-info)
//
//                print(config?["CFBundleVersion"])
//                // Optional(1)
//
//                print(config?["CFBundleShortVersionString"])
//                // Optional(1.0)
//        }
        
        
//        func test() {
//
//            let buildNumber = Bundle.main.object(forInfoDictionaryKey: "CFBundleVersion") as? String
//
//            if let appVersion = Bundle.main.object(forInfoDictionaryKey: "CFBundleShortVersionString") as? String {
//                print("App version: \(appVersion)")
//            } else {
//                print("your platform does not support this feature.")
//            }
//            if let buildNumber = Bundle.main.object(forInfoDictionaryKey: "CFBundleVersion") as? String {
//                print("Build number: \(buildNumber)")
//            } else {
//                print("your platform does not support this feature.")
//            }
//        }
        
        
//        func getVersion() -> String {
//
//            let kVersion = "version"
//
//            let dictionary = Bundle.main.infoDictionary!
//            let version = dictionary[kVersion] as! String
//
//            //let buildNumber = Bundle.main.object(forInfoDictionaryKey: "CFBundleVersion") as? String
//
//            if let appVersion = Bundle.main.object(forInfoDictionaryKey: "CFBundleShortVersionString") as? String {
//                print("App version: \(appVersion)")
//            } else {
//                print("your platform does not support this feature.")
//            }
//
//            if let buildNumber = Bundle.main.object(forInfoDictionaryKey: "CFBundleVersion") as? String {
//                print("Build number: \(buildNumber)")
//            } else {
//                print("your platform does not support this feature.")
//            }
//
//            return version
//        }
    }
}



