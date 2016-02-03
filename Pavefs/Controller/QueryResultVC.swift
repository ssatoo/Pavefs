//
//  QueryResultVC.swift
//  Pavefs
//
//  Created by Zacharias Yiakoumi on 25/11/15.
//  Copyright © 2015 Nayeye. All rights reserved.
//

import UIKit


   

class QueryResultVC: UIViewController,QueryServiceDelegate,OntologyServiceDelegate{

    
    
    @IBOutlet var resulttxt: UILabel!
    @IBOutlet var t1: UILabel!
    @IBOutlet var t2: UILabel!
    @IBOutlet var t3: UILabel!
    @IBOutlet var d1: UILabel!
    @IBOutlet var d2: UILabel!
    @IBOutlet var d3: UILabel!
    @IBOutlet var relatedcasestitletxt: UILabel!
    @IBOutlet var txttitlequeryresult: UILabel!
    @IBOutlet var responcetitleview: UILabel!
    @IBOutlet var r1: UILabel!
    @IBOutlet var r2: UILabel!
    @IBOutlet var r3: UILabel!
    @IBOutlet var r4: UILabel!
    
   
      var queryObj:QueryModel = QueryModel()
      var QueryToShow:String!
      var ontologyFlatObj:OntologyModel = OntologyModel()
      var rCase:String!
    
 
    @IBOutlet weak var relatedCaseTitle1Lbl: UILabel!
    @IBOutlet weak var resultlbl: UILabel!
    @IBOutlet weak var relatedCaseTitle2Lbl: UILabel!
    @IBOutlet weak var relatedCaseTitle3Lbl: UILabel!
    
    @IBOutlet weak var relatedCasesID1: UILabel!
    @IBOutlet weak var relatedCasesID2: UILabel!
    @IBOutlet weak var relatedCasesID3: UILabel!
  
    
    @IBOutlet weak var responseLbl: UILabel!
    
    @IBOutlet weak var responselbl1: UILabel!
    @IBOutlet weak var responselbl2: UILabel!
    @IBOutlet weak var responselbl3: UILabel!
    @IBOutlet weak var responselbl4: UILabel!
    
    @IBOutlet weak var ResultsWV: UIWebView!
    
    
    
    
    @IBAction func case1Action(sender: AnyObject) {
        
        rCase = self.queryObj.query.resultCasesArr[0].valueForKey("id") as? String
        
        self.performSegueWithIdentifier("RelatedCasesIdentifier", sender: self)
    }
    
    @IBAction func case2Action(sender: AnyObject) {
      rCase = self.queryObj.query.resultCasesArr[1].valueForKey("id") as? String
        self.performSegueWithIdentifier("RelatedCasesIdentifier", sender: self)
    }
    
    @IBAction func case3Action(sender: AnyObject) {
        rCase = self.queryObj.query.resultCasesArr[2].valueForKey("id") as? String
        self.performSegueWithIdentifier("RelatedCasesIdentifier", sender: self)
    }
    @IBOutlet var case2Action: UIButton!
    
    
    @IBOutlet var resultTextView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.leftBarButtonItem = Utility.backButton(self)
        print("QueryToShow (\(QueryToShow))")
        self.title = LocalizedString("Queries", comment:"")
       
        self.ontologyFlatObj.delegate = self
        self.ontologyFlatObj.RetrieveOntology()
        
        self.queryObj.delegate = self
        Settings.startLoader()
        self.queryObj.RetrieveQueryResult(QueryToShow)
        
        
        
