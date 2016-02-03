//
//  QueryResultVC.swift
//  Pavefs
//
//  Created by Zacharias Yiakoumi on 25/11/15.
//  Copyright © 2015 Nayeye. All rights reserved.
//

import UIKit


   

class QueryResultVC: UIViewController,QueryServiceDelegate,OntologyServiceDelegate, UITableViewDataSource , UITableViewDelegate{

    
    
    
    @IBOutlet var RelatedCasesTbl: UITableView!
    
    
    @IBOutlet var scroll: UIScrollView!
    
    @IBOutlet var ContainerView: UIView!
     var resulttxt: String!
     var t1: String!
     var t2: String!
     var t3: String!
     var d1: String!
     var d2: String!
     var d3: String!
     var relatedcasestitletxt: String!
     var txttitlequeryresult: String!
     var responcetitleview: String!
     var r1: String!
     var r2: String!
     var r3: String!
     var r4: String!
    
   
      var queryObj:QueryModel = QueryModel()
      var QueryToShow:String!
      var ontologyFlatObj:OntologyModel = OntologyModel()
      var rCase:String!
    
 
     var relatedCaseTitle1Lbl: String!
     var resultlbl: String!
     var relatedCaseTitle2Lbl: String!
     var relatedCaseTitle3Lbl: String!
    
     var relatedCasesID1: String!
     var relatedCasesID2: String!
     var relatedCasesID3: String!
  
    
     var responseLbl: String!
    
     var responselbl1: String!
     var responselbl2: String!
     var responselbl3: String!
     var responselbl4: String!
    
    
     var arrTitle:Array <String>! = []
     var arrValues:Array <AnyObject> = [AnyObject]()
     var ResultsWV: String!
    
    var RateView :UIView!
    
    
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
    
    
    var RateChoose :String!
    var RateId :String!
    var RateIndexpath :Int!
    
    
    func CloseButtonAction(sender:UIButton!)
    {
       RateView.removeFromSuperview()
    }
    
    
    func RateButton1(sender:UIButton!)
    {
        RateView.removeFromSuperview()
        let rateting:RateResponse = arrValues[RateIndexpath] as! RateResponse
        rateting.RateText =  "-"
       // RateChoose = " "
        rateting.RateId = "-1"
        rateting.RateText = LocalizedString("RateQuestion", comment: "")
        arrValues[RateIndexpath] = rateting
        RelatedCasesTbl.reloadData()
    }
    
