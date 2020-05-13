//
//  ViewControllerTimeOut.swift
//  Readyy
//
//  Created by Milk on 24/11/2562 BE.
//  Copyright © 2562 Ratsuda Suwan. All rights reserved.
//

import UIKit

class ViewControllerTimeOut: UIViewController {

    @IBOutlet weak var yourScore: UILabel!
    @IBOutlet weak var highScore: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        yourScore.text! = gamer.getAllScoreByNameUser(name: user)
        highScore.text! = gamer.getHighScoreByNameUser(name: user)
        // Do any additional setup after loading the view.
    }
    
    @IBAction func Back(_ sender: Any) {
       gamer.setRoomDictionary(name: gamer.getName(), value: "lobby", index: 3)
        gamer.setRoomDictionary(name: gamer.getName(), value: "-", index: 4)
        gamer.setStatus(status: "lobby")
        gamer.setRoomId(roomId: "-")
        viewControllerRoom.postJSON(url: "http://10.2.3.241:8081/gamer",jsonBody: gamer.getJSON())
        
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
