//
//  ViewController.swift
//  Project 02 - Stopwatch
//
//  Created by meister on 2021/05/01.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var mainTime: UILabel!
    @IBOutlet weak var subTime: UILabel!
    
    @IBOutlet weak var startStopButton: UIButton!
    @IBOutlet weak var lapResetButton: UIButton!
    
    var timer = Timer()
    var count: Double = 0
    var isRunning = false
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        startStopButton.setTitleColor(UIColor.green, for: .normal)
    }
    
    @IBAction func startStopTapped(_ sender: Any) {
        
        if !isRunning {
                
            isRunning = true
            startStopButton.setTitle("Stop", for: .normal)
            startStopButton.setTitleColor(UIColor.red, for: .normal)
            
            lapResetButton.setTitle("Lap", for: .normal)
            
            timer = Timer.scheduledTimer(timeInterval: 0.035, target: self, selector: #selector(fire), userInfo: nil, repeats: true)
            
            
        } else {
            
            isRunning = false
            
            startStopButton.setTitle("Start", for: .normal)
            startStopButton.setTitleColor(UIColor.green, for: .normal)
            
            lapResetButton.setTitle("Reset", for: .normal)
            
            timer.invalidate()
            
        }
    }
    
    @IBAction func lapResetTapped(_ sender: Any) {
        if isRunning {
            // Lap
            print("Lap")
        } else {
            count = 0
            mainTime.text = "00 : 00 , 00"
            timer.invalidate()
        }
    }
    
    @objc func fire() {
        count += 0.035
        
        let time = millisecondsConvert(count)
        let timeString = timerToString(minutes: time.0, seconds: time.1, ms: time.2)
        
        mainTime.text = timeString
        
    }
    
    func millisecondsConvert(_ count: Double) -> (Int, Int, Int) {
        let ms = Int(floor(count * 100).truncatingRemainder(dividingBy: 100))
        let seconds = Int(floor(count).truncatingRemainder(dividingBy: 60))
        let minutes = Int(floor(count) / 60)
        
        return (minutes, seconds, ms)
    }
    
    func timerToString(minutes: Int, seconds: Int, ms: Int) -> String {
        var string = ""
        if minutes < 10 {
            string += "0\(String(minutes))"
        } else {
            string += String(minutes)
        }
        string += " : "
        if seconds < 10 {
            string += "0\(String(seconds))"
        } else {
            string += String(seconds)
        }
        string += " , "
        if ms < 10 {
            string += "0\(String(ms))"
        } else {
            string += String(ms)
        }

        return string
    }
}

