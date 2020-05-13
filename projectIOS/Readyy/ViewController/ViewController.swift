//
//  ViewController.swift
//  Readyy
//
//  Created by Ratsuda Suwan on 12/9/2562 BE.
//  Copyright © 2562 Ratsuda Suwan. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var fieldname: UITextField!
    @IBOutlet weak var exception: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        user = ""
        getGamer()
        
        
        
        // Do any additional setup after loading the view.
    }
    
    @IBAction func nextPage2(_ sender: Any) {
        if (fieldname.text != ""){
            
            if (gamer.isName(name: fieldname.text!) == true){
                
                exception.text = "มีผู้ใช้ชื่อนี้แล้ว"
            }else{
               let id = gamer.setId()
                gamer.addDictionary(id:gamer.getId(), name: fieldname.text!, score: "0", high_score: "0", roomId: "-", status : "lobby")
                gamer.setName(name: fieldname.text!)
                
                user = fieldname.text!
            
                
                
                
            performSegue(withIdentifier: "page2", sender: self)
            }
        }else{
            
                 exception.text = "กรอกชื่ออีกครั้ง"
            
            
            
        }
    }
    
    func getGamer() {
        
        let url = URL(string: "http://10.2.3.241:8081/gamer")!
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
            if let error = error {
                print("error: \(error)")
            } else {
                if (response as? HTTPURLResponse) != nil {
                    //print("statusCode: \(response.statusCode)")
                }
                if let data = data, let dataString = String(data: data, encoding: .utf8) {
                    
                    gamer.gamerJSON(json: dataString)
                    
                    //self.setChoices(ch:self.choices)
                    //print("dataChoices: \(dataString)")
                }
            }
        }
        task.resume()
    }
    
   

    
    
    
  
    
    
    
}

