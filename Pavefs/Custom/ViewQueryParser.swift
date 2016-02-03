//
//  ViewQueryParser.swift
//  Pavefs
//
//  Created by Sakis Kefalas on 11/26/15.
//  Copyright © 2015 Nayeye. All rights reserved.
//

import UIKit

//protocol ViewQueryParserDelegate
//{
//    func parseCompleted(info: [String: String]?,result: [QueryQuestion])
//}

class ViewQueryParser: NSObject {
    
    //var delegate: ViewQueryParserDelegate?
    let jsonData: [String:String]!
    
    override init() {
        jsonData = [String:String]()
    }
    
    init(jsonData:[String:String]) {
        self.jsonData = jsonData
    }
    
    func parse() -> [QueryQuestion]
    {
        var parsed: [QueryQuestion] = [QueryQuestion]()
        
        // @ Localize
        let questions: [AnyObject] = [LocalizedString("queryName", comment:""),
            LocalizedString("genderQuestion", comment:""),
            LocalizedString("ageQuestion", comment:""),
            LocalizedString("tmsQuestion", comment:""),
            LocalizedString("tmeQuestion", comment:""),
            [LocalizedString("d1-d5Question", comment:""), LocalizedString("d ", comment:"")], //[d1 - d5]
            [LocalizedString("rh1-rh5Question", comment:""), LocalizedString("rh ", comment:"")], //[rh1 - rh5]
            LocalizedString("b11Question", comment:""),
            LocalizedString("kb11Question", comment:""),// Y/N
            LocalizedString("bp11Question", comment:""),
            LocalizedString("po11Question", comment:""),// Y/N
            LocalizedString("dr11Question", comment:""),// Y/N
            LocalizedString("f11Question", comment:""),
            LocalizedString("in11Question", comment:""),
            LocalizedString("ij11Question", comment:""),// Y/N
            LocalizedString("lo11Question", comment:""),
            LocalizedString("lop11Question", comment:""),// y/n
            LocalizedString("lof11Question", comment:""),// y/n
            [LocalizedString("st111-st131Question ", comment:""), LocalizedString("st ", comment:"")],//[st111 - st131],
            [LocalizedString("s111-s141Question ", comment:""), LocalizedString("s ", comment:"")],//[s111 - s141],
            [LocalizedString("p111-p131Question ", comment:""), LocalizedString("p ", comment:"")],//[p111 - p131],
            LocalizedString("n11Question", comment:""),
            [LocalizedString("w111-w141Question ", comment:""), LocalizedString("w ", comment:"")],//[w111 - w141],
            LocalizedString("l11Question", comment:""),
            LocalizedString("lp11Question", comment:""),// y/n
            LocalizedString("lf11Question", comment:""),// y/n
            [LocalizedString("rp111-rp141Question ", comment:""), LocalizedString("rp ", comment:"")],//[rp111 - rp141],
            LocalizedString("as11Question", comment:""),// y/n
            LocalizedString("op111Question", comment:""),
            LocalizedString("orp111Question", comment:""),
            LocalizedString("oro111Question", comment:""),
            LocalizedString("ore111Question", comment:"")
        ]
        
        let keys: [AnyObject] = ["queryName",
            "gender",
            "age",
            "tms",
            "tme",
            ["d1","d2","d3","d5"],
            ["rh1","rh2","rh3","rh4","rh5"],
            "b11",
            "kb11",// Y/N
            "bp11",
            "po11",// Y/N
            "dr11",// Y/N
            "f11",
            "in11",
            "ij11",// Y/N
            "lo11",
            "lop11",// y/n
            "lof11",// y/n
            ["st111","st121","st131"],
            ["s111","s121","s131","s141"],
            ["p111","p121","p131"],
            "n11",
            ["w111","w121","w131","w141"],
            "l11",
            "lp11",// y/n
            "lf11",// y/n
            ["rp111","rp121","rp131","rp141"],
            "as11",// y/n
            "op111",
            "orp111",
            "oro111",
            "ore111"
        ]
        
        let valueOntologyTypes: [AnyObject] = ["",
            "Class_374",
            "",
            "",
            "",
            ["Class_97","Class_97","Class_97","Class_97"],
            ["Class_93","Class_93","Class_93","Class_93","Class_93"],
            "Class_13",
            "BOOL",// Y/N
            "Class_675",
            "BOOL",// Y/N
            "BOOL",// Y/N
            "Class_459",
            "Class_336",
            "BOOL",// Y/N
            "Class_676",
            "BOOL",// y/n
            "BOOL",// y/n
            ["Class_127","Class_127","Class_127"],
            ["Class_49","Class_49","Class_49","Class_49"],
            ["Class_611","Class_611","Class_611"],
            "Class_415",
            ["Class_144","Class_144","Class_144","Class_144"],
            "Class_85",
            "BOOL",// y/n
            "BOOL",// y/n
            ["Class_542","Class_542","Class_542","Class_542"],
            "BOOL",// y/n
            "Class_232",
            "Class_732",
            "Class_739",
            "Class_733"
        ]
        
        for var i = 0;i < keys.count;i++
        {
            let testVal = keys[i];
            
            var current:QueryQuestion = QueryQuestion()
            
            if( testVal is String )
            {
                current = parseSingle(questions[i] as! String, key: keys[i] as! String, valuetype: valueOntologyTypes[i] as! String)
                
                parsed.append(current)
            }
            else if( testVal is [String] )
            {
                let questionHeaders: [String] = questions[i] as! [String]
                let subkeys:[String] = keys[i] as! [String]
                let subValueTypes: [String] = valueOntologyTypes[i] as! [String]
                
                current = QueryQuestion(question: questionHeaders[0], answer: " ")
                current.isHeader = true
                parsed.append(current)
                
                for var j = 0; j < subkeys.count ; j++
                {
                    current = parseSingle(questionHeaders[1]+" \(j+1)", key: subkeys[j], valuetype: subValueTypes[j])
                    current.isSubquestion = true
                    parsed.append(current)
                }
                
                continue
            }
            
        }
        
        return parsed
    }
    
    
    private func parseSingle(question:String, key: String, valuetype: String) -> QueryQuestion
    {
        // @ Localize
        
        let localizedYes = "Yes"
        let localizedNo = "No"
        
        
        let ret: QueryQuestion = QueryQuestion()
        
        ret.question = question
        
        var answer: String = " "
        
        
        if let testVal: String = jsonData[key]!
        {
            answer = testVal
        }
        
        if(valuetype.containsString("Class_") && answer != " " && answer != "-1")
        {
            answer = "Class_" + answer
        }
        else if(answer == "-1")
        {
            answer = " "
        }
        
        if valuetype == "BOOL" && (answer == "0" || answer == "1")
        {
            answer = (answer == "0") ? localizedNo : localizedYes
        }
        
        ret.addAnswer(answer)
        
        return ret
    }
    
}
