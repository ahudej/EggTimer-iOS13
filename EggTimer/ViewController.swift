//
//  ViewController.swift
//  EggTimer
//
//  Created by Angela Yu on 08/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let softTime = 5
    let mediumTime = 7
    let hardTime = 12
    var cntTimer: Int = 0
    var TimerEgg: Timer?
    var maxTime: Int = 0

    @IBOutlet weak var LblMessage: UILabel!
    @IBOutlet weak var PgvTimer: UIProgressView!
    
    //Dictionary
    var eggTimes : [String : Int] = ["Soft": 5, "Medium": 7]
    
    @IBAction func hardnessSelected(_ sender: UIButton) {
        let hardness = sender.currentTitle!
        
        stopTimer()
        TimerEgg = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateCounter), userInfo: nil, repeats: true)

        /*
        if hardness == "Soft" {
            print(softTime)
        }else if hardness == "Medium" {
            print(mediumTime)
        }else if hardness == "Hard" {
            print(hardTime)
        }
         */
 
        /* Switch Statement
         
        switch hardness {
        case "Soft":
            print(softTime)
        case "Medium":
            print(mediumTime)
        case "Hard":
            print(hardTime)
        default:
            print("Error")
        }
         */
        
        //--------------- Dictionaries -----------------
        // Hinzufügen zu einem Dictionary
        eggTimes["Hard"] = 10
        
        // Bearbeiten eines Eintrag
        eggTimes["Hard"] = 12
        
        maxTime = eggTimes[hardness]! * 60
    }
    
    @objc func updateCounter() {
        if cntTimer < maxTime {
            
            PgvTimer.progress = calculateProgress(time: cntTimer, maxTime: maxTime)
            LblMessage.text = "\(cntTimer) seconds."
            cntTimer += 1
        }else{
        LblMessage.text = "Done"
            TimerEgg?.invalidate()
        }
    }
    
    func stopTimer(){
        TimerEgg?.invalidate()
        TimerEgg = nil
        
    }
    
    func calculateProgress(time: Int, maxTime: Int) -> Float{
        
        let progress:Float = ((100 * Float(time))/Float(maxTime))/100
        return progress
    }
    

}
