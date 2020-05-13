//
//  Choices.swift
//  Readyy
//
//  Created by Milk on 5/10/2562 BE.
//  Copyright © 2562 Ratsuda Suwan. All rights reserved.
//

import Foundation
class Choices {
    private var dictChoices = Dictionary<String,Array<String>>()
    private var id:String = ""
    private var choices1: String = ""
    private var choices2: String = ""
    private var choices3: String = ""
    private var choices4: String = ""
    private var question = Question()
    
    func setQuestion(q:Question){
        self.question = q
    }
    
  init() {
        self.id = "";
        self.choices1 = ""
        self.choices2 = ""
        self.choices3 = ""
        self.choices4 = ""
        
    }
    
    func setId(questionId:String)  {
        self.id = questionId
        
    }
    
   
    func setChoices1(choices1:String)  {
    
        self.choices1 = choices1
        //print("Choices1: \(choices1)")
    }
    
    func setChoices2(choices2:String)  {
        self.choices2 = choices2
        //print("Choices2: \(choices2)")
    }
    
    func setChoices3(choices3:String)  {
        self.choices3 = choices3
        //print("Choices3: \(choices3)")
    }
    
    func setChoices4(choices4:String)  {
        self.choices4 = choices4
        //print("Choices4: \(choices4)")
        
    }
    
    func getId() -> String {
        return id
    }
    
    func getChoices1() -> String {
        return choices1
    }
    
    func getChoices2() -> String {
        return choices2
    }
    
    func getChoices3() -> String {
        return choices3
    }
    
    func getChoices4() -> String {
        return choices4
    }
    
    
    func getJSON(id:String,choices1:String,choices2:String,choices3:String,choices4:String) -> String {
        return "[{\"id\":\"\(id)\",\"choices1\":\"\(choices1)\",\"choices2\":\"\(choices2)\",\"choices3\":\"\(choices3)\",\"choices4\":\"\(choices4)\"}]";
    }
    
    func choicesJSON(text:String){
        //print("Choices : \(text)")
        subStringChoices.step1(json: text)
        
        
    }
    
    
    func addDictionary(id:String,choices1:String,choices2:String,choices3:String,choices4:String)  {

        dictChoices[id] = [choices1,choices2,choices3,choices4]
        
    }
    
    func getDictionary() -> [String:Array<String>] {
        
        return dictChoices
        
    }
    
    
    func DictionaryChoices()  {
        for (key , value) in dictChoices{
            getJSON(id: key, choices1: value[0], choices2: value[1], choices3: value[2], choices4: value[3])
            
        }
    }
    
    
       
    
    
}
