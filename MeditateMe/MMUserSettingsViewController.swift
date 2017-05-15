//
//  MMUserSettingsViewController.swift
//  MeditateMe
//
//  Created by Joseph Chamberlain on 5/1/16.
//  Copyright © 2016 Joseph Chamberlain. All rights reserved.
//

import UIKit

class MMUserSettingsViewController: UITableViewController {
    
    let defaultPreparationTimer: Int = 20
    let defaultMeditationTimer: Int = 300
    var enableSounds: Bool = true

    let settingsTextPreparationTimer: String = "Preparation Timer:"
    let settingsTextMeditationTimer: String = "Meditation Timer:"
    let settingsTextEnableSounds: String = "Enable Sounds"
    
    //Set up storage variable for user preferences.
    let prefs = UserDefaults.standard
    
    @IBOutlet weak var PreparationTimerText: UILabel!
    @IBOutlet weak var PreparationTimerValue: UITextField!
    
    @IBOutlet weak var MeditationTimerText: UILabel!
    @IBOutlet weak var MeditationTimerValue: UITextField!
    
    @IBOutlet weak var EnableSoundsText: UILabel!
    @IBOutlet weak var EnableSoundsSwitch: UISwitch!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor.clear
        view.isOpaque = false
        
        
        prefs.set(defaultPreparationTimer, forKey: "PreparationTimer")
        prefs.set(defaultMeditationTimer, forKey: "MeditationTimer")
        prefs.set(enableSounds, forKey: "EnableSounds")
        
        PreparationTimerText.text = settingsTextPreparationTimer
        PreparationTimerValue.text = String(prefs.integer(forKey: "PreparationTimer"))
        
        MeditationTimerText.text = settingsTextMeditationTimer
        MeditationTimerValue.text = String(prefs.integer(forKey: "MeditationTimer:"))
        
        EnableSoundsText.text = settingsTextEnableSounds
        EnableSoundsSwitch.setOn(enableSounds, animated: true)
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
}
