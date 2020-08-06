//
//  ViewController.swift
//  Tapping Game 1
//
//  Created by Emily on 8/4/20.
//  Copyright © 2020 Emily. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    var musicEffect: AVAudioPlayer = AVAudioPlayer()

    override func viewDidLoad() {
        super.viewDidLoad()
       let musicFile = Bundle.main.path(forResource: "pixelMusic", ofType: ".mp3")
       do {
           try musicEffect = AVAudioPlayer(contentsOf: URL (fileURLWithPath: musicFile!))
       }
       catch{
           print (error)
       }
    }
    @IBAction func playMusic(_ sender: Any) {
        musicEffect.play()
    }
    @IBAction func musicOff(_ sender: Any) {
        musicEffect.stop()
    }
    
    
    

}

