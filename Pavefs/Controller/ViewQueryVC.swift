//
//  DisplayVC.swift
//  Pavefs
//
//  Created by Sakis Kefalas on 25/11/15.
//  Copyright © 2015 Nayeye. All rights reserved.
//

import UIKit

class ViewQueryVC: UIViewController ,ViewQueryServiceDelegate,OntologyServiceDelegate {
    
    @IBOutlet var scrollView: UIScrollView!
    
    var ontologyModel: OntologyModel?
    let queryModel: QueryModel = QueryModel()
    var queryId: String!
    
    var queryQuestions:[QueryQuestion]!
    
    init(queryId:String)
    {
        super.init(nibName: nil, bundle: nil)
        self.queryId = queryId
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        print("ViewQueryVC")
        // Do any additional setup after loading the view.
        
        //self.setNavigationBarItem()
        //navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.Done, target: self, action: "doneTapped:")
        
        self.navigationItem.leftBarButtonItem = Utility.backButton(self)
        self.navigationController?.navigationBarHidden = false;
        
        self.title = LocalizedString("Queries", comment:"")
        
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        
        scrollView.hidden = true
        Settings.startLoader()
        
        queryModel.viewQueryDelegate = self
        print("Retriving info for Query with ID:\(queryId)")
        queryModel.ViewQuery(queryId)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Navigation
    
    func doneTapped(sender:AnyObject)
    {
        self.navigationController?.popViewControllerAnimated(true)
    }
    
    func popToPreviousController(sender:UIButton)
    {
        self.navigationController?.popViewControllerAnimated(true)
    }
    
    //MARK: - Controller Functions
    
    func viewQueryCallDidFinish(fetchedQuestions: [QueryQuestion]) {
        
        queryQuestions = fetchedQuestions
        
        if ontologyModel == nil
        {
            ontologyModel = OntologyModel()
            
            ontologyModel!.delegate = self
            ontologyModel!.RetrieveOntology()
        }
        else
        {
            for currentQuestion in queryQuestions
            {
                currentQuestion.normalize()
                currentQuestion.replaceAnswersWithOntologyInfo(ontologyModel!)
            }
            
            self.displayFetchedQuery()
        }
        
        
    }
    
    func ontologyService(alertMessage: String, moveForward: Bool) {
        //print("ontology entities fetched...")
        
        for currentQuestion in queryQuestions
        {
            currentQuestion.normalize()
            currentQuestion.replaceAnswersWithOntologyInfo(ontologyModel!)
        }
        
        self.displayFetchedQuery()
    }
    
    func displayFetchedQuery()
    {
        var horizontalPadding:CGFloat = 5
        var verticalPadding:CGFloat = 8
        let indent:CGFloat = 20
        
        var contentSize: CGSize = CGSizeZero
        var currentY:CGFloat = horizontalPadding
        var frame: CGRect = CGRect(x: horizontalPadding, y: verticalPadding/2, width: UIScreen.mainScreen().bounds.width - (2 * horizontalPadding), height: 0)
        
        for currentQ in queryQuestions
        {
            frame.origin.y = currentY
            let text = currentQ.question
            
            
            
            var questionLabel:UILabel = UILabel(frame: frame)
            
            if currentQ.isSubquestion
            {
                var subquestionFrame = frame
                
                subquestionFrame.origin.x += indent
                subquestionFrame.size.width = subquestionFrame.width - (2 * indent)
                questionLabel = UILabel(frame: subquestionFrame)
            }
            
            questionLabel.text = currentQ.question
            
            questionLabel.font = currentQ.isSubquestion ? questionLabel.font.fontWithSize(12) : questionLabel.font.fontWithSize(12)
            questionLabel.numberOfLines = 0
            questionLabel.lineBreakMode = NSLineBreakMode.ByWordWrapping
            questionLabel.sizeToFit()
            
            frame.size.height = questionLabel.frame.height
            
            scrollView.addSubview(questionLabel)
            currentY = currentY + frame.height + verticalPadding/2
            
            if currentQ.isHeader
            {
                currentY = currentY + verticalPadding/2
                continue
            }
            
            for var i = 0; i < currentQ.answersCount() ; i++
            {
                let currentA = currentQ.answers[i]
                frame.origin.y = currentY
                var answerLabel:UILabel = UILabel(frame: frame)
                
                if currentQ.isSubquestion
                {
                    var subquestionFrame = frame
                    
                    subquestionFrame.origin.x += indent
                    subquestionFrame.size.width = subquestionFrame.width - (2 * indent)
                    
                    answerLabel = UILabel(frame: subquestionFrame)
                }
                
                answerLabel.text = currentA
                
                var answerFont = answerLabel.font.fontWithSize(12)
                var descriptor:UIFontDescriptor = answerFont.fontDescriptor().fontDescriptorWithSymbolicTraits(UIFontDescriptorSymbolicTraits.TraitBold)
                answerLabel.font = UIFont(descriptor: descriptor, size: 0)
                
                answerLabel.numberOfLines = 0
                answerLabel.lineBreakMode = NSLineBreakMode.ByWordWrapping
                answerLabel.sizeToFit()
                
                frame.size.height = answerLabel.frame.height
                
                scrollView.addSubview(answerLabel)
                currentY = currentY + frame.height + verticalPadding
                
                if(i == currentQ.answersCount()-1)
                {
                    currentY = currentY + verticalPadding/2
                }
            }
            
        }
        
        contentSize.width = frame.width
        contentSize.height = frame.origin.y + frame.height + verticalPadding
        
        scrollView.contentSize = contentSize
        scrollView.hidden = false
        Settings.stopLoader()
    }

}
