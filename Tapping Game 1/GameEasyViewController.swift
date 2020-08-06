//
//  GameEasyViewController.swift
//  Tapping Game 1
//
//  Created by Eshaan Gandhi on 8/4/20.
//  Copyright © 2020 Emily. All rights reserved.
//

import UIKit

class GameEasyViewController: UIViewController {
    
    @IBOutlet weak var easyScoreLabel: UILabel!
    @IBOutlet weak var easyTimeLabel: UILabel!
    var timer = Timer()
    var timerRunning = false
    var seconds = 30
    var tapInt = 1
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func startTimer() {
        timerRunning = true
        timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { timer in
            self.easyTimeLabel.text = String(self.seconds)
            self.seconds -= 1
            if self.seconds == -1 {
                self.timer.invalidate()
                self.timerRunning = false
                self.displayAlert(message: "Game Over")
            }
        }
    }
    
    func resetGame(){
        easyScoreLabel.text = ""
        easyTimeLabel.text = ""
        seconds = 30
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
        self.easyScoreLabel.text = String(self.tapInt)
        self.tapInt += 1
        if !timerRunning {
            startTimer()
        }
    }
}
