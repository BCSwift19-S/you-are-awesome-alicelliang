//
//  ViewController.swift
//  You Are Awesome!
//
//  Created by Alice Liang on 1/13/19.
//  Copyright © 2019 Alice Liang. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    @IBOutlet weak var awesomeImageView: UIImageView!
    @IBOutlet weak var messageLabel: UILabel!
    var awesomePlayer = AVAudioPlayer()
    var index = -1
    var imageIndex = -1
    var soundIndex = -1
    let numberOfImages = 10
    let numberOfSounds = 6
        
    // Code below executes when the app's view first loads
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func nonRepeatingRandom(lastNumber: Int, maxValue: Int) ->Int {
        var newIndex: Int // or var newIndex = -1
        repeat{
            newIndex = Int.random(in: 0..<maxValue)
        } while lastNumber == newIndex
        return newIndex
    }
    
    func playSound(soundName: String, audioPlayer: inout AVAudioPlayer) {
        //        Can we load in the file soundName?
        if let sound = NSDataAsset(name: soundName){
            // check if sound.data is a sound file
            do{
                try audioPlayer = AVAudioPlayer(data: sound.data)
                audioPlayer.play()
            } catch {
                // if sound.data is not a valid audio file
                print("ERROR: file \(soundName) couldn't be played as a sound.")
            }
        } else {
            // if reading in the NSDataAsset didn't work, tell the developer / report the error
            print("ERROR: file \(soundName) didn't load.")
        }
    }
    
    @IBAction func showMessagePressed(_ sender: UIButton) {
        
        let messages = ["You Are Awesome!",
                "You Are Great!",
                "You Are Fantastic!",
                "Why can't tomorrow be the weekend???",
                "You Brighten my day!",
                "college is fun!",
                "You Are da Bomb!",
                "Hey, fabulous!"]
        
//        Show a message
        index = nonRepeatingRandom(lastNumber: index, maxValue: messages.count)
        messageLabel.text = messages[index]
        
//          Show an image
        imageIndex = nonRepeatingRandom(lastNumber: imageIndex, maxValue: numberOfImages)
        awesomeImageView.image = UIImage(named: "image\(imageIndex)")
        
//        Get a random number to use in our soundName file
        soundIndex = nonRepeatingRandom(lastNumber: soundIndex, maxValue: numberOfSounds)
        
//        Play a sound
        let soundName = "sound\(soundIndex)"
        playSound(soundName: soundName, audioPlayer: &awesomePlayer)
    }
    
}

