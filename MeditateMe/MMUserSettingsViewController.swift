//
//  MMUserSettingsViewController.swift
//  MeditateMe
//
//  Created by Joseph Chamberlain on 5/1/16.
//  Copyright © 2016 Joseph Chamberlain. All rights reserved.
//

import UIKit



class MMUserSettingsViewController: UIViewController {
    
    @IBAction func SwipeUserSettingsClosed(sender: UISwipeGestureRecognizer) {
        self.dismissViewControllerAnimated(false, completion: nil)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.clearColor()
        view.opaque = false
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