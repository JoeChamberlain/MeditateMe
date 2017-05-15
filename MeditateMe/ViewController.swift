//
//  ViewController.swift
//  MeditateMe
//
//  Created by Joseph Chamberlain on 4/28/16.
//  Copyright © 2016 Joseph Chamberlain. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIViewControllerTransitioningDelegate {
    
    @IBOutlet weak var buttonStartTimerOutlet: UIButton!
    @IBOutlet weak var settingsButton: UIButton!
    
    let timerController = MMButtonStartTimerController()
    var shouldResetTimer = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Settings button set to Unicode character for cog "image"
        settingsButton.setTitle(NSString(string: "\u{2699}") as String, for: UIControlState())
        
        timerController.timerControllerDataSource = self
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destinationViewController = segue.destination as? MMUserSettingsViewController {
            destinationViewController.transitioningDelegate = self
        }
    }
    
    @IBAction func startButtonTapped(_ sender: AnyObject) {
        timerController.MainTimerTapped()
    }

    @IBAction func startButtonLongPress(_ sender: AnyObject) {
        timerController.ResetTimer()
    }
}

extension ViewController : TimerControllerDataSource {
    func timerText(_ text: String) {
        self.buttonStartTimerOutlet.setTitle(text, for: UIControlState())
    }
}



