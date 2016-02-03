//
//  RetrieveIndividualVC.swift
//  Pavefs
//


import UIKit

class RetrieveIndividualVC: UIViewController, IndividualServiceDelegate ,UITableViewDelegate,UITableViewDataSource {

    var individualObj:IndividualModel = IndividualModel()
    
    @IBOutlet var tblChildren : UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
       
        self.setNavigationBarItem()
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .Add, target: self, action: "addTapped")
        
       
        self.title = LocalizedString("Individual", comment:"")
      //  self.tblChildren.backgroundColor = UIColor.clearColor()
        self.individualObj.delegate = self
        self.retrieveIndividual()
        self.tblChildren.delegate = self
        self.tblChildren.dataSource = self
    }
    
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        
        
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        
        self.tblChildren.reloadData()
        self.title = LocalizedString("Individual", comment: "")
        self.individualObj.delegate = self
        //let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        //if(appDelegate.refresheIndividualList == true)
       // {
            //appDelegate.refresheIndividualList = false
            
        self.retrieveIndividual()
            
        //}
        
        
    }
    
    func addTapped ()
    {
        print("Tapped")
        
        self.performSegueWithIdentifier("AddIndividualIdentifier", sender:nil)
    }
    
    func retrieveIndividual ()
    {
        Settings.startLoader()
        individualObj.retrieveIndividual()
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.individualObj.arrChildren.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier("ChildCellIdentifier", forIndexPath: indexPath) as! ChildCell
        
        let child:Child = self.individualObj.arrChildren[indexPath.row]
        
        self.tblChildren.separatorStyle = UITableViewCellSeparatorStyle.None
        
        
        cell.lblChildNAmeTitle.text = LocalizedString("name", comment: "")
        cell.lbChldSexTitle.text = LocalizedString("Sex", comment: "")
        
               
        cell.cellView.layer.borderWidth=1
        
        cell.lblChildName.text = child.child_code
        cell.lblChildSex.text=child.sex_label
      //  cell.btnDelete.tag = indexPath.row
       // cell.btnDelete.addTarget(self, action:"deleteChild:", forControlEvents:UIControlEvents.TouchUpInside)
        //cell.accessoryType = UITableViewCellAccessoryType.DisclosureIndicator
        print("name \(child.child_code)")
        print("sex \(child.sex_label)")
        return cell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath)
    {
        tableView.deselectRowAtIndexPath(indexPath, animated:false)
        self.individualObj.selectedChild = self.individualObj.arrChildren[indexPath.row]
        self.performSegueWithIdentifier("IndividualDetailViewIdentifier", sender:nil)
    }

    
   
    
    func individualService(operationName:String, alertMessage:String, moveForward: Bool)
    {
        Settings.stopLoader()
        if(operationName == apiMethod.RETRIEVE_INDIVIDUAL_API)
        {
            if(moveForward == true)
            {
                self.tblChildren.reloadData()
            }
            else
            {
                
                self.showAlertWithMessage(alertMessage)
            }
        }
        else if(operationName == apiMethod.DELETE_INDIVIDUAL_API)
        {
            if(moveForward == true)
            {
                
                self.retrieveIndividual()
                self.tblChildren.reloadData()
            }
            else
            {
                
                self.showAlertWithMessage(alertMessage)
            }
        }
        
    }
    
    func deleteChild (sender:UIButton)
    {
        print("Deleted")
        self.individualObj.selectedChild = self.individualObj.arrChildren[sender.tag]
        Settings.startLoader()
        individualObj.deleteIndividual()
    }
    
    func showAlertWithMessage(alertMessage:String)
    {
        let alertController = UIAlertController(title:globalConstants.alertTitle.appName, message:alertMessage, preferredStyle: UIAlertControllerStyle.Alert)
        
        alertController.addAction(UIAlertAction(title:LocalizedString("OkButton", comment:""), style: UIAlertActionStyle.Default, handler: nil))
        
        self.presentViewController(alertController, animated: true, completion: nil)
    }

    
    override func viewWillDisappear(animated: Bool) {
        super.viewWillDisappear(animated)
        
       
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    
    // MARK: - Navigation

    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?)
    {
        
        if(segue.identifier == "IndividualDetailViewIdentifier")
        {
            let individualDetailView = segue.destinationViewController as! IndividualDetailVC;
            individualDetailView.individualObj = self.individualObj
            individualDetailView.child = self.individualObj.selectedChild
        }
        
    }
    

}