    func RateButton2(sender:UIButton!)
    {
        RateView.removeFromSuperview()
        let rateting:RateResponse = arrValues[RateIndexpath] as! RateResponse
        
        rateting.RateText = "\(LocalizedString("RateQuestion", comment: "")) - (\(LocalizedString("spinner_review_fail", comment: "")))"
        rateting.RateId = "1"
       
        arrValues[RateIndexpath] = rateting
        RelatedCasesTbl.reloadData()
        
    }
    
    
    func RateButton3(sender:UIButton!)
    {
        RateView.removeFromSuperview()
        let rateting:RateResponse = arrValues[RateIndexpath] as! RateResponse
        
        rateting.RateText = "\(LocalizedString("RateQuestion", comment: "")) - (\(LocalizedString("spinner_review_success", comment: "")))"
        rateting.RateId = "0"
       
        arrValues[RateIndexpath] = rateting
        RelatedCasesTbl.reloadData()
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let screenSize: CGRect = UIScreen.mainScreen().bounds
       
        
        let screenWidth = screenSize.width
        //let screenHeight = screenSize.height
        
        let RateViewX = 10 as CGFloat
        let RateViewW = screenWidth - 20
        let RateViewY = 100 as CGFloat
        let RateViewH = screenWidth - 100
        
        
        RateView = UIView((frame: CGRectMake(RateViewX, RateViewY, RateViewW, RateViewH)))
        RateView.backgroundColor = UIColor.lightGrayColor()
        RateView.layer.borderColor = UIColor.blackColor().CGColor
        RateView.layer.borderWidth = 1
        
        let button   = UIButton(type: UIButtonType.System) as UIButton
        button.frame = CGRectMake(RateViewW - 50, 0, 50, 50)
        button.backgroundColor = UIColor.clearColor()
        button.setTitle("X", forState: UIControlState.Normal)
        button.setTitleColor(UIColor.blackColor(), forState: UIControlState.Normal)
        button.addTarget(self, action: "CloseButtonAction:", forControlEvents: UIControlEvents.TouchUpInside)
        
        
        
        let RateButton1   = UIButton(type: UIButtonType.System) as UIButton
        RateButton1.frame = CGRectMake(5, 50, RateViewW - 10, 50)
        RateButton1.backgroundColor = UIColor.clearColor()
        RateButton1.setTitle("-", forState: UIControlState.Normal)
        RateButton1.setTitleColor(UIColor.blackColor(), forState: UIControlState.Normal)
        RateButton1.addTarget(self, action: "RateButton1:", forControlEvents: UIControlEvents.TouchUpInside)
        RateButton1.layer.borderColor = UIColor.blackColor().CGColor
        RateButton1.layer.borderWidth = 1
        
        let RateButton2   = UIButton(type: UIButtonType.System) as UIButton
        RateButton2.frame = CGRectMake(5, 105, RateViewW - 10, 50)
        RateButton2.backgroundColor = UIColor.clearColor()
        RateButton2.setTitle(LocalizedString("spinner_review_fail", comment: ""), forState: UIControlState.Normal)
        RateButton2.setTitleColor(UIColor.blackColor(), forState: UIControlState.Normal)
        RateButton2.addTarget(self, action: "RateButton2:", forControlEvents: UIControlEvents.TouchUpInside)
        RateButton2.layer.borderColor = UIColor.blackColor().CGColor
        RateButton2.layer.borderWidth = 1
        
        let RateButton3   = UIButton(type: UIButtonType.System) as UIButton
        RateButton3.frame = CGRectMake(5, 160, RateViewW - 10, 50)
        RateButton3.backgroundColor = UIColor.clearColor()
        RateButton3.setTitle(LocalizedString("spinner_review_success", comment: ""), forState: UIControlState.Normal)
        RateButton3.setTitleColor(UIColor.blackColor(), forState: UIControlState.Normal)
        RateButton3.addTarget(self, action: "RateButton3:", forControlEvents: UIControlEvents.TouchUpInside)
        RateButton3.layer.borderColor = UIColor.blackColor().CGColor
        RateButton3.layer.borderWidth = 1
        
        
        
        RateView.addSubview(button)
        RateView.addSubview(RateButton1)
        RateView.addSubview(RateButton2)
        RateView.addSubview(RateButton3)
    
    
        
        //self.view.addSubview(RateView)
        
        self.navigationItem.leftBarButtonItem = Utility.backButton(self)
        print("QueryToShow (\(QueryToShow))")
        self.title = LocalizedString("Queries", comment:"")
       
        self.ontologyFlatObj.delegate = self
        self.ontologyFlatObj.RetrieveOntology()
        
        self.queryObj.delegate = self
        Settings.startLoader()
        self.queryObj.RetrieveQueryResult(QueryToShow)
        
        print("User Category: \(Settings.GetUserCategory())")
        
        arrValues = [String]()
        
        // Do any additional setup after loading the view.
    }

    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        self.localizedefiled()
//        if (Settings.GetUserCategory() == "2"){
//            let screenSize: CGRect = UIScreen.mainScreen().bounds
//            let screenWidth = screenSize.width
//            
//           // responseLbl.hidden = false
//        
//            let button = UIButton()
//            button.frame = CGRectMake(10 , self.ContainerView.frame.height - 60,screenWidth - 20, 40)
//            button.backgroundColor = UIColor.orangeColor()
//            button.setTitleColor(UIColor.blackColor(), forState: UIControlState.Normal)
//            button.setTitle(LocalizedString("RateSubmit", comment:""), forState: UIControlState.Normal)
//            button.addTarget(self, action: "RateSubmitAction:", forControlEvents: UIControlEvents.TouchUpInside)
//            self.ContainerView.addSubview(button)
//            
//        }else{
//            //responseLbl.hidden = true
//            
//        
//        
//        }
        

        
    }
    func RateSubmitAction(sender:UIButton!)
    {
        print(LocalizedString("spinner_review", comment:""))
        
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
    
        
       // self.setUpTheView()

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
            
           // self.ResultsWV.loadHTMLString(self.queryObj.query.resultTextGR, baseURL: nil)
            self.ResultsWV = self.queryObj.query.resultTextGR
        }else{
            
            
           // self.ResultsWV.loadHTMLString(self.queryObj.query.resultTextEN, baseURL: nil)
             self.ResultsWV = self.queryObj.query.resultTextEN
        }
        
        
        
       // addToArray(LocalizedString("results", comment: ""), Value: self.ResultsWV)
       arrValues.append(LocalizedString("results", comment: ""))
       arrValues.append(self.ResultsWV)
       arrValues.append(LocalizedString("relatedcases", comment: ""))
    
        
        
        
       
       // print("\(self.queryObj.query.resultCases)")
        
        if self.queryObj.query.resultCasesArr.count > 0{
        
         //RelatedCasesIdentifier
        
            for var i = 0; i<self.queryObj.query.resultCasesArr.count; i++ {
                
                
                
                var rc :RelatedCasesObject = RelatedCasesObject()
                
                rc.CaseName = (self.queryObj.query.resultCasesArr[i].valueForKey("title") as? String)!
                rc.CaseId = (self.queryObj.query.resultCasesArr[0].valueForKey("id") as? String)!
                
                
                //self.relatedCaseTitle2Lbl = self.queryObj.query.resultCasesArr[1].valueForKey("title") as? String
                // self.relatedCaseTitle3Lbl = self.queryObj.query.resultCasesArr[2].valueForKey("title") as? String
                
                arrValues.append(rc)
                //self.relatedCasesID2 = self.queryObj.query.resultCasesArr[1].valueForKey("id") as? String
                // self.relatedCasesID3  = self.queryObj.query.resultCasesArr[2].valueForKey("id") as? String
                
            }
    
        
        }
        arrValues.append(LocalizedString("rp ", comment: ""))
        
        if LocalizedGetLanguage() == "el"{
            self.responseLbl  = "Παρακαλούμε, αξιολογείστε κάθε μία από τις παρακάτω παρεμβάσεις, οι οποίες προτάθηκαν από το ΠΑΥΕΥΣ ως απάντηση στο εν λόγω ερώτημά σας, σημειώνοντας:\n \n- είτε ότι ήταν απολύτως αποτυχημένη (δηλαδή συνεχίζει η σχετιζόμενη συμπεριφορά με αμείωτη συχνότητα και ένταση και μετά από 2-3 συνεχόμενες προσπάθειες) \n - είτε ότι ήταν μερικώς ή απολύτως επιτυχημένη\n \n Μην την αξιολογήσετε αν δεν την εφαρμόσατε καθόλου."
            
            
            //self.responseLbl.sizeToFit()
            self.responselbl1  = self.ontologyFlatObj.ontologyDict["Class_\(self.queryObj.query.rp1)"]?.labelGR ?? "-"
            self.responselbl2  = self.ontologyFlatObj.ontologyDict["Class_\(self.queryObj.query.rp2)"]?.labelGR ?? "-"
            self.responselbl3  = self.ontologyFlatObj.ontologyDict["Class_\(self.queryObj.query.rp3)"]?.labelGR ?? "-"
            self.responselbl4  = self.ontologyFlatObj.ontologyDict["Class_\(self.queryObj.query.rp4)"]?.labelGR ?? "-"
        }else{
            self.responseLbl  = "Please review each response that where produced by PAVEFS as a result in your query, remarking: \n \n - either it was absolutely unsuccessful ( ie continues the behavior associated with undiminished intensity and frequency, and after 2-3 consecutive attempts) \n - or that were partially or completely successful ( ie partial or total reduction in frequency or intensity ). \n \n Do not review if you have not used it at all."
            
            // self.responseLbl.sizeToFit()
            self.responselbl1  = self.ontologyFlatObj.ontologyDict["Class_\(self.queryObj.query.rp1)"]?.labelEN ?? "-"
            self.responselbl2  = self.ontologyFlatObj.ontologyDict["Class_\(self.queryObj.query.rp2)"]?.labelEN ?? "-"
            self.responselbl3  = self.ontologyFlatObj.ontologyDict["Class_\(self.queryObj.query.rp3)"]?.labelEN ?? "-"
            self.responselbl4  = self.ontologyFlatObj.ontologyDict["Class_\(self.queryObj.query.rp4)"]?.labelEN ?? "-"
        }
        
        if (Settings.GetUserCategory() == "2"){
        
            arrValues.append(self.responseLbl)
        
            arrValues.append("\(LocalizedString("rp ", comment: ""))1")
            arrValues.append(self.responselbl1)
            
            let rateR :RateResponse = RateResponse ()
            
            rateR.caseId = "1"
            //rateR.RateId =
            rateR.RateText = LocalizedString("RateQuestion", comment: "")
            arrValues.append(rateR)
            
            arrValues.append("\(LocalizedString("rp ", comment: ""))2")
            arrValues.append(self.responselbl2)
            let rateR1 :RateResponse = RateResponse ()
            rateR1.caseId = "2"
            rateR1.RateText = LocalizedString("RateQuestion", comment: "")
            arrValues.append(rateR1)
            
            arrValues.append("\(LocalizedString("rp ", comment: ""))3")
            arrValues.append(self.responselbl3)
            let rateR2 :RateResponse = RateResponse ()
            rateR2.caseId = "3"
            rateR2.RateText = LocalizedString("RateQuestion", comment: "")
            arrValues.append(rateR2)
            
            arrValues.append("\(LocalizedString("rp ", comment: ""))4")
            arrValues.append(self.responselbl4)
            let rateR3 :RateResponse = RateResponse ()
            rateR3.caseId = "4"
            rateR3.RateText = LocalizedString("RateQuestion", comment: "")
            arrValues.append(rateR3)
        
            arrValues.append(LocalizedString("RateSubmit", comment: ""))
            
            
        }else{
        
        arrValues.append("\(LocalizedString("rp ", comment: ""))1")
        arrValues.append(self.responselbl1)
        
        arrValues.append("\(LocalizedString("rp ", comment: ""))2")
        arrValues.append(self.responselbl2)
        
        arrValues.append("\(LocalizedString("rp ", comment: ""))3")
        arrValues.append(self.responselbl3)
        
        arrValues.append("\(LocalizedString("rp ", comment: ""))4")
        arrValues.append(self.responselbl4)
        
        }
       
       
        
        
        
        
        
    }
    func ontologyService(alertMessage:String, moveForward:Bool){
    
         Settings.stopLoader()
         self.setUpTheView()
        self.RelatedCasesTbl.reloadData()
    }
    
    
    func localizedefiled(){
    
//        self.txttitlequeryresult.text = LocalizedString("Queries", comment: "")
//         self.title = LocalizedString("Queries", comment:"")
//        
//        
//        self.t1.text = LocalizedString("title", comment: "")
//        
//        self.t2.text = LocalizedString("title", comment: "")
//        
//        self.t3.text = LocalizedString("title", comment: "")
//        self.resulttxt.text = LocalizedString("results", comment: "")
//    
//        self.relatedcasestitletxt.text = LocalizedString("relatedcases", comment: "")
//        
//        
//        self.r1.text = "\(LocalizedString("rp ", comment: ""))1"
//        
//        self.r2.text = "\(LocalizedString("rp ", comment: ""))2"
//        
//        self.r3.text = "\(LocalizedString("rp ", comment: ""))3"
//        
//        self.r4.text = "\(LocalizedString("rp ", comment: ""))4"
//        
//        self.responcetitleview.text = LocalizedString("rp ", comment: "")
        
        //self.resulttxt.text = LocalizedString("", comment: "")
        
    }
   
    
    func addToArray (Title : String , Value : String){
    
        arrValues.append(Value)
        arrValues.append(Title)
    
    }
    
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrValues.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath) as! CasesCell
        
        print(arrValues[indexPath.row])
  
        cell.titleLbl?.text = ""
        cell.valueLbl?.text = ""
        
        cell.Idtitle?.text = ""
        cell.idvalue?.text = ""
        
        cell.textLabel?.text = ""
        cell.contentView.viewWithTag(123456789)?.removeFromSuperview()
        cell.textLabel!.font = UIFont(name: cell.textLabel!.font.fontName, size: 12)
        cell.selectionStyle = UITableViewCellSelectionStyle.None
        
        switch (indexPath.row){
        case 1 :
           let cell1 = tableView.dequeueReusableCellWithIdentifier("SimpleCellForText", forIndexPath: indexPath)
            cell1.contentView.viewWithTag(123456789)?.removeFromSuperview()
            let attrStr = try! NSAttributedString(
                data: arrValues[indexPath.row].dataUsingEncoding(NSUnicodeStringEncoding, allowLossyConversion: true)!,
                options: [ NSDocumentTypeDocumentAttribute: NSHTMLTextDocumentType],
                documentAttributes: nil)
            cell1.textLabel!.attributedText = attrStr
            cell1.textLabel!.font = UIFont(name: cell.textLabel!.font.fontName, size: 12)
            cell1.textLabel?.numberOfLines = 0
            cell1.textLabel?.lineBreakMode = .ByWordWrapping
            cell1.selectionStyle = UITableViewCellSelectionStyle.None
           
            return cell1
            
        default:
            if arrValues[indexPath.row] .isKindOfClass(RelatedCasesObject){
                let cases :RelatedCasesObject = arrValues[indexPath.row] as! RelatedCasesObject
                cell.titleLbl?.text = cases.CaseTitle
                cell.valueLbl?.text = cases.CaseName
                
                cell.Idtitle?.text = cases.IDTitle
                cell.idvalue?.text = cases.CaseId
                
                
                let separatorLineView : UIView = UIView(frame:CGRectMake(5, 0, cell.frame.size.width-10, 1))
                separatorLineView.backgroundColor = UIColor.blackColor() // set color as you want.
                separatorLineView.tag = 123456789
                cell.contentView.addSubview(separatorLineView)
                
               // cell.userInteractionEnabled = true
            
            
            }else{
                 let cell1 = tableView.dequeueReusableCellWithIdentifier("SimpleCellForText", forIndexPath: indexPath)
               // cell.userInteractionEnabled = false
                
                cell1.contentView.viewWithTag(123456789)?.removeFromSuperview()
                
                cell1.selectionStyle = UITableViewCellSelectionStyle.None
                
                cell1.textLabel?.text = arrValues[indexPath.row] as? String
                cell1.textLabel!.font = UIFont(name: cell.textLabel!.font.fontName, size: 12)
                cell1.textLabel?.numberOfLines = 0
                cell1.textLabel?.lineBreakMode = .ByWordWrapping
                
                cell1.textLabel?.layer.shadowColor = UIColor.blackColor().CGColor
                if arrValues[indexPath.row] as? String == LocalizedString("RateSubmit", comment: ""){
                    cell1.textLabel?.textAlignment = NSTextAlignment.Center
                    cell1.backgroundColor = UIColor.orangeColor()
                
                }else if arrValues[indexPath.row] .isKindOfClass(RateResponse){
                    
                  //cell1.separatorStyle = UITableViewCellSeparatorStyle.SingleLine
                    
                    
                    
                   
                    
                    
                    let Rate:RateResponse = arrValues[indexPath.row] as! RateResponse
                     cell1.textLabel?.text = Rate.RateText
                    
                    print("\(Rate.RateText)-\(LocalizedString("RateQuestion", comment: ""))" )
                    
                    if Rate.RateText.containsString(LocalizedString("RateQuestion", comment: "")){
                        cell1.textLabel?.textColor = UIColor.blueColor()
                        cell1.backgroundColor = UIColor.whiteColor()
                        cell1.textLabel?.textAlignment = NSTextAlignment.Left
                        
                        
                        if indexPath.row != arrValues.count-2 {
                            let separatorLineView : UIView = UIView(frame:CGRectMake(5, cell1.frame.size.height-1, cell1.frame.size.width-10, 1))
                            separatorLineView.backgroundColor = UIColor.blackColor() // set color as you want.
                            separatorLineView.tag = 123456789
                            cell1.contentView.addSubview(separatorLineView)
                        }
                        
                        
                    
                    }else{
                        cell1.backgroundColor = UIColor.whiteColor()
                        cell1.textLabel?.textColor = UIColor.blackColor()
                        cell1.textLabel?.textAlignment = NSTextAlignment.Left
                    }
                    
                }

                else{
                    
                    
                    
                    cell1.backgroundColor = UIColor.whiteColor()
                    cell1.textLabel?.textColor = UIColor.blackColor()
                    cell1.textLabel?.textAlignment = NSTextAlignment.Left
                  
                  
                     if (arrValues[indexPath.row] as! String).containsString(LocalizedString("results", comment: "")){
                        let separatorLineView : UIView = UIView(frame:CGRectMake(5, cell1.frame.size.height-1, cell1.frame.size.width-10, 1))
                        separatorLineView.backgroundColor = UIColor.blackColor() // set color as you want.
                        separatorLineView.tag = 123456789
                        cell1.contentView.addSubview(separatorLineView)
                        
                    }else if (arrValues[indexPath.row] as! String) == LocalizedString("rp ", comment: ""){
                        let separatorLineView : UIView = UIView(frame:CGRectMake(5, cell1.frame.size.height-1, cell1.frame.size.width-10, 1))
                        separatorLineView.backgroundColor = UIColor.blackColor() // set color as you want.
                        separatorLineView.tag = 123456789
                        cell1.contentView.addSubview(separatorLineView)
                        
                    }
                    
                    
                }
                
                
                return cell1
            }
            
          
            break
        
        }
        
        
        
        
        return cell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        if arrValues[indexPath.row] .isKindOfClass(RelatedCasesObject){
        
            print("didSelectRowAtIndexPath")
            
            let theCase :RelatedCasesObject = arrValues[indexPath.row] as! RelatedCasesObject
            rCase = theCase.CaseId
            self.performSegueWithIdentifier("RelatedCasesIdentifier", sender: self)
            
            
        }else if (arrValues[indexPath.row] .isKindOfClass(RateResponse) )  {
        
            if (RateView != nil){
            
                RateIndexpath = indexPath.row
                self.view.addSubview(RateView)
                print("RateQuestion")
            
            }else{
                RateView.removeFromSuperview()
            
            }
           
        
        }else if arrValues[indexPath.row] as? String == LocalizedString("RateSubmit", comment: ""){
         
            self.RateSubmit()
        
            
        
        }
        
        
        
    }
    
    
    func tableView(tableView: UITableView, estimatedHeightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 70
        
    
    }
    func RateSubmit (){
        print("RateSubmit")
        var r1 :String = ""
        var r2 :String = ""
        var r3 :String = ""
        var r4 :String = ""
        for var i = 0; i<arrValues.count; i++ {
        
           
            
            if arrValues[i] .isKindOfClass(RateResponse){
            
                let rate:RateResponse = arrValues[i] as! RateResponse
                if rate.caseId == "1"{
                    r1 = rate.RateId
                }else if rate.caseId == "2"{
                    r2 = rate.RateId
                }else if rate.caseId == "3"{
                    r3 = rate.RateId
                }else if rate.caseId == "4"{
                    r4 = rate.RateId
                
                }
            
            }
        
        }
        
        print("\(r1),\(r2),\(r3),\(r4),\(self.queryObj.query.queryResultId)")
        
        self.queryObj.RateResponce(r1, rp2: r2, rp3: r3, rp4: r4, queryResultID: self.queryObj.query.queryResultId)
    
    
    }
    
}
