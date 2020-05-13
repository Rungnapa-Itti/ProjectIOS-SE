//
//  SubString.swift
//  Readyy
//
//  Created by Milk on 8/10/2562 BE.
//  Copyright © 2562 Ratsuda Suwan. All rights reserved.
//

import Foundation
class SubStringQuestion {
    func step1(json:String)  {
        var strArray = json.components(separatedBy: "},")
        for i in 0..<strArray.endIndex{
            var part1 = strArray[i]
            
            step2(json: part1)
        }
    }
    
    func step2(json:String)  {
        var strArray = json.components(separatedBy: ",")
        let id = strArray[0]
        let name = strArray[1]
        let ans = strArray[2]
        let room = strArray[3]
        
        
        //print("id : \(id) \n name : \(name) \n ans : \(ans) \n point : \(point)")
        step3(id: id , name :name , ans : ans , room: room)
        
    }
    
    func step3(id:String , name:String , ans:String  , room:String )  {
        var strArrayid = id.components(separatedBy: ":\"")
        var strArrayName = name.components(separatedBy: ":\"")
        var strArrayAns = ans.components(separatedBy: ":\"")
        var strArrayRoom = room.components(separatedBy: ":\"")

       

        let id = strArrayid[1]
        let name = strArrayName[1]
        let ans = strArrayAns[1]
        let room = strArrayRoom[1]
       
        
        //print("id : \(id) \n name : \(name) \n ans : \(ans) \n point : \(point)")
        step4(id: id , name :name , ans : ans , room: room)
    }
    
    func step4(id:String , name:String , ans:String  , room:String )  {
        var strArrayid = id.components(separatedBy: "\"")
        var strArrayName = name.components(separatedBy: "\"")
        var strArrayAns = ans.components(separatedBy: "\"")
        var strArrayRoom = room.components(separatedBy: "\"")
        let id = strArrayid[0]
        let name = strArrayName[0]
        let ans = strArrayAns[0]
        let room = strArrayRoom[0]
        
        
        
        
        //print("id : \(id) \n name : \(name) \n ans : \(ans) \n point : \(point)")
        question.addDictionary(id: id , name :name , ans : ans , room: room)
    }
    
    
}
