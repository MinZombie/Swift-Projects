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
    
    @IBOutlet weak var tablewView: UITableView!
    
    var timer = Timer()
    var subTimer = Timer()
    var count: Double = 0
    var subCount: Double = 0
    var isRunning = false
    
    var record: [String] = []
    
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
            
            timer = Timer.scheduledTimer(timeInterval: 0.035, target: self, selector: #selector(mainTimerFire), userInfo: nil, repeats: true)
            subTimer = Timer.scheduledTimer(timeInterval: 0.035, target: self, selector: #selector(subTimerFire), userInfo: nil, repeats: true)
            
            
        } else {
            
            isRunning = false
            
            startStopButton.setTitle("Start", for: .normal)
            startStopButton.setTitleColor(UIColor.green, for: .normal)
            
            lapResetButton.setTitle("Reset", for: .normal)
            
            timer.invalidate()
            subTimer.invalidate()
            
        }
    }
    
    @IBAction func lapResetTapped(_ sender: Any) {
        if isRunning {
            
            subCount = 0
            
            record.insert(subTime.text ?? "", at: 0)
            // 리로드 말고 다른 방법은 없는가?
            tablewView.reloadData()
            
        } else {
            count = 0
            mainTime.text = "00:00,00"
            subTime.text = "00:00,00"
            timer.invalidate()
        }
    }
    // 코드를 줄이는 방법은?
    @objc func mainTimerFire() {
        count += 0.035
        
        let time = countConvert(count)
        let timeString = timerToString(minutes: time.0, seconds: time.1, ms: time.2)
        
        mainTime.text = timeString
    }
    
    @objc func subTimerFire() {
        subCount += 0.035
        
        let time = countConvert(subCount)
        let timeString = timerToString(minutes: time.0, seconds: time.1, ms: time.2)
        
        subTime.text = timeString
    }
    
    func countConvert(_ count: Double) -> (Int, Int, Int) {
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
        string += ":"
        if seconds < 10 {
            string += "0\(String(seconds))"
        } else {
            string += String(seconds)
        }
        string += ","
        if ms < 10 {
            string += "0\(String(ms))"
        } else {
            string += String(ms)
        }

        return string
    }
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return record.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let target = record[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = target
        return cell
    }
}
