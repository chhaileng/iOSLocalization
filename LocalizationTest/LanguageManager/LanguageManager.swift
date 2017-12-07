//
//  LanguageManager.swift
//  LocalizationTest
//
//  Created by Chhaileng Peng on 12/6/17.
//  Copyright © 2017 Chhaileng. All rights reserved.
//

import Foundation

class LanguageManager {
    static let shared = LanguageManager()
    
    private init() {}
    
    var language: String {
        set {
            UserDefaults.standard.set(newValue, forKey: "LanguageCode")
        }
        get {
            if let data = UserDefaults.standard.string(forKey: "LanguageCode") {
                let languageCode = data.lowercased()
                return languageCode
            } else {
                return self.language
            }
        }
    }
}


extension String {
    var localized:String {
        get {
            if let data = UserDefaults.standard.string(forKey: "LanguageCode") {
                let languageCode = data.lowercased()
                let bundlePath = Bundle.main.path(forResource: languageCode, ofType: "lproj")
                let languageBundle = Bundle(path: bundlePath!)
                var translateString = languageBundle?.localizedString(forKey: self, value: "", table: nil)
                if (translateString?.count)! < 1 {
                    translateString = NSLocalizedString(self, tableName: nil, bundle: Bundle.main, value: self, comment: self)
                }
                return translateString!
            }else{
                return ""
            }
        }
    }
}
