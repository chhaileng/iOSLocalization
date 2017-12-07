//
//  ViewController.swift
//  LocalizationTest
//
//  Created by Chhaileng Peng on 12/6/17.
//  Copyright © 2017 Chhaileng. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var welcomeLabel: UILabel!
    @IBOutlet weak var changeButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        welcomeLabel.text = "Welcome".localized
        changeButton.setTitle("change button".localized, for: UIControlState.normal)
    }

    @IBAction func changeButton(_ sender: UIButton) {
        if UserDefaults.standard.string(forKey: "LanguageCode") == "en" {
            LanguageManager.shared.language = "km"
        } else if UserDefaults.standard.string(forKey: "LanguageCode") == "km"{
            LanguageManager.shared.language = "en"
        }
        
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        let homeCotroller = storyBoard.instantiateInitialViewController()
        appDelegate.window?.rootViewController = homeCotroller
        
    }
    
}

