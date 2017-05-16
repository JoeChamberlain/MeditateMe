//
//  MMUserSettingsViewController.swift
//  MeditateMe
//
//  Created by Joseph Chamberlain on 5/1/16.
//  Copyright © 2016 Joseph Chamberlain. All rights reserved.
//

import UIKit

class MMUserSettingsViewController: UITableViewController {
    
    let defaults: UserDefaults = UserDefaults.standard
    
    var defaultPreparationTimer: Int?
    var defaultMeditationTimer: Int?
    
    let settingsTextPreparationTimer: String = "Preparation Timer:"
    let settingsTextMeditationTimer: String = "Meditation Timer:"
    
    @IBOutlet weak var PreparationTimerText: UILabel!
    @IBOutlet weak var PreparationTimerValue: UITextField!
    
    @IBOutlet weak var MeditationTimerText: UILabel!
    @IBOutlet weak var MeditationTimerValue: UITextField!

    @IBAction func SaveSettingsButton(_ sender: AnyObject) {
        self.dismiss(animated: true, completion: nil)
        performSegue(withIdentifier: "SettingsSaved", sender: self)
    }
    
    @IBAction func MeditationEditingEnded(_ sender: UITextField) {
        defaultMeditationTimer = Int(MeditationTimerValue.text!)
        defaults.set(MeditationTimerValue.text, forKey: "MeditationTimer")
    }
    @IBAction func PrepEditingEnded(_ sender: UITextField) {
        defaultPreparationTimer = Int(PreparationTimerValue.text!)
        defaults.set(PreparationTimerValue.text, forKey: "PreparationTimer")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor.white
        view.isOpaque = true
        
        defaultPreparationTimer = defaults.integer(forKey: "PreparationTimer")
        defaultMeditationTimer = defaults.integer(forKey: "MeditationTimer")
        
        PreparationTimerText.text = settingsTextPreparationTimer
        PreparationTimerValue.text = String(defaultPreparationTimer!)
        MeditationTimerText.text = settingsTextMeditationTimer
        MeditationTimerValue.text = String(defaultMeditationTimer!)
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
