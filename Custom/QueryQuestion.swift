//
//  QueryQuestion.swift
//  Pavefs
//
//  Created by Sakis Kefalas on 11/26/15.
//  Copyright © 2015 Nayeye. All rights reserved.
//

import UIKit

class QueryQuestion: NSObject {
    var question: String!
    var answers: [String]!
    var isHeader: Bool = false
    var isSubquestion: Bool = false
    
    override init() {
        question = "";
        answers = [String]();
    }
    
    init(question:String) {
        self.question = question
        self.answers = [String]();
    }
    
    init(question:String, answer:String) {
        self.question = question
        self.answers = [String]()
        answers.append(answer)
    }
    
    init(question:String, answers:[String]) {
        self.question = question
        self.answers = answers
    }
    
    func addAnswer(anAnswer:String)
    {
        answers.append(anAnswer)
    }
    
    func answersCount() -> Int
    {
        return answers.count
    }
    
    //Removes all empty answers when there is one valid answer
    //  or leaves an empty answer when there are no valid answers
    func normalize()
    {
        if(countEmptyAnswers() == answers.count)
        {
            answers = [" "]
        }
        else
        {
            for var i = 0 ; i < answers.count ; i++
            {
                let current = answers[i]
                
                if(current == "" || current == " ")
                {
                    answers.removeAtIndex(i)
                }
            }
        }
    }
    
    func replaceAnswersWithOntologyInfo(ontologyModel: OntologyModel)
    {
        let langIsEnglish:Bool = (LocalizedGetLanguage() == "en")
        
        for var i = 0 ; i < answers.count ; i++
        {
            let current = answers[i]
            
            if(current.containsString("Class_"))
            {
                var entity:Ontology? = ontologyModel.ontologyDict[current]
                
                if let existingEntity: Ontology = entity
                {
                    answers[i] = langIsEnglish ? existingEntity.labelEN : existingEntity.labelGR
                }
                
            }
        }
    }
    
    private func countEmptyAnswers() -> Int
    {
        var count: Int = 0
        
        for current in answers
        {
            if current == "" || current == " "
            {
                count++
            }
        }
        
        return count
    }
    
    func toString() ->String
    {
        var retString = "Question: \(self.question) Answer(s): "
        
        for currentAnswer in self.answers
        {
            retString = retString + " \(currentAnswer) ,"
        }
        
        return retString
    }
    
    static func ontologyClassesForQuestions(queryQuestions: [QueryQuestion]) -> [String]
    {
        var neededClasses: [String] = [String]()
        
        for currentQuestion in queryQuestions
        {
            for currentAnswer in currentQuestion.answers
            {
                if(!currentAnswer.containsString("Class_"))
                {
                    continue
                }
                
                if(!neededClasses.contains(currentAnswer))
                {
                    neededClasses.append(currentAnswer)
                }
            }
        }
        
        return neededClasses
    }
    
}
