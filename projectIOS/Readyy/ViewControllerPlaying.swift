//
//  ViewControllerPlaying.swift
//  Readyy
//
//  Created by Milk on 9/10/2562 BE.
//  Copyright © 2562 Ratsuda Suwan. All rights reserved.
//

import UIKit
import AVKit
class ViewControllerPlaying: UIViewController {
    var dictionary = choices.getDictionary()
    var buttonNext = true
    var buttonchoices1 = false
    var buttonchoices2 = false
    var buttonchoices3 = false
    var buttonchoices4 = false
    var high = 0
    var AudioPlayer = AVAudioPlayer()
    
   
    @IBOutlet weak var highScore: UILabel!
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var score: UILabel!
    @IBOutlet weak var choices1Button: UIButton!
    @IBOutlet weak var choices4Button: UIButton!
    @IBOutlet weak var choices3Button: UIButton!
    @IBOutlet weak var choices2Button: UIButton!
    
    @IBOutlet weak var timeLabel: UILabel!
    var timer = Timer()
    var isTimeRuning = false
    var seconds = 30
    
    func runTimer() {
        timer = Timer.scheduledTimer(timeInterval: 1, target: self,   selector: (#selector(self.updateTimer)), userInfo: nil, repeats: true)
    }
    @objc func updateTimer() {
        if (seconds != 0){
            seconds -= 1     //This will decrement(count down)the seconds.
            timeLabel.text = "\(seconds)" //This will update the label.
            musicPlayer.play()
            
        }else if (seconds == 0){
            if (high < Int(score.text!)!){
                gamer.setHighScoreByNameUser(user: user, score: score.text!, highScore: score.text!)
            }else if (high >= Int(score.text!)!){
                 gamer.setHighScoreByNameUser(user: user, score: score.text!, highScore: highScore.text!)
            }
            performSegue(withIdentifier: "pageTimeOut", sender: self)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        runTimer()
        
        dictionary = choices.getDictionary()
        buttonchoices1 = true
        ready()
        question.getDictionary()
        choices.getDictionary()
        questionLabel.lineBreakMode = .byWordWrapping
        questionLabel.numberOfLines = 0;
        
       
        
    }
    @IBAction func setchoices1(_ sender: Any) {
        buttonchoices1 = true
        let choicesTitle = (sender as AnyObject).title(for: .normal)!
        let totalScore  = question.getScore(qu: questionLabel.text!, ans: choicesTitle)+Int(score.text!)!
        
        if (question.getScore(qu: questionLabel.text!, ans: choicesTitle ) == 1){
            score.backgroundColor = UIColor.green
        }else{
            score.backgroundColor = UIColor.red
        }
       if (question.getScore(qu: questionLabel.text!, ans: choicesTitle) == 0){
            if (totalScore > high){
                high = totalScore
            }
            self.highScore.text = "\(high)"
            self.score.text = "\(0)"
        
       }else{
        
            self.score.text = "\(totalScore)"
        }
       
        
        ready()
    }
  
   
    @IBAction func setChoices2(_ sender: Any) {
        buttonchoices2 = true
        let choicesTitle = (sender as AnyObject).title(for: .normal)!
        let totalScore  = question.getScore(qu: questionLabel.text!, ans: choicesTitle)+Int(score.text!)!
        if (question.getScore(qu: questionLabel.text!, ans: choicesTitle ) == 1){
            score.backgroundColor = UIColor.green
        }else{
            score.backgroundColor = UIColor.red
        }
        if (question.getScore(qu: questionLabel.text!, ans: choicesTitle) == 0){
            if (totalScore > high){
                high = totalScore
            }
            self.highScore.text = "\(high)"
            self.score.text = "\(0)"
            
        }else{
            
            self.score.text = "\(totalScore)"
        }
        
        ready()
    }
    
    @IBAction func setChoices3(_ sender: Any) {
        buttonchoices3 = true
        let choicesTitle = (sender as AnyObject).title(for: .normal)!
        let totalScore  = question.getScore(qu: questionLabel.text!, ans: choicesTitle)+Int(score.text!)!
        if (question.getScore(qu: questionLabel.text!, ans: choicesTitle ) == 1){
            score.backgroundColor = UIColor.green
        }else{
            score.backgroundColor = UIColor.red
        }
        if (question.getScore(qu: questionLabel.text!, ans: choicesTitle) == 0){
            if (totalScore > high){
                high = totalScore
            }
            self.highScore.text = "\(high)"
            self.score.text = "\(0)"
            
        }else{
            
            self.score.text = "\(totalScore)"
        }
        ready()
    }
    @IBAction func setChoices4(_ sender: Any) {
        buttonchoices4 = true
        let choicesTitle = (sender as AnyObject).title(for: .normal)!
        let totalScore  = question.getScore(qu: questionLabel.text!, ans: choicesTitle)+Int(score.text!)!
        if (question.getScore(qu: questionLabel.text!, ans: choicesTitle ) == 1){
            score.backgroundColor = UIColor.green
        }else{
            score.backgroundColor = UIColor.red
        }
        if (question.getScore(qu: questionLabel.text!, ans: choicesTitle) == 0){
            if (totalScore > high){
                high = totalScore
            }
            self.highScore.text = "\(high)"
            self.score.text = "\(0)"
            
        }else{
            
            self.score.text = "\(totalScore)"
        }
        ready()
    }
    
    

    @IBAction func setButton(_ sender: Any) {
        buttonNext = true
        ready()
        
    }
    // ลูปคำถามและคำตอบถ้ามีการกดเลือกจะเปลี่ยนตัวถาม 
    func ready () {
       
        while (dictionary.count != 0 && buttonchoices1 == true || buttonchoices2 == true || buttonchoices3 == true || buttonchoices4 == true ){
           buttonchoices1 = false
            buttonchoices2 = false
            buttonchoices3 = false
            buttonchoices4 = false
            var room = gamer.getRoomIdByNameUser(user: user)
            
            var array = [String]()
            var id = accessToDictionary(dict: dictionary)
            self.questionLabel.text = question.getNameIndex(id: id)
            
            for (key , value) in dictionary {
                if (key == id){
                    for (v) in value{
                        array.append(v)
                    }
                }
            }
            
            //dictionary[id] = nil
            
            if (array.count == 4){
                var choices1 = array[0]
                var choices2 = array[1]
                var choices3 = array[2]
                var choices4 = array[3]
                choices1Button.setTitle("\(choices1)", for: .normal)
                choices2Button.setTitle("\(choices2)", for: .normal)
                choices3Button.setTitle("\(choices3)", for: .normal)
                choices4Button.setTitle("\(choices4)", for: .normal)
            }
            dictionary[id] = nil
        }
        
            
        
    }
        
    
    func accessToDictionary(dict:[String:Array<String>]) -> String {
        var keyQuestion = ""
        for (key,value) in dict{
            keyQuestion = key
            break
        }
        return keyQuestion
    }
}

