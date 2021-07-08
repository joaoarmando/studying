//
//  ViewController.swift
//  EggTimer
//
//  Created by Angela Yu on 08/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    let eggTimes = [ "Soft":300, "Medium": 420, "Hard": 720 ]
    
    var totalTime = 60
    var secondsPassed = 0
    
    var timer = Timer()
    
    var player: AVAudioPlayer!
    
    @IBOutlet weak var eggStatusTitle: UILabel!
    
    @IBOutlet weak var timeProgressView: UIProgressView!
    
    @IBAction func hardnessSelected(_ sender: UIButton) {
        timer.invalidate();
        
        let hardness = sender.currentTitle!
        
        totalTime = eggTimes[hardness]!
        
            
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
    }
    
    
    @objc func updateTimer() {
        if (secondsPassed < totalTime ) {
            secondsPassed += 1
            
            let percentageProgress = Float(secondsPassed) / Float(totalTime)
            timeProgressView.progress = Float(percentageProgress)
            
        }
        else {
            timeProgressView.progress = 0.0
            timer.invalidate()
            eggStatusTitle.text = "Done!"
            
            let url = Bundle.main.url(forResource: "alarm_sound", withExtension: "mp3")
            player = try! AVAudioPlayer(contentsOf: url!)
            player.play()
            
        }
    }
    
}
