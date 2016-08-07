//
//  MMUserSettingsViewControllerContainer.swift
//  MeditateMe
//
//  Created by Joseph Chamberlain on 6/25/16.
//  Copyright © 2016 Joseph Chamberlain. All rights reserved.
//

import UIKit

class MMUserSettingsViewControllerContainer: UIViewController {
    
    //Dismiss settings X
    @IBAction func DismissUserSettingsButton(sender: AnyObject) {
        dismissViewControllerAnimated(true, completion: nil)
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
}