        // Do any additional setup after loading the view.
    }

    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        self.localizedefiled()
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        //RelatedCasesIdentifier
        
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }

    */
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject!) {
        let vc = segue.destinationViewController as! RelatedCasesVC
        if segue.identifier == "RelatedCasesIdentifier"{
            
           vc.CaseId = rCase
            vc.ontologyDict = self.ontologyFlatObj.ontologyDict
            // vc.colorString = colorLabel.text
           
        }
    }
    

    func queryService(alertMessage:String, moveForward:Bool){
        print("queryService")
   // Settings.stopLoader()
    
        
        self.setUpTheView()
    }
    
    func popToPreviousController(sender:UIButton)
    {
        self.navigationController?.popViewControllerAnimated(true)
    }
    
    
    
    func htmlcontent(onHoldReson : String) -> NSMutableAttributedString
    {
        
        let markerFontAttributes : [String : AnyObject]? = [
            NSFontAttributeName : UIFont(name: "HelveticaNeue", size: 12.0)!,
           // NSForegroundColorAttributeName : UIColor(red: 0/255, green: 152/255, blue: 204/255, alpha: 1.0)
        ]
        let onHoldText = NSAttributedString(string: onHoldReson, attributes: markerFontAttributes)
      //  let onHoldReasonText  = NSAttributedString(string:onHoldReson)
        var string = NSMutableAttributedString()
        string.appendAttributedString(onHoldText)
       // string.appendAttributedString(onHoldReasonText)
        return string
    }
    
    func setUpTheView()
    {
        
        if LocalizedGetLanguage() == "el"{
            
            self.ResultsWV.loadHTMLString(self.queryObj.query.resultTextGR, baseURL: nil)
            
        }else{
            
            
            self.ResultsWV.loadHTMLString(self.queryObj.query.resultTextEN, baseURL: nil)
        }
        
        
       
       
       
        
        
        
       
        print("\(self.queryObj.query.resultCases)")
        
        if self.queryObj.query.resultCasesArr.count > 0{
        
         //RelatedCasesIdentifier
            
        self.relatedCaseTitle1Lbl.text = self.queryObj.query.resultCasesArr[0].valueForKey("title") as? String
        self.relatedCaseTitle2Lbl.text = self.queryObj.query.resultCasesArr[1].valueForKey("title") as? String
        self.relatedCaseTitle3Lbl.text = self.queryObj.query.resultCasesArr[2].valueForKey("title") as? String
        
        self.relatedCasesID1.text = self.queryObj.query.resultCasesArr[0].valueForKey("id") as? String
        self.relatedCasesID2.text = self.queryObj.query.resultCasesArr[1].valueForKey("id") as? String
        self.relatedCasesID3.text = self.queryObj.query.resultCasesArr[2].valueForKey("id") as? String
    
        
        }
        
        
        if LocalizedGetLanguage() == "el"{
            self.responseLbl.text = "Παρακαλούμε, αξιολογείστε κάθε μία από τις παρακάτω παρεμβάσεις, οι οποίες προτάθηκαν από το ΠΑΥΕΥΣ ως απάντηση στο εν λόγω ερώτημά σας, σημειώνοντας:\n \n- είτε ότι ήταν απολύτως αποτυχημένη (δηλαδή συνεχίζει η σχετιζόμενη συμπεριφορά με αμείωτη συχνότητα και ένταση και μετά από 2-3 συνεχόμενες προσπάθειες) \n - είτε ότι ήταν μερικώς ή απολύτως επιτυχημένη\n \n Μην την αξιολογήσετε αν δεν την εφαρμόσατε καθόλου."
            
            
            self.responseLbl.sizeToFit()
            self.responselbl1.text = self.ontologyFlatObj.ontologyDict["Class_\(self.queryObj.query.rp1)"]?.labelGR
            self.responselbl2.text = self.ontologyFlatObj.ontologyDict["Class_\(self.queryObj.query.rp2)"]?.labelGR
            self.responselbl3.text = self.ontologyFlatObj.ontologyDict["Class_\(self.queryObj.query.rp3)"]?.labelGR
            self.responselbl4.text = self.ontologyFlatObj.ontologyDict["Class_\(self.queryObj.query.rp4)"]?.labelGR
        }else{
             self.responseLbl.text = "Please review each response that where produced by PAVEFS as a result in your query, remarking: \n \n - either it was absolutely unsuccessful ( ie continues the behavior associated with undiminished intensity and frequency, and after 2-3 consecutive attempts) \n - or that were partially or completely successful ( ie partial or total reduction in frequency or intensity ). \n \n Do not review if you have not used it at all."
            
            self.responseLbl.sizeToFit()
            self.responselbl1.text = self.ontologyFlatObj.ontologyDict["Class_\(self.queryObj.query.rp1)"]?.labelEN
            self.responselbl2.text = self.ontologyFlatObj.ontologyDict["Class_\(self.queryObj.query.rp2)"]?.labelEN
            self.responselbl3.text = self.ontologyFlatObj.ontologyDict["Class_\(self.queryObj.query.rp3)"]?.labelEN
            self.responselbl4.text = self.ontologyFlatObj.ontologyDict["Class_\(self.queryObj.query.rp4)"]?.labelEN
        }
       
        
        
        
        
        
    }
    func ontologyService(alertMessage:String, moveForward:Bool){
    
       
      
        print(self.ontologyFlatObj.ontologyDict.keys)
        print("ontologyService(Class_\(self.queryObj.query.rp1))")
        print("ontologyService(\(self.ontologyFlatObj.ontologyDict["Class_\(self.queryObj.query.rp1)"]?.labelEN))")
        print("ontologyService(\(self.ontologyFlatObj.ontologyDict["Class_\(self.queryObj.query.rp2)"]?.labelEN))")
        print("ontologyService(\(self.ontologyFlatObj.ontologyDict["Class_\(self.queryObj.query.rp3)"]?.labelEN))")
        print("ontologyService(\(self.ontologyFlatObj.ontologyDict["Class_\(self.queryObj.query.rp4)"]?.labelEN))")
         Settings.stopLoader()
         self.setUpTheView()

    }
    
    
    func localizedefiled(){
    
        self.txttitlequeryresult.text = LocalizedString("Queries", comment: "")
         self.title = LocalizedString("Queries", comment:"")
        
        
        self.t1.text = LocalizedString("title", comment: "")
        
        self.t2.text = LocalizedString("title", comment: "")
        
        self.t3.text = LocalizedString("title", comment: "")
        self.resulttxt.text = LocalizedString("results", comment: "")
    
        self.relatedcasestitletxt.text = LocalizedString("relatedcases", comment: "")
        
        
        self.r1.text = "\(LocalizedString("rp ", comment: ""))1"
        
        self.r2.text = "\(LocalizedString("rp ", comment: ""))2"
        
        self.r3.text = "\(LocalizedString("rp ", comment: ""))3"
        
        self.r4.text = "\(LocalizedString("rp ", comment: ""))4"
        
        self.responcetitleview.text = LocalizedString("rp ", comment: "")
        
        //self.resulttxt.text = LocalizedString("", comment: "")
        
    }
    
    
}
