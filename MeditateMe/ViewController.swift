//
//  ViewController.swift
//  MeditateMe
//
//  Created by Joseph Chamberlain on 4/28/16.
//  Copyright © 2016 Joseph Chamberlain. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIViewControllerTransitioningDelegate {

    let timerController = MMButtonStartTimerController()
    var shouldResetTimer = false
    var defaultMediTimer = 0
    var defaultPrepTimer = 0
    
    @IBAction func startButtonTapped(_ sender: AnyObject) {
        timerController.MainTimerTapped(prepTimerDefault: defaultPrepTimer, mediTimerDefault: defaultMediTimer)
    }
    
    @IBAction func startButtonLongPress(_ sender: AnyObject) {
        timerController.ResetTimer()
    }
    
    @IBOutlet weak var buttonStartTimerOutlet: UIButton!
    @IBOutlet weak var settingsButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Settings button set to Unicode character for cog "image" (2699)
        settingsButton.setTitle(NSString(string: "\u{2699}") as String, for: UIControlState())
        
        timerController.timerControllerDataSource = self
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if(segue.identifier == "SettingsSaved") {
            let vc = segue.destination as! MMUserSettingsViewController
            defaultPrepTimer = vc.defaultMeditationTimer!
            defaultPrepTimer = vc.defaultPreparationTimer!
            vc.dismiss(animated: true, completion: nil)
        }
        
        if let destinationViewController = segue.destination as? MMUserSettingsViewController {
            destinationViewController.transitioningDelegate = self
        }
    }

}

extension ViewController : TimerControllerDataSource {
    func timerText(_ text: String) {
        self.buttonStartTimerOutlet.setTitle(text, for: UIControlState())
    }
}



