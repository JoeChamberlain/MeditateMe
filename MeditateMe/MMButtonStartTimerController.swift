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
        
        if(startTimerPressed && !startTimerPaused) {
            startTimerPaused = true
            PauseTimer()
        }
        else if(startTimerPressed && startTimerPaused) {
            startTimerPaused = false
            
            startTimer = NSTimer.scheduledTimerWithTimeInterval(1.0, target: self, selector: #selector(MMButtonStartTimerController.CountUp), userInfo: nil, repeats: true)
        }
        else if(!startTimerPressed && !startTimerPaused) {
            startTimerPressed = true
            startTimer = NSTimer.scheduledTimerWithTimeInterval(1.0, target: self, selector: #selector(MMButtonStartTimerController.CountUp), userInfo: nil, repeats: true)
        }
        
    }
    
    func CountUp() {
        startTimerCounter += 1
        if let dataSource = timerControllerDataSource {
            dataSource.timerText("\(startTimerCounter)")
        }
    }
    
    func PauseTimer() {
        startTimer.invalidate()
    }
    
    func ResetTimer() {
        startTimer.invalidate()
        
        startTimerCounter = 0
        startTimerPressed = false
        startTimerPaused = false
        
        if let dataSource = timerControllerDataSource {
            dataSource.timerText("\(startTimerResetText)")
        }
    }
}
