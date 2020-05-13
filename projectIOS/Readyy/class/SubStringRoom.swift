//
//  SubStringRoom.swift
//  Readyy
//
//  Created by Milk on 29/10/2562 BE.
//  Copyright © 2562 Ratsuda Suwan. All rights reserved.
//

import Foundation
class SubStringRoom{
    func step1(json:String)  {
        
        var strArray = json.components(separatedBy: "},")
        for i in 0..<strArray.endIndex{
            var part1 = strArray[i]
            step2(json: part1)
        }
    }
    
    func step2(json:String)  {
        var strArray = json.components(separatedBy: ",")
        let status  = strArray[0]
        let win1 = strArray[1]
        let win2 = strArray[2]
        let win3 = strArray[3]
        let roomid = strArray[4]
       
       step3(roomid: roomid, status: status, win1: win1, win2: win2, win3: win3)
    }
    func step3(roomid:String , status:String , win1:String  , win2:String , win3:String)  {
        var strRoomId = roomid.components(separatedBy: ":\"")
        var strStatus = status.components(separatedBy: ":\"")
        var strWin1 = win1.components(separatedBy: ":\"")
        var strWin2 = win2.components(separatedBy: ":\"")
        var strWin3 = win3.components(separatedBy:":\"" )
        
        let id = strRoomId[1]
        let status = strStatus[1]
        let win1 = strWin1[1]
        let win2 = strWin2[1]
        let win3 = strWin3[1]
        
        step4(id: id, status: status, win1: win1, win2: win2, win3: win3)
    }
    
    func step4(id:String , status:String , win1:String  , win2:String , win3:String )  {
        var strId = id.components(separatedBy: "\"")
        var strStatus = status.components(separatedBy: "\"")
        var strWin1 = win1.components(separatedBy: "\"")
        var strWin2 = win2.components(separatedBy: "\"")
        var strWin3 = win3.components(separatedBy: "\"")
        
        let id = strId[0]
        let status = strStatus[0]
        let win1 = strWin1[0]
        let win2 = strWin2[0]
        let win3 = strWin3[0]
        
        room.addDictionary(roomId: id, status: status, win1: win1, win2: win2, win3: win3)
    }
    

}
