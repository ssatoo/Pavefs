//
//  AddQueryVC.swift
//  Pavefs
//
//  Created by Zacharias Yiakoumi on 20/11/15.
//  Copyright © 2015 Nayeye. All rights reserved.
//

import UIKit


protocol ShowDataDelegate
{
    func TheDataIs(Data:Int)
}
class AddQueryVC: UIViewController, UIScrollViewDelegate,UITableViewDataSource,UITableViewDelegate, NameForQueryDelegate,UITextFieldDelegate,QueryServiceDelegate, IndividualServiceDelegate {

    @IBOutlet weak var QueryNoteNamebtn: UIButton!
    var personMenu:UIView!
    var PersonDropDownBtn:UIButton!
    var TheChild :Child!
    var PararmQuery:QueryParams=QueryParams()
    var QueryObj:QueryModel = QueryModel()
       //let qb :BuiltQueryViewController=BuiltQueryViewController()
    var delegate:ShowDataDelegate!
    var Data:Int!
    var individualObj:IndividualModel = IndividualModel()
    
    
    @IBOutlet var d1: UILabel!
    @IBOutlet var d2: UILabel!
    @IBOutlet var d3: UILabel!
    @IBOutlet var d4: UILabel!
    @IBOutlet var d5: UILabel!
    
    
    
    @IBOutlet weak var startDate: UITextField!
    @IBOutlet weak var endDate: UITextField!
    @IBOutlet weak var queryName: UITextField!
    @IBOutlet weak var AgeLbl: UILabel!
    @IBOutlet weak var d1lbl: UILabel!
    @IBOutlet weak var d2Lbl: UILabel!
    @IBOutlet weak var d3lbl: UILabel!
    @IBOutlet weak var d4lvl: UILabel!
    @IBOutlet weak var d5lbl: UILabel!
    @IBOutlet weak var SexLbl: UILabel!
    
    @IBOutlet weak var riskF1: UILabel!
    @IBOutlet weak var riskF1Lbl: UILabel!
    
    @IBOutlet weak var riskF2: UILabel!
    @IBOutlet weak var riskF2Lbl: UILabel!
    
    @IBOutlet weak var riskF3: UILabel!
    @IBOutlet weak var riskF3Lbl: UILabel!
    
    @IBOutlet weak var riskF4: UILabel!
    @IBOutlet weak var riskF4Lbl: UILabel!
    
    @IBOutlet weak var riskF5: UILabel!
    @IBOutlet weak var riskF5Lbl: UILabel!
    @IBOutlet weak var whathappentxt: UITextField!
    @IBOutlet weak var bodyMember: UITextField!
    @IBOutlet weak var rateBehaviour: UITextField!
    @IBOutlet weak var BehaviourVolume: UITextField!
    @IBOutlet weak var whereHappen: UITextField!
    
    @IBOutlet weak var event1: UITextField!
    @IBOutlet weak var event2: UITextField!
    @IBOutlet weak var event3: UITextField!
    
    @IBOutlet weak var condition1: UITextField!
    @IBOutlet weak var condition2: UITextField!
    @IBOutlet weak var condition3: UITextField!
    @IBOutlet weak var condition4: UITextField!
    
    @IBOutlet weak var PlaceCondition1: UITextField!
    @IBOutlet weak var PlaceCondition2: UITextField!
    @IBOutlet weak var PlaceCondition3: UITextField!
    
    
    
    @IBOutlet weak var person1: UITextField!
    @IBOutlet weak var person2: UITextField!
    @IBOutlet weak var person3: UITextField!
    @IBOutlet weak var person4: UITextField!
    
    
    @IBOutlet weak var personPlace: UITextField!
    
    @IBOutlet weak var response1: UITextField!
    @IBOutlet weak var response2: UITextField!
    @IBOutlet weak var response3: UITextField!
    @IBOutlet weak var response4: UITextField!
    
    
   
    @IBOutlet weak var personAsk: UITextField!
    @IBOutlet weak var danger: UITextField!
    @IBOutlet weak var danger2: UITextField!
    
    
    @IBOutlet weak var periorismos: UITextField!
    
    @IBOutlet weak var submitAction: UIButton!
    
