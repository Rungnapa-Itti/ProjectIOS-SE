//
//  SubStringGamer.swift
//  Readyy
//
//  Created by Ratsuda Suwan on 12/10/2562 BE.
//  Copyright © 2562 Ratsuda Suwan. All rights reserved.
//

import Foundation
class SubStringGamer {
    func step1(json:String)  {
        print("test \(json)")
        var strArray = json.components(separatedBy: "},")
        for i in 0..<strArray.endIndex{
            let part1 = strArray[i]
            step2(json: part1)
        }
    }
    
    func step2(json:String)  {
        var strArray = json.components(separatedBy: ",")
        let id = strArray[0]
        let name = strArray[1]
        let score = strArray[2]
        let high_score = strArray[3]
        let status = strArray[4]
        let roomId = strArray[5]
        
        
        
        
        //print("test \n id : \(id) \n name : \(name) \n score : \(score) \n high_score : \(high_score) \n room : \(room) \n status : \(status)")
        step3(id: id , name :name , score: score, high_score: high_score, status:status , roomId: roomId)
        
    }
    
    func step3(id:String , name:String , score:String , high_score:String ,status:String, roomId:String)  {
        var strArrayid = id.components(separatedBy: ":\"")
        var strArrayName = name.components(separatedBy: ":\"")
        var strArrayScore = score.components(separatedBy: ":\"")
        var strArrayHighScore = high_score.components(separatedBy: ":\"")
        var strArrayStatus = status.components(separatedBy: ":\"")
        var strArrayRoom = roomId.components(separatedBy: ":\"")
       
        
        let id = strArrayid[1]
        let name = strArrayName[1]
        let score = strArrayScore[0]
        let high_score = strArrayHighScore[0]
        let status = strArrayStatus[1]
        let roomId = strArrayRoom[1]
       
        
        
        //print("id : \(id) \n name : \(name) \n score : \(score) \n high_score : \(high_score) \n status : \(status) \n room : \(roomId) ")
        step4(id: id , name :name , score: score, high_score: high_score, room: roomId , status: status)
    }
    
    
    func step4(id: String , name:String , score:String , high_score:String , room:String , status:String)  {
        var strArrayid = id.components(separatedBy: "\"")
        var strArrayName = name.components(separatedBy: "\"")
        var strArrayScore = score.components(separatedBy: "\"")
        var strArrayHighScore = high_score.components(separatedBy: "\"")
        var strArrayStatus = status.components(separatedBy: "\"")
        var strArrayRoom = room.components(separatedBy: "\"")
     
        
        let id = strArrayid[0]
        let name = strArrayName[0]
        let score = strArrayScore[2]
        let high_score = strArrayHighScore[2]
        let status = strArrayStatus[0]
        let room = strArrayRoom[0]
       
        
        
        
        //print("id : \(id) \n name : \(name) \n score : \(score) \n high_score : \(high_score) \n room : \(room) \n status : \(status)")
        step5(id: id , name :name , score: score, high_score: high_score, room: room , status:status)
        //gamer.addDictionary(id: id , name :name , score: score, high_score: high_score, room: room, status: status)
    }
    
    func step5(id: String , name:String , score:String , high_score:String , room:String , status:String) {
        var strArrayScore = score.components(separatedBy: ":")
        var strArrayHighScore = high_score.components(separatedBy: ":")
        
        let score = strArrayScore[1]
        let high_score = strArrayHighScore[1]
        
        //print("id : \(id) \n name : \(name) \n score : \(score) \n high_score : \(high_score) \n status: \(status) \n room : \(room)")
       
        gamer.addDictionary(id: id , name :name , score: score, high_score: high_score, roomId: room , status : status)
        
    }
    
    
    
    
    
    
}

