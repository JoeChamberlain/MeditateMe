//
//  MMButtonStartTimerController.swift
//  MeditateMe
//
//  Created by Joseph Chamberlain on 4/30/16.
//  Copyright © 2016 Joseph Chamberlain. All rights reserved.
//

import UIKit

protocol TimerControllerDataSource {
    func timerText(_ text:String)
}

class MMButtonStartTimerController: NSObject {
    let startTimerResetText = "Start"
    
    var defaultMediTimer = 0
    var defaultPrepTimer = 0
    var startTimerCounter = 0
    var startTimerPressed = false
    var startTimerPaused = false
    var prepTimerFinished = false
    var startTimer = Timer()
    
    var timerControllerDataSource: TimerControllerDataSource?
    
    func MainTimerTapped(prepTimerDefault: Int, mediTimerDefault: Int) {
        defaultMediTimer = mediTimerDefault
        defaultPrepTimer = prepTimerDefault
        
        TimerStateController()
    }
    
    func TimerStateController() {
        //If the timer is pressed and not already paused, pause it.
        if(startTimerPressed && !startTimerPaused) {
            startTimerPaused = true
            PauseTimer()
        }
            //If the timer is pressed and paused, unpause it.
        else if(startTimerPressed && startTimerPaused) {
            startTimerPaused = false
            
            startTimer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(MMButtonStartTimerController.CountDown), userInfo: nil, repeats: true)
        }
            //If the timer is not pressed and not paused then count down one second.
        else if(!startTimerPressed && !startTimerPaused) {
            startTimerPressed = true
            startTimer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(MMButtonStartTimerController.CountDown), userInfo: nil, repeats: true)
        }
    }
    
    func CountDown() {
        //Decrement timer by one second.
        startTimerCounter -= 1
        
        if let dataSource = timerControllerDataSource {
            dataSource.timerText("\(startTimerCounter)")
        }
        
        //Reset the timer when it reaches zero.
        if (startTimerCounter == 0 && !prepTimerFinished) {
            prepTimerFinished = !prepTimerFinished
            ResetTimer()
        }
        else if (startTimerCounter == 0 && prepTimerFinished) {
            prepTimerFinished = false
            ResetTimer()
        }
    }
    
    func PauseTimer() {
        //Invalidating a timer pauses it.
        startTimer.invalidate()
    }
    
    func ResetTimer() {
        startTimer.invalidate()
        
        if(prepTimerFinished) {
            startTimerCounter = defaultMediTimer
            CountDown()
        }
        
        startTimerCounter = defaultPrepTimer
        startTimerPressed = false
        startTimerPaused = false
        
        if let dataSource = timerControllerDataSource {
            dataSource.timerText("\(startTimerResetText)")
        }
    }
    
    
}
