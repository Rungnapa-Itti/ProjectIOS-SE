//
//  ViewControllerWait.swift
//  Readyy
//
//  Created by Milk on 8/10/2562 BE.
//  Copyright © 2562 Ratsuda Suwan. All rights reserved.
//

import UIKit

class ViewControllerWait: UIViewController {
    
 
    @IBOutlet weak var pinRoom: UILabel!
    @IBOutlet weak var nameKey: UILabel!
    @IBOutlet weak var numOfPlayers: UILabel!
    @IBOutlet weak var showNamePlayers: UITextView!
    
    
    
    override func viewDidLoad() {
        
       
        super.viewDidLoad()
        viewController.getGamer()
        
        print(gamer.getDictionaryGamer())
        pinRoom.text = gamer.getRoomIdByNameUser(user: user)
        nameKey.text = gamer.getHandByIdRoom(id: pinRoom.text!)
        
        getQuestion()
        numOfPlayers.text = String(arrayShowNamePlayers(dict: gamer.getDictionaryGamer()).count)
        showName()
            
        
        
}
    
    @IBAction func Back(_ sender: Any) {
        gamer.setRoomDictionary(name: gamer.getName(), value: "lobby", index: 3)
        gamer.setRoomDictionary(name: gamer.getName(), value: "-", index: 4)
        gamer.setStatus(status: "lobby")
        gamer.setRoomId(roomId: "-")
        viewControllerRoom.postJSON(url: "http://10.2.3.241:8081/gamer",jsonBody: gamer.getJSON())
    }
    
    @IBAction func Playing(_ sender: Any) {
        //getChoies()
        //getQuestion()
    }
    
    
    func getQuestion()  {
        let url = URL(string: "http://10.2.3.241:8081/question")!
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
            if let error = error {
                print("error: \(error)")
            } else {
                if let response = response as? HTTPURLResponse {
                    //print("statusCode: \(response.statusCode)")
                }
                if let data = data, let dataString = String(data: data, encoding: .utf8) {
                    
                    question.questionJSON(json: dataString)
                    //self.setQuestion(q: self.question);
                    //print("dataQuestion: \(dataString)")
                }
            }
        }
        task.resume()
        getChoies()
        
    }
    func getChoies() {
        
        let url = URL(string: "http://10.2.3.241:8081/choices")!
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
            if let error = error {
                print("error: \(error)")
            } else {
                if let response = response as? HTTPURLResponse {
                    //print("statusCode: \(response.statusCode)")
                }
                if let data = data, let dataString = String(data: data, encoding: .utf8) {
                    
                    choices.choicesJSON(text: dataString)
                    //self.setChoices(ch:self.choices)
                    //print("dataChoices: \(dataString)")
                }
            }
        }
        task.resume()
        
    }
    
    
    func arrayShowNamePlayers(dict:[String:Array<String>]) ->Array<String> {
        var name = ""
        var array = [String]()
        var room = gamer.getRoomIdByNameUser(user: user)
        for (key,value) in dict {
            if (value[3] == room){
                array.append(value[0])
            }
        }
        //print("ArrayName: \(array)")
        return array
       
    }
    
    func showName() -> String{
        var keep = ""
        
            viewController.getGamer()
            var array = arrayShowNamePlayers(dict: gamer.getDictionaryGamer())
            var i = ""
            
            
            for i in array {
                keep.append(i)
                keep.append("\n")
                showNamePlayers.text = keep
                // print(keep)
            
            }
       
            
        
        return keep
    }

}
    
    
        
        
        /*
         // MARK: - Navigation
         
         // In a storyboard-based application, you will often want to do a little preparation before navigation
         override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
         // Get the new view controller using segue.destination.
         // Pass the selected object to the new view controller.
         }
         */
        
    

    

    
    


