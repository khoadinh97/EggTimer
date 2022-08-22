//
//  ViewController.swift
//  EggTimer
//
//  Created by Angela Yu on 08/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    let eggTimes = ["Soft": 3, "Medium": 6, "Hard": 12]
    var timer = Timer()
    var secondRemaining = 60
    var progressBarTimer: Timer!
    var eggTime = 0
    
    @IBOutlet weak var titleLable: UILabel!
    @IBOutlet weak var progressView: UIProgressView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    
    
    @IBAction func buttonPressed(_ sender: UIButton) {
        timer.invalidate()
        let hardness = sender.currentTitle!
        progressView.progress = 0
        secondRemaining = eggTimes[hardness]!
        eggTime = eggTimes[hardness]!
        titleLable.text = sender.currentTitle!
       timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateCounter), userInfo: nil, repeats: true)
        self.progressBarTimer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(ViewController.updateProgressView), userInfo: nil, repeats: true)

    }
    
    @objc func updateCounter() {
        //example functionality
        if secondRemaining > 0 {
            print("\(secondRemaining) seconds to the end of the world")
            secondRemaining -= 1
           
            
        }
        else{
            
            timer.invalidate()
            
           
        }
    }
    @objc func updateProgressView(){
           progressView.progress += Float(1/Double(eggTime))
       
           progressView.setProgress(progressView.progress, animated: true)
           if(progressView.progress == 1.0)
           {
               titleLable.text = "Done"
               progressBarTimer.invalidate()
               print("stop")
           }else{
               print("run")
           }
        

}
}