    @IBOutlet weak var NofPerson: UITextField!
    
    
    @IBOutlet weak var seg1: UISegmentedControl!
    @IBOutlet weak var seg2: UISegmentedControl!
    @IBOutlet weak var seg3: UISegmentedControl!
    @IBOutlet weak var seg4: UISegmentedControl!
    @IBOutlet weak var seg5: UISegmentedControl!
    @IBOutlet weak var seg6: UISegmentedControl!
    //@IBOutlet weak var seg7: UISegmentedControl!
    @IBOutlet weak var seg8: UISegmentedControl!
    @IBOutlet weak var seg9: UISegmentedControl!
    @IBOutlet weak var seg10: UISegmentedControl!
    
    
    
    
    @IBAction func kb1_Action(sender: AnyObject) {
        switch (seg1.selectedSegmentIndex){
        case 0:
            PararmQuery.kb11="1"
            
        break
        case 1 :
            PararmQuery.kb11="0"
        break
        default:
             PararmQuery.kb11="0"
            break
        }
    }
    
    
    @IBAction func po11_Action(sender: AnyObject) {
        switch (seg2.selectedSegmentIndex){
        case 0:
            PararmQuery.po11="1"
            
            break
        case 1 :
            PararmQuery.po11="0"
            break
        default:
            PararmQuery.po11="0"
            break
        }

    }
    
    @IBAction func dr11_Action(sender: AnyObject) {
        switch (seg3.selectedSegmentIndex){
        case 0:
            PararmQuery.dr11="1"
            
            break
        case 1 :
            PararmQuery.dr11="0"
            break
        default:
            PararmQuery.dr11="0"
            break
        }

    }
    
    @IBAction func ij11_Action(sender: AnyObject) {
        switch (seg4.selectedSegmentIndex){
        case 0:
            PararmQuery.ij11="1"
            
            break
        case 1 :
            PararmQuery.ij11="0"
            break
        default:
            PararmQuery.ij11="0"
            break
        }

    }
    
    
    @IBAction func lop11_Action(sender: AnyObject) {
        switch (seg5.selectedSegmentIndex){
        case 0:
            PararmQuery.lo11="1"
            
            break
        case 1 :
            PararmQuery.lo11="0"
            break
        default:
            PararmQuery.lo11="0"
            break
        }

    }
    
    
    @IBAction func lof11_Action(sender: AnyObject) {
        switch (seg6.selectedSegmentIndex){
        case 0:
            PararmQuery.lof11="1"
            
            break
        case 1 :
            PararmQuery.lof11="0"
            break
        default:
            PararmQuery.lof11="0"
            break
        }

    }
    
    
    @IBAction func lp11_Action(sender: AnyObject) {
        switch (seg8.selectedSegmentIndex){
        case 0:
            PararmQuery.lp11="1"
            
            break
        case 1 :
            PararmQuery.lp11="0"
            break
        default:
            PararmQuery.lp11="0"
            break
        }

    }
    
    
    @IBAction func li11_Action(sender: AnyObject) {
        switch (seg9.selectedSegmentIndex){
        case 0:
            PararmQuery.lf11="1"
            
            break
        case 1 :
            PararmQuery.lf11="0"
            break
        default:
            PararmQuery.lf11="0"
            break
        }

    }
    
    @IBAction func as11_Action(sender: AnyObject) {
        switch (seg10.selectedSegmentIndex){
        case 0:
            PararmQuery.as11="1"
            
            break
        case 1 :
            PararmQuery.as11="0"
            break
        default:
            PararmQuery.as11="0"
            break
        }

    }
    
    
    @IBAction func SubmitAction(sender: AnyObject) {
        
        
        if self.individualObj.arrChildren.count == 0{
        
             self.view.makeToast(message: LocalizedString("noindividual", comment: ""))
        
        }else{
        
            print("QueryNoteNamebtn (\(QueryNoteNamebtn.titleLabel?.text))")
            if self.QueryNoteNamebtn.titleLabel?.text == "Name"{
            
                self.view.makeToast(message: LocalizedString("chooseindividual", comment: ""))
            }else{
            PararmQuery.queryName = self.queryName.text
        
        if self.startDate.text?.characters.count > 0 || self.endDate.text?.characters.count > 0  {
        print(">0")
            //self.view.makeToast(message: "ola ok ")
                    QueryObj.delegate=self
                    Settings.startLoader()
                    QueryObj.addQuery(PararmQuery)
        }else{
         self.view.makeToast(message: LocalizedString("FieldError", comment: ""))
        
                }
            }

        }
        
        
       
    }
    
