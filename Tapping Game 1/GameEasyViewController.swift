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
    var seconds = 30
    var tapInt = 1
    
    
    
        override func viewDidLoad() {
        super.viewDidLoad()
            startTimer()
    }
    
    func startTimer() {
        let timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { timer in
            self.easyTimeLabel.text = String(self.seconds)
            self.seconds -= 1
            if self.seconds == -1 {
                timer.invalidate()
                
            }
        }
    
    }
    @IBAction func tapScore(_ sender: Any) {
        self.easyScoreLabel.text = String(self.tapInt)
        self.tapInt += 1
    }
    

}
