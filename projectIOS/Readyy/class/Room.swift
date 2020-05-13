//
//  Room.swift
//  Readyy
//
//  Created by Milk on 15/10/2562 BE.
//  Copyright © 2562 Ratsuda Suwan. All rights reserved.
//

import Foundation
class Room{
    private var dictRoom = Dictionary<String,Array<String>>()
    private var room:String
    private var status :String
    
    
    init() {
        self.room = ""
        self.status = ""
      
    }
    
    func setRoom(room:String)  {
        self.room = room
    }
    
    func getRoom() -> String {
        return room
    }
    
    func setStatus(status:String)  {
        self.status = status
    }
    func getStatus() -> String {
        return status
    }
    
    func randomRoom() -> String{
        var i = 0 , key = "" , keyOld = ""
        while i<5 {
            
            let  number = Int.random(in: 0..<10)
            key = "\(keyOld)\(number)"
            keyOld = "\(key)"
            i+=1
            
        }
        return key
    }
    
    
    func addDictionary(roomId:String,status:String , win1:String , win2:String , win3:String)  {
       dictRoom[roomId] = [status,win1,win2,win3]
        print(dictRoom)
    }
    
    func isPIN(PIN:String)-> Bool{
        dictRoom = gamer.getDictionaryGamer()
        for (key , value) in dictRoom{
            if (value[3] == PIN){
            return true
            }
        }
        return false
            
    }
    
    func roomJSON(json:String){
        subStringRoom.step1(json: json)
    }
    
    
    
    
    
        
        
        
    
    
    
}