    @IBAction func Name_Action(sender: AnyObject) {
        print("Name Action")
        Data = 1
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
              print("Add Query VC")
       
        self.queryName.delegate = self
        
        individualObj.delegate = self
         individualObj.retrieveIndividual()
        
        
        
        
        
    }
    func myTargetFunction(textField: UITextField) {
        // user touch field
        print("whathappentxt touched")
         Data = textField.tag
        
        
        
         self.performSegueWithIdentifier("mySegue", sender: self)
    }
    
    
    @IBAction func dateField(sender: UITextField) {
        
        var datePickerView  : UIDatePicker = UIDatePicker()
        datePickerView.datePickerMode = UIDatePickerMode.DateAndTime
        
       
        
        sender.inputView = datePickerView
        
        datePickerView.addTarget(self, action: Selector("handleDatePicker:"), forControlEvents: UIControlEvents.ValueChanged)
        datePickerView.tag=sender.tag
        let doneButton = UIButton(frame: CGRectMake(0, 0, 100, 50))
        doneButton.setTitle("Done", forState: UIControlState.Normal)
        doneButton.setTitle("Done", forState: UIControlState.Highlighted)
        doneButton.setTitleColor(UIColor.blackColor(), forState: UIControlState.Normal)
        doneButton.setTitleColor(UIColor.grayColor(), forState: UIControlState.Highlighted)
        doneButton.backgroundColor = UIColor.lightGrayColor()
        sender.inputAccessoryView = doneButton // add Button to UIView
        
        
        doneButton.tag = sender.tag
        doneButton.addTarget(self, action: "DoneButton:", forControlEvents: UIControlEvents.TouchUpInside) // set button click event
        
        
        
        
        
    }
    @IBAction func DoneButton(sender: UIButton) {
        
        switch(sender.tag){
            
        case 999:
           self.startDate.resignFirstResponder()
            break
        case 888:
            self.endDate.resignFirstResponder()
            break
        default:
            break
        }
        
    }
    
    func handleDatePicker(sender: UIDatePicker) {
       let dateFormatter = NSDateFormatter()
        //2015-09-30 00:00:00
        dateFormatter.dateFormat = "dd-MM-yyyy HH:mm:ss"
       // dateFormatter.dateStyle = .FullStyle
     //   timeFormatter.timeStyle = .FullStyle
        switch(sender.tag){
        
        case 999:
            self.startDate.text = dateFormatter.stringFromDate(sender.date)
            break
        case 888:
            self.endDate.text = dateFormatter.stringFromDate(sender.date)
            break
        default:
            break
        }
        
        
    }

    
    
    
    
