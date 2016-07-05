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
        settingsButton.setTitle(NSString(string: "\u{2699}") as String, forState: UIControlState.Normal)
        timerController.timerControllerDataSource = self
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if let destinationViewController = segue.destinationViewController as? MMUserSettingsViewController {
            destinationViewController.transitioningDelegate = self
        }
    }
    
    @IBAction func startButtonTapped(sender: AnyObject) {
        timerController.MainTimerTapped()
    }

    @IBAction func startButtonLongPress(sender: AnyObject) {
        timerController.ResetTimer()
    }
}

extension ViewController : TimerControllerDataSource {
    func timerText(text: String) {
        self.buttonStartTimerOutlet.setTitle(text, forState: .Normal)
    }
}



