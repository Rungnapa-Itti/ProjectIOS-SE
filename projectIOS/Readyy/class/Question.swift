//
//  Question.swift
//  Readyy
//
//  Created by Milk on 5/10/2562 BE.
//  Copyright © 2562 Ratsuda Suwan. All rights reserved.
//

import Foundation
class Question {
    private var dict = Dictionary<String,Array<String>>()
    private var id:String
    private var name:String
    private var ans:String
    private var room:String
    private var questionOrder:Int
    
    
    
    init() {
        self.id = ""
        self.name = ""
        self.ans = ""
        
        self.questionOrder = 100
        self.room = ""
        
        
    }
    
    func setRoom(room:String)  {
        self.room = room
        
    }
    func getRoom() -> String {
        return room
    }
   
    func setId(){
        self.id = "Q\(getQuestionOrder())"
        setQuestionOrder()
    }
    
    func setQuestionOrder(){
        self.questionOrder+=1
    }
    func setName(name:String)  {
        self.name = name
       
    }
    
    func setAns(ans:String)  {
        self.ans = ans
        //print("Ans: \(ans)")
    }
    
   
    
    func getId() -> String {
        return id
    }
    
    func getName() -> String {
        return name
    }
    
    func  getAns() -> String {
        return ans
    }
    
   
    func getQuestionOrder() -> Int{
        return questionOrder
    }
    
    func getJSON(id:String,name:String,ans:String,room:String) -> String {
        return "[{\"id\":\"\(id)\",\"name\":\"\(name)\",\"answer\":\"\(ans)\",\"room\":\"\(room)\"}]";
        
    }
    
    func questionJSON(json:String) {
       
        subStringQuestion.step1(json: json)
    }
    
    
    func addDictionary(id:String , name:String , ans:String , room:String)  {
        dict[id] = [name,ans,room]
        
        }
        
       // print("-------- \(dict)\n")
    
    func getDictionary() -> [String:Array<String>]{
        return dict
       
    }

    func getNameIndex(id:String) -> String{
        
        var nameQuestion = ""
        for (key,value) in dict {
            if (key == id){
                for (name) in value{
                    nameQuestion = name
                    break
                }
                
            }
        }
       
        return nameQuestion
    }
    
    func getScore(qu:String , ans:String) -> Int {
        var k = ""
        for (key , value ) in dict{
            for (v) in value{
                if (v == qu){
                    k = key
                    break
                }
            }
        }
        let value:Array<String> = dict[k]!
        if (ans == value[1]){
            return 1
        }
        return 0
    }
    
    func DictionaryQuestion()  {
        for (key,value) in dict{
            print("post")
            print(getJSON(id: key,name: value[0],ans: value[1],room: value[2]))
            
            if let range: Range<String.Index> = key.range(of: "1") {
                let index: Int = key.distance(from: key.startIndex, to: range.lowerBound)
               postQuestion(question:getJSON(id: key,name: value[0],ans: value[1],room: value[2]))
                
            }
            
        }
    }
    
   
    
    func postQuestion(question:String)  {
        let urlString = "http://10.2.3.241:8081/question"
        guard let url = URL(string: urlString) else {return}
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        let session = URLSession.shared
        request.httpShouldHandleCookies = false
        
        
        
        print("request : \(question)")
        
        
        //HTTP Headers
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.addValue("application/json", forHTTPHeaderField: "Accept")
        
        session.dataTask(with: request) { (data, response, error) in
            if error != nil {
                print(error!)
            }
            
            }.resume()
    }
    
    
    
}