    override func viewDidAppear(animated: Bool) {
    
        super.viewDidAppear(animated)
        
        //self.title="Add new query"
        self.navigationItem.leftBarButtonItem = Utility.backButton(self)
        self.navigationController?.navigationBarHidden = false;
        self.queryName.delegate = self
        self.whathappentxt.delegate = self
        
        self.startDate.addTarget(self, action: "dateField:", forControlEvents: UIControlEvents.TouchDown)
        self.endDate.addTarget(self, action: "dateField:", forControlEvents: UIControlEvents.TouchDown)
        
        self.whathappentxt.addTarget(self, action: "myTargetFunction:", forControlEvents: UIControlEvents.TouchDown)
        self.bodyMember.addTarget(self, action: "myTargetFunction:", forControlEvents: UIControlEvents.TouchDown)
        self.rateBehaviour.addTarget(self, action: "myTargetFunction:", forControlEvents: UIControlEvents.TouchDown)
        self.BehaviourVolume.addTarget(self, action: "myTargetFunction:", forControlEvents: UIControlEvents.TouchDown)
        self.whereHappen.addTarget(self, action: "myTargetFunction:", forControlEvents: UIControlEvents.TouchDown)
        self.event1.addTarget(self, action: "myTargetFunction:", forControlEvents: UIControlEvents.TouchDown)
        self.event2.addTarget(self, action: "myTargetFunction:", forControlEvents: UIControlEvents.TouchDown)
        self.event3.addTarget(self, action: "myTargetFunction:", forControlEvents: UIControlEvents.TouchDown)
        self.condition1.addTarget(self, action: "myTargetFunction:", forControlEvents: UIControlEvents.TouchDown)
        self.condition2.addTarget(self, action: "myTargetFunction:", forControlEvents: UIControlEvents.TouchDown)
        self.condition3.addTarget(self, action: "myTargetFunction:", forControlEvents: UIControlEvents.TouchDown)
        self.condition4.addTarget(self, action: "myTargetFunction:", forControlEvents: UIControlEvents.TouchDown)
        self.PlaceCondition1.addTarget(self, action: "myTargetFunction:", forControlEvents: UIControlEvents.TouchDown)
        self.PlaceCondition2.addTarget(self, action: "myTargetFunction:", forControlEvents: UIControlEvents.TouchDown)
        self.PlaceCondition3.addTarget(self, action: "myTargetFunction:", forControlEvents: UIControlEvents.TouchDown)
        self.person1.addTarget(self, action: "myTargetFunction:", forControlEvents: UIControlEvents.TouchDown)
        self.person1.addTarget(self, action: "myTargetFunction:", forControlEvents: UIControlEvents.TouchDown)
        self.person3.addTarget(self, action: "myTargetFunction:", forControlEvents: UIControlEvents.TouchDown)
        self.person4.addTarget(self, action: "myTargetFunction:", forControlEvents: UIControlEvents.TouchDown)
        self.personPlace.addTarget(self, action: "myTargetFunction:", forControlEvents: UIControlEvents.TouchDown)
        self.response1.addTarget(self, action: "myTargetFunction:", forControlEvents: UIControlEvents.TouchDown)
        self.response2.addTarget(self, action: "myTargetFunction:", forControlEvents: UIControlEvents.TouchDown)
        self.response3.addTarget(self, action: "myTargetFunction:", forControlEvents: UIControlEvents.TouchDown)
        self.response4.addTarget(self, action: "myTargetFunction:", forControlEvents: UIControlEvents.TouchDown)
        self.personAsk.addTarget(self, action: "myTargetFunction:", forControlEvents: UIControlEvents.TouchDown)
        self.danger.addTarget(self, action: "myTargetFunction:", forControlEvents: UIControlEvents.TouchDown)
        self.periorismos.addTarget(self, action: "myTargetFunction:", forControlEvents: UIControlEvents.TouchDown)
        self.danger2.addTarget(self, action: "myTargetFunction:", forControlEvents: UIControlEvents.TouchDown)

        self.NofPerson.addTarget(self, action: "myTargetFunction:", forControlEvents: UIControlEvents.TouchDown)
        
        self.localizeUIElements()
    }
    
    override func viewWillDisappear(animated: Bool) {
        super.viewWillDisappear(animated)
        
        //self.navigationController?.navigationBarHidden = true;
        
    }
      
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func popToPreviousController(sender:UIButton)
    {
        self.navigationController?.popViewControllerAnimated(true)
    }
    /*
    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
    // Get the new view controller using segue.destinationViewController.
    // Pass the selected object to the new view controller.
    }
    */
    

    
    
    func tableView(tableView: UITableView,
        cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell
    {
        let cell:UITableViewCell = UITableViewCell(style:UITableViewCellStyle.Default, reuseIdentifier:"cell")
        cell.textLabel?.text = "test \(indexPath.row)"
        
        return cell
    }
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
   
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath)
    {
        
    }

    
    
    
    
    
    
    
    
