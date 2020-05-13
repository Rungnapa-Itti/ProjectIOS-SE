//
//  MusicPlayer .swift
//  Readyy
//
//  Created by Milk on 25/11/2562 BE.
//  Copyright © 2562 Ratsuda Suwan. All rights reserved.
//

import Foundation
import AVFoundation
class MusicPlayer {
    var audioPlayer = AVAudioPlayer()
    
    func play(){
        let path = Bundle.main.path(forResource: "when.mp3", ofType:nil)!
        let url = URL(fileURLWithPath: path)
    
        do {
            audioPlayer = try AVAudioPlayer(contentsOf: url)
            audioPlayer.play()
        } catch {
        // couldn't load file :(
        }
    }

    
}
