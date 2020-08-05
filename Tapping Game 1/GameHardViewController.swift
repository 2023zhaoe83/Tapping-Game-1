//
//  GameHardViewController.swift
//  Tapping Game 1
//
//  Created by Eshaan Gandhi on 8/4/20.
//  Copyright © 2020 Emily. All rights reserved.
//

import UIKit

class GameHardViewController: UIViewController {
    
    @IBOutlet weak var hardScoreLabel: UILabel!
    @IBOutlet weak var hardTimeLabel: UILabel!
    var timer = Timer()
    var timerRunning = false
    var seconds = 10
    var tapInt = 1
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func startTimer() {
        timerRunning = true
        timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { timer in
            self.hardTimeLabel.text = String(self.seconds)
            self.seconds -= 1
            if self.seconds == -1 {
                self.timer.invalidate()
                self.timerRunning = false
                self.displayAlert(message: "Game Over")
            }
        }
    }
    
    func resetGame(){
        hardScoreLabel.text = ""
        hardTimeLabel.text = ""
        seconds = 10
        tapInt = 1
    }
    
    func displayAlert(message: String){
        let alert = UIAlertController(title: message, message: nil, preferredStyle: .alert)
        let alertAction = UIAlertAction(title: "Game Over!", style: .default){
            (action) in self.resetGame()
        }
        alert.addAction(alertAction)
        present(alert, animated: true, completion: nil)
    }
    
    @IBAction func tapScore(_ sender: Any) {
        self.hardScoreLabel.text = String(self.tapInt)
        self.tapInt += 1
        if !timerRunning {
            startTimer()
        }
    }
}



