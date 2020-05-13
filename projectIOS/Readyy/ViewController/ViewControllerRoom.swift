//
//  ViewControllerRoom.swift
//  Readyy
//
//  Created by Milk on 26/10/2562 BE.
//  Copyright © 2562 Ratsuda Suwan. All rights reserved.
//

import UIKit

class ViewControllerRoom: UIViewController {
    @IBOutlet weak var labelException: UILabel!
    
    @IBOutlet weak var pinLabel: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print(gamer.getDictionaryGamer())
        

        // Do any additional setup after loading the view.
    }
    
    @IBAction func nextToRoom(_ sender: Any) {
        var PIN:Bool
        if (pinLabel.text == ""){
            labelException.text = "กรุณากรอก PIN"
        }else{
        
            PIN = room.isPIN(PIN: pinLabel.text!)
           
            print("PIN y/N : \(PIN)")
        
            if (PIN == true ){
               gamer.setRoomDictionary(name: gamer.getName(), value: "member", index: 4)
                gamer.setRoomDictionary(name: gamer.getName(),value: pinLabel.text!,index: 3)
                
                gamer.setRoomId(roomId: pinLabel.text!)
                gamer.setStatus(status: "member")
                postJSON(url: "http://localhost:8081/gamer", jsonBody: gamer.getJSON())
                
               performSegue(withIdentifier: "page3", sender: self)
            
            }else{
                labelException.text = "ไม่มี PIN นี้"
                print("nonPIN")
            }
        }
        
    }
    @IBAction func randomRoom(_ sender: Any) {
       var id = room.randomRoom()
        gamer.setRoomDictionary(name: gamer.getName(), value: "hand", index: 4)
        
        gamer.setRoomDictionary(name: gamer.getName(), value: id ,index: 3)
        gamer.setRoomId(roomId: id)
        gamer.setStatus(status: "hand")
        room.addDictionary(roomId: id, status:"ready" , win1: "a", win2: "b", win3: "c")
        room.setStatus(status: "ready")
        
        
        postJSON(url: "http://10.2.3.241:8081/gamer", jsonBody: gamer.getJSON())
        performSegue(withIdentifier: "page3", sender: self)
       
    }
//    func getRoom(){
//        let url = URL(string: "http://localhost:8081/room")!
//        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
//            if let error = error {
//                print("error: \(error)")
//            } else {
//                if (response as? HTTPURLResponse) != nil {
//                    //print("statusCode: \(response.statusCode)")
//                }
//                if let data = data, let dataString = String(data: data, encoding: .utf8) {
//
//                    room.roomJSON(json: dataString)
//
//
//                }
//            }
//        }
//        task.resume()
//    }
//
    public func postJSON(url: String ,jsonBody: String){
        guard let url = URL(string: url) else {return}

        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        let data = Data(jsonBody.utf8)
        request.httpBody = data


        request.addValue("application/json", forHTTPHeaderField: "Content-Type")

        URLSession.shared.dataTask(with: request){(data,response,error) in
            DispatchQueue.main.async {
            }


            }.resume()


    }
//
//
//    /*
//    // MARK: - Navigation
//
//    // In a storyboard-based application, you will often want to do a little preparation before navigation
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        // Get the new view controller using segue.destination.
//        // Pass the selected object to the new view controller.
//    }
//    */

}
