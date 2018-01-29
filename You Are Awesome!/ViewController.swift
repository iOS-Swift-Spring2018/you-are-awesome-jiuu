//
//  ViewController.swift
//  You Are Awesome!
//
//  Created by Brian Wang on 1/28/18.
//  Copyright © 2018 Ji Woo Pak. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    @IBOutlet weak var awesomeImage: UIImageView!
    @IBOutlet weak var messageLabel: UILabel!
    var awesomePlayer = AVAudioPlayer()
    var index = -1
    var imageNumber = -1
    var soundNumber = -1
    var numberOfImages = 2
    var numberOfSounds = 2
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    @IBAction func messageButtonPressed(_ sender: UIButton) {
        let messages = ["You Are Fantastic!",
                        "You Are Great!",
                        "You Are Amazing!",
                        "When the Genius Bar needs help, they call you!",
                        "You Brighten My Day!",
                        "You Are Da Bomb!",
                        "I can't wait to use your app!"]
        var newIndex = -1
        repeat {
            newIndex = Int(arc4random_uniform(UInt32(messages.count)))
        }while index == newIndex
        index = newIndex
        messageLabel.text = messages[newIndex]
        
        awesomeImage.isHidden = false
        repeat {
            newIndex = Int(arc4random_uniform(UInt32(numberOfImages)))
            
        } while imageNumber == newIndex
        
        imageNumber = newIndex
        awesomeImage.image = UIImage(named: "image\(imageNumber)")
        
        repeat {
            newIndex = Int(arc4random_uniform(UInt32(numberOfSounds)))
        } while soundNumber == newIndex
        
        soundNumber = newIndex
        
        var soundName = "sound\(soundNumber)"
        
        if let sound = NSDataAsset(name: soundName) {
            do {
                try awesomePlayer = AVAudioPlayer(data: sound.data)
                awesomePlayer.play()
            } catch {
                print("ERROR: \(soundName)")
            }
        } else {
            print("ERROR: file \(soundName) didn't load")
        }
    }
    
    
    


}

