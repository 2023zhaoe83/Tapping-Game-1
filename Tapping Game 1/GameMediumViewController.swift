//
//  GameMediumViewController.swift
//  Tapping Game 1
//
//  Created by Eshaan Gandhi on 8/4/20.
//  Copyright © 2020 Emily. All rights reserved.
//

import UIKit

class GameMediumViewController: UIViewController {
    
    @IBOutlet weak var mediumScoreLabel: UILabel!
    @IBOutlet weak var mediumTimeLabel: UILabel!
    var timer = Timer()
    var timerRunning = false
    var seconds = 20
    var tapInt = 1
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func startTimer() {
        timerRunning = true
        timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { timer in
            self.mediumTimeLabel.text = String(self.seconds)
            self.seconds -= 1
            if self.seconds == -1 {
                self.timer.invalidate()
                self.timerRunning = false
                self.displayAlert(message: "Game Over")
            }
        }
    }
    
    func resetGame(){
        mediumScoreLabel.text = ""
        mediumTimeLabel.text = ""
        seconds = 20
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
        self.mediumScoreLabel.text = String(self.tapInt)
        self.tapInt += 1
        if !timerRunning {
            startTimer()
        }
    }
}
