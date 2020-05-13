//
//  Gamer.swift
//  Readyy
//
//  Created by Milk on 5/10/2562 BE.
//  Copyright © 2562 Ratsuda Suwan. All rights reserved.


import Foundation
class Gamer {
    
    private var dict = Dictionary<String,Array<String>>()
    private var id:String
    private var name:String
    private var score:Int
    private var high_score:Int
    private var roomid:String
    private var status:String
    private var orderId:Int
    
    init(name:String) {
        self.id = ""
        self.name = name
        self.score = 0
        self.high_score = 0
        self.roomid = "0"
        self.orderId = 100
        self.status = ""
        
    }
    
    
    
    func setId() {
        self.id = "G\(randomId())"
        
    }
    
    func randomId() -> String{
        var i = 0 , key = "" , keyOld = ""
        while i<5 {
            
            let  number = Int.random(in: 0..<7)
            key = "\(keyOld)\(number)"
            keyOld = "\(key)"
            i+=1
            
        }
        return key
    }
    func setRoomId(roomId:String){
        self.roomid = roomId
    }
    func getRoomId() -> String {
        return roomid
    }
    func setName(name:String)  {
        self.name = name
        //print(gamerJSON())
    }
    func setStatus(status:String)  {
        self.status = status
    }
    
    func setScore(score:Int)  {
        self.score += score
    }
    
    func setHigh_score(high_score:Int) {
        self.high_score = high_score
    }
    
    func getId() -> String {
        return id
    }
    
    func getName() -> String {
        return name
    }
    
    func getScore() -> Int {
        return score
    }
    
    func getHigh_score() -> Int {
        return high_score
    }
    
    func getOrderId() -> Int {
        return orderId
    }
    
    func getJSON() -> String {
        
        return "{\"id\":\"\(id)\",\"name\":\"\(name)\",\"score\":\"\(score)\",\"high_score\":\"\(high_score)\",\"roomid\":\"\(roomid)\",\"status\":\"\(status)\"}";
       
    }
    
    func gamerJSON(json:String) {
        subStringGamer.step1(json: json)
    }
    
    func addDictionary(id:String , name:String , score:String , high_score:String ,roomId:String ,status:String  )  {
       
        dict[id] = [name,score,high_score,status,roomId]
        
        
    }
    
    func getDictionaryGamer() -> [String:Array<String>] {
        
        return dict
    }
    
    func getNamePlayersIndex(id:String) -> String{
    
        var namePlayers = ""
        for (key,value) in dict {
            if (key == id){
                for (name) in value{
                    namePlayers = name
                    break
                }
                
            }
        }
            return namePlayers
    }
    
    
    func isName(name:String) -> Bool {
        var bool = false
        for (key,value ) in dict{
            if (value[0] == name){
               bool = true
                break;
            }
        }
        
        return bool
    }
    
    func setRoomDictionary(name:String , value :String , index:Int)  {
        
        var k = "" , array:Array<String> = []
        for (key , value) in dict{
            if (value[0] == name){
                k = key
                break
            }
        }
        
        array = dict[k]!
        array[index] = value
        dict[k] = array
        //print(dict)
    }
    
    func getRoomIdByNameUser(user:String ) -> String {
       
        var name = ""
        for (key,value) in dict{
            
            if (value[0] == user){
                //print("user \(value[0]) \(value[3])")i
                return value[3]
            }
        }
        return "fail"
    }
    
    func getHandByIdRoom(id:String) -> String {
        for (key , value) in dict{
            
            if (value[4] == "hand" && value[3] == id){
                return value[0]
            }
        }
        return "fail"
    }
    
    func setHighScoreByNameUser(user:String , score:String , highScore:String)  {
        var k = "" , array:Array<String> = []
        for (key,value) in dict{
            if (value[0] == user){
                k = key
                break
            }
        
        }
        array = dict[k]!
        array[1] = score
        array[2] = highScore
        dict[k] = array
       
    }
    
    func getAllScoreByNameUser(name:String) -> String {
        for (key , value) in dict{
            if (value[0] == name){
                return value[1]
            }
        }
        return ""
    }
    
    func getHighScoreByNameUser(name:String) -> String {
        for (key , value) in dict{
            if (value[0] == name){
                return value[2]
            }
        }
        return ""
    }
    
}









