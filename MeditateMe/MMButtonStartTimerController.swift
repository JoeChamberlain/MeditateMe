//
//  MMButtonStartTimerController.swift
//  MeditateMe
//
//  Created by Joseph Chamberlain on 4/30/16.
//  Copyright © 2016 Joseph Chamberlain. All rights reserved.
//

import UIKit

protocol TimerControllerDataSource {
    func timerText(text:String)
}

class MMButtonStartTimerController: NSObject {
    
    var startTimerCounter = 0
    let startTimerResetText = "Start"
    var startTimerPressed = false
    var startTimerPaused = false
    var startTimer = NSTimer()
    
    var timerControllerDataSource: TimerControllerDataSource?
    
    func MainTimerTapped() {
        
        //If the timer is pressed and not already paused, pause it.
        if(startTimerPressed && !startTimerPaused) {
            startTimerPaused = true
            PauseTimer()
        }
        //If the timer is pressed and paused, unpause it.
        else if(startTimerPressed && startTimerPaused) {
            startTimerPaused = false
            
            startTimer = NSTimer.scheduledTimerWithTimeInterval(1.0, target: self, selector: #selector(MMButtonStartTimerController.CountDown), userInfo: nil, repeats: true)
        }
        //If the timer is not pressed and not paused then count down one second.
        else if(!startTimerPressed && !startTimerPaused) {
            startTimerPressed = true
            startTimer = NSTimer.scheduledTimerWithTimeInterval(1.0, target: self, selector: #selector(MMButtonStartTimerController.CountDown), userInfo: nil, repeats: true)
        }
        
    }
    
    func CountDown() {
        //Decrement timer by one second.
        startTimerCounter -= 1
        
        if let dataSource = timerControllerDataSource {
            dataSource.timerText("\(startTimerCounter)")
        }
        
        //Reset the timer when it reaches zero.
        if startTimerCounter == 0 {
            ResetTimer()
        }
    }
    
    func PauseTimer() {
        //Invalidating a timer pauses it.
        startTimer.invalidate()
    }
    
    func ResetTimer() {
        startTimer.invalidate()
        
        startTimerCounter = 10
        startTimerPressed = false
        startTimerPaused = false
        
        if let dataSource = timerControllerDataSource {
            dataSource.timerText("\(startTimerResetText)")
        }
    }
    
    
}
