//
//  DataQuestion.swift
//  Readyy
//
//  Created by Milk on 9/10/2562 BE.
//  Copyright © 2562 Ratsuda Suwan. All rights reserved.
//

import Foundation
class DataQuestion{
    private var name:String
    private var ans:String
    private var point:Int
    
    
    init() {
        self.name = ""
        self.ans = ""
        self.point = 10
        
    }
    func setName(name:String)  {
        self.name = name
        //print("Question : \(name)")
    }
    
    func setAns(ans:String)  {
        self.ans = ans
        //print("Ans: \(ans)")
    }
    
    func setPoint(point:Int){
        self.point = point
    }
    
   
    
    func getName() -> String {
        return name
    }
    
    func  getAns() -> String {
        return ans
    }
    
    func getPoin() -> Int{
        return point
    }
    
}