    func QueryCodeName(NameModel :Child){
    
        
      //  TheChild = NameModel
        self.fillTheQuery(NameModel)
    
    }
    func fillTheQuery(NameModel :Child){
        
        
        
        let date = NSDate()
        let calendar = NSCalendar.currentCalendar()
        let components = calendar.components( .Year, fromDate: date)
        let year = components.year
      
        let age :Int
               age = year - Int( NameModel.birth_year)!
        
        print("Year is \(year)")
       //  print("age is \(year as Int - (NameModel.birth_year)as Int)")
        
        
        self.QueryNoteNamebtn.setTitle(NameModel.child_code, forState: UIControlState.Normal)
        self.AgeLbl.text = "\(age)"
        self.d1lbl.text = NameModel.d1_label
        self.d2Lbl.text = NameModel.d2_label
        self.d3lbl.text = NameModel.d3_label
        self.d4lvl.text = NameModel.d4_label
        self.d5lbl.text = NameModel.d5_label
        self.SexLbl.text = NameModel.sex_label
        
        self.riskF1Lbl.text = NameModel.rh1_label
        self.riskF2Lbl.text = NameModel.rh2_label
        self.riskF3Lbl.text = NameModel.rh3_label
        self.riskF4Lbl.text = NameModel.rh4_label
        self.riskF5Lbl.text = NameModel.rh5_label
        
        print(NameModel.sex_label)
        PararmQuery.selChild = NameModel.child_id
        PararmQuery.age="\(age)"
        PararmQuery.d1 = NameModel.d1
        PararmQuery.d2 = NameModel.d2
        PararmQuery.d3 = NameModel.d3
        PararmQuery.d4 = NameModel.d4
        PararmQuery.d5 = NameModel.d5
        PararmQuery.tms = "2015-09-30 00:00:00"
        PararmQuery.tme = "2015-09-30 00:00:00"
        
        
        
          let gender = NameModel.sex.stringByReplacingOccurrencesOfString("[", withString: "")
        
        PararmQuery.gender = gender.stringByReplacingOccurrencesOfString("]", withString: "")
        PararmQuery.rh1 = NameModel.rh1
        PararmQuery.rh2 = NameModel.rh2
        PararmQuery.rh3 = NameModel.rh3
        PararmQuery.rh4 = NameModel.rh4
        PararmQuery.rh5 = NameModel.rh5
        
        
        
    }
    
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject!) {
         let vc = segue.destinationViewController as! BuiltQueryViewController
        if segue.identifier == "mySegue"{
            
           delegate = vc
            
            delegate.TheDataIs(Data)
           // vc.colorString = colorLabel.text
            vc.delegate = self
        }
    }
    
    
    func textFieldDidBeginEditing(textField: UITextField) {    //delegate method
       
        switch(textField.tag){
        case 1:
            break
            
        default :
        break
        
        }
    }
    
    func textFieldShouldEndEditing(textField: UITextField) -> Bool {  //delegate method
        return true
        
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {   //delegate method
        textField.resignFirstResponder()
        return true
    }
    
    
    /*
    */
    func QueryOntology(OntologyModel :Ontology, lblCode:Int){
    print("QueryOntology : \(OntologyModel.labelEN)")
    
        switch (lblCode){
        
        case 2 :
            if LocalizedGetLanguage() == "el" {
             self.whathappentxt.text = OntologyModel.labelGR
            }else{
            
             self.whathappentxt.text = OntologyModel.labelEN
            }
           
            PararmQuery.b11=PararmQuery.MakePararmsForQuery(OntologyModel.parentNodes)
            break
        case 3:
            
            if LocalizedGetLanguage() == "el" {
                 self.bodyMember.text = OntologyModel.labelGR
            }else{
                 self.bodyMember.text = OntologyModel.labelEN
               
            }
           
            PararmQuery.bp11=PararmQuery.MakePararmsForQuery(OntologyModel.parentNodes)
        case 4:
            if LocalizedGetLanguage() == "el" {
                self.rateBehaviour.text = OntologyModel.labelGR
            }else{
                
                self.rateBehaviour.text = OntologyModel.labelEN
            }
            
            PararmQuery.f11=PararmQuery.MakePararmsForQuery(OntologyModel.parentNodes)
            break
        case 5:
            if LocalizedGetLanguage() == "el" {
                 self.BehaviourVolume.text = OntologyModel.labelGR
            }else{
                 self.BehaviourVolume.text = OntologyModel.labelEN
                
            }
           
            PararmQuery.in11=PararmQuery.MakePararmsForQuery(OntologyModel.parentNodes)
            break
        case 6:
            if LocalizedGetLanguage() == "el" {
                self.whereHappen.text = OntologyModel.labelGR
            }else{
                self.whereHappen.text = OntologyModel.labelEN
                
            }
            
            PararmQuery.lo11=PararmQuery.MakePararmsForQuery(OntologyModel.parentNodes)
            break
        case 7:
            if LocalizedGetLanguage() == "el" {
                self.event1.text = OntologyModel.labelGR
            }else{
                
                self.event1.text = OntologyModel.labelEN
            }
            
            PararmQuery.st111=PararmQuery.MakePararmsForQuery(OntologyModel.parentNodes)

        case 72:
            if LocalizedGetLanguage() == "el" {
                 self.event2.text = OntologyModel.labelGR
            }else{
                
                 self.event2.text = OntologyModel.labelEN
            }
           
            PararmQuery.st121=PararmQuery.MakePararmsForQuery(OntologyModel.parentNodes)

            break
        case 73 :
            if LocalizedGetLanguage() == "el" {
                 self.event3.text = OntologyModel.labelGR
            }else{
                 self.event3.text = OntologyModel.labelEN
                
            }
           
            PararmQuery.st131=PararmQuery.MakePararmsForQuery(OntologyModel.parentNodes)

            break
        case 8:
            if LocalizedGetLanguage() == "el" {
                self.condition1.text = OntologyModel.labelGR
            }else{
                self.condition1.text = OntologyModel.labelEN
                
            }
            
            PararmQuery.s111=PararmQuery.MakePararmsForQuery(OntologyModel.parentNodes)

            break
        case 82:
            if LocalizedGetLanguage() == "el" {
                self.condition2.text = OntologyModel.labelGR
            }else{
                self.condition2.text = OntologyModel.labelEN
                
            }
            
            PararmQuery.s121=PararmQuery.MakePararmsForQuery(OntologyModel.parentNodes)

            break
        case 83:
            if LocalizedGetLanguage() == "el" {
                self.condition3.text = OntologyModel.labelGR
            }else{
                
                self.condition3.text = OntologyModel.labelEN
            }
            
            PararmQuery.s131=PararmQuery.MakePararmsForQuery(OntologyModel.parentNodes)

            break
        case 84:
            if LocalizedGetLanguage() == "el" {
                self.condition4.text = OntologyModel.labelGR
            }else{
                
                self.condition4.text = OntologyModel.labelEN
            }
            
            PararmQuery.s141=PararmQuery.MakePararmsForQuery(OntologyModel.parentNodes)

            break
        case 9:
            if LocalizedGetLanguage() == "el" {
                self.PlaceCondition1.text = OntologyModel.labelGR
            }else{
                self.PlaceCondition1.text = OntologyModel.labelEN
                
            }
            
            PararmQuery.p111=PararmQuery.MakePararmsForQuery(OntologyModel.parentNodes)

           break
        case 92:
            if LocalizedGetLanguage() == "el" {
                self.PlaceCondition2.text = OntologyModel.labelGR
            }else{
                
                self.PlaceCondition2.text = OntologyModel.labelEN
            }
            
            PararmQuery.p121=PararmQuery.MakePararmsForQuery(OntologyModel.parentNodes)

            break
        case 93:
            if LocalizedGetLanguage() == "el" {
                self.PlaceCondition3.text = OntologyModel.labelGR
            }else{
                self.PlaceCondition3.text = OntologyModel.labelEN
                
            }
            
            PararmQuery.p131=PararmQuery.MakePararmsForQuery(OntologyModel.parentNodes)

            break
        case 10:
            if LocalizedGetLanguage() == "el" {
                self.person1.text = OntologyModel.labelGR
            }else{
                self.person1.text = OntologyModel.labelEN
                
            }
            
            PararmQuery.w111=PararmQuery.MakePararmsForQuery(OntologyModel.parentNodes)

            break
        case 102:
            if LocalizedGetLanguage() == "el" {
                 self.person1.text = OntologyModel.labelGR
            }else{
                 self.person1.text = OntologyModel.labelEN
                
            }
           
            PararmQuery.w121=PararmQuery.MakePararmsForQuery(OntologyModel.parentNodes)

            break
        case 103:
            if LocalizedGetLanguage() == "el" {
                self.person3.text = OntologyModel.labelGR
            }else{
                self.person3.text = OntologyModel.labelEN
                
            }
            
            PararmQuery.w131=PararmQuery.MakePararmsForQuery(OntologyModel.parentNodes)

            break
        case 104:
            if LocalizedGetLanguage() == "el" {
                self.person4.text = OntologyModel.labelGR
            }else{
                
                self.person4.text = OntologyModel.labelEN
            }
            
            PararmQuery.w141=PararmQuery.MakePararmsForQuery(OntologyModel.parentNodes)

            break
        case 11:
            if LocalizedGetLanguage() == "el" {
                self.personPlace.text = OntologyModel.labelGR
            }else{
                
                self.personPlace.text = OntologyModel.labelEN
            }
            
            PararmQuery.l11=PararmQuery.MakePararmsForQuery(OntologyModel.parentNodes)

            break
        case 12:
            if LocalizedGetLanguage() == "el" {
                self.response1.text = OntologyModel.labelGR
            }else{
                
                self.response1.text = OntologyModel.labelEN
            }
            
            PararmQuery.rp111=PararmQuery.MakePararmsForQuery(OntologyModel.parentNodes)

            break
        case 122:
            if LocalizedGetLanguage() == "el" {
                self.response2.text = OntologyModel.labelGR
            }else{
                self.response2.text = OntologyModel.labelEN
                
            }
            
            PararmQuery.rp121=PararmQuery.MakePararmsForQuery(OntologyModel.parentNodes)

            break
        case 123:
            if LocalizedGetLanguage() == "el" {
                self.response3.text = OntologyModel.labelGR
            }else{
                
                self.response3.text = OntologyModel.labelEN
            }
            
            PararmQuery.rp131=PararmQuery.MakePararmsForQuery(OntologyModel.parentNodes)

            break
        case 124:
            if LocalizedGetLanguage() == "el" {
                 self.response4.text = OntologyModel.labelGR
            }else{
                 self.response4.text = OntologyModel.labelEN
                
            }
           
            PararmQuery.rp141=PararmQuery.MakePararmsForQuery(OntologyModel.parentNodes)

           break
        case 13:
            if LocalizedGetLanguage() == "el" {
                self.personAsk.text = OntologyModel.labelGR
            }else{
                self.personAsk.text = OntologyModel.labelEN
                
            }
            
            PararmQuery.op111=PararmQuery.MakePararmsForQuery(OntologyModel.parentNodes)

            break
        case 14:
            if LocalizedGetLanguage() == "el" {
                 self.danger.text = OntologyModel.labelGR
            }else{
                 self.danger.text = OntologyModel.labelEN
                
            }
           
            PararmQuery.orp111=PararmQuery.MakePararmsForQuery(OntologyModel.parentNodes)

            break
        case 15:
            if LocalizedGetLanguage() == "el" {
                self.danger2.text = OntologyModel.labelGR
            }else{
                self.danger2.text = OntologyModel.labelEN
                
            }
            
            PararmQuery.oro111=PararmQuery.MakePararmsForQuery(OntologyModel.parentNodes)

            
            break
        case 16:
            if LocalizedGetLanguage() == "el" {
                self.periorismos.text = OntologyModel.labelGR
            }else{
                
                self.periorismos.text = OntologyModel.labelEN
            }
            
            PararmQuery.ore111=PararmQuery.MakePararmsForQuery(OntologyModel.parentNodes)

            break
        case 17:
            if LocalizedGetLanguage() == "el" {
                self.NofPerson.text = OntologyModel.labelGR
            }else{
                self.NofPerson.text = OntologyModel.labelEN
                
            }
            //Class_415
            
            PararmQuery.n11 = PararmQuery.MakePararmsForQuery(OntologyModel.parentNodes)
            break
        default :
            
            break
        
        
        }
        
    
    }
    func queryService(alertMessage:String, moveForward:Bool){
    
        Settings.stopLoader()
        
        if(moveForward == true)
        {
           // self.pushMenu()
             self.navigationController?.popViewControllerAnimated(true)
            
        }
        else
        {
           // self.showAlertWithMessage(alertMessage)
        }

    }
    
    func IndividualCodeName(NameModel :Ontology){}
    
    
    
    func localizeUIElements ()
    {
        self.title = LocalizedString("Queries", comment: "")
        
        self.d1.text = LocalizedString("Diagnosis1", comment:"")
        self.d2.text = LocalizedString("Diagnosis2", comment:"")
        self.d3.text = LocalizedString("Diagnosis3", comment:"")
        self.d4.text = LocalizedString("Diagnosis4", comment:"")
        self.d5.text = LocalizedString("Diagnosis5", comment:"")
        self.riskF1.text = LocalizedString("RiskFactor1", comment:"")
        self.riskF2.text = LocalizedString("RiskFactor2", comment:"")
        self.riskF3.text = LocalizedString("RiskFactor3", comment:"")
        self.riskF4.text = LocalizedString("RiskFactor4", comment:"")
        self.riskF5.text = LocalizedString("RiskFactor5", comment:"")
        //self.d1.text = LocalizedString("", comment:"")
        //self.d2.text = LocalizedString("", comment:"")
        
    }
    
    
    
    func individualService(operationName:String, alertMessage:String, moveForward:Bool){
    
    }
    
}
