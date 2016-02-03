//
//  QueriesVC.swift
//  Pavefs
//


import UIKit

class QueriesVC: UIViewController ,QueryServiceDelegate ,QueryCellBtns ,UITableViewDataSource,UITableViewDelegate{

    
    @IBOutlet weak var lblQueryTitle: UILabel!
    @IBOutlet weak var tblQuery: UITableView!
     let querieObj:QueryModel = QueryModel()
     var queryResult :Query!
     var queryID :String = " "
     var viewQueryId:String!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        viewQueryId = "-1"
        print("QueriesVC")
        // Do any additional setup after loading the view.
        self.setNavigationBarItem()
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .Add, target: self, action: "addTapped")
        
        self.title = LocalizedString("Queries", comment:"")
        
        self.lblQueryTitle.text=LocalizedString("Queries", comment:"")
        
        
    }
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        Settings.startLoader()
        self.localizedfields()
        self.querieObj.delegate = self
        self.tblQuery.delegate = self
        self.querieObj.RetrieveQuerylist()
    }
    
    func addTapped ()
    {
        print("Tapped")
        
        self.performSegueWithIdentifier("AddQueryIdentifier", sender:nil)
    }
    
    func popToPreviousController(sender:UIButton)
    {
        self.navigationController?.popViewControllerAnimated(true)
    }
    
    override func viewWillDisappear(animated: Bool) {
        super.viewWillDisappear(animated)
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.querieObj.arrQuery.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier("mycell", forIndexPath: indexPath) as! QueryCell

        
        
        cell.btnShow.setTitle(LocalizedString("show", comment: ""), forState: UIControlState.Normal)
        cell.btnStatus.setTitle(LocalizedString("Status", comment: ""), forState: UIControlState.Normal)
        cell.lblNametitle.text = LocalizedString("name", comment: "")
        cell.lblCreatedTitle.text = LocalizedString("created", comment: "")
        
        if self.querieObj.arrQuery[indexPath.row].status == "1"{
        
            cell.btnStatus.userInteractionEnabled = true
            cell.TickGreenticke.hidden = false
            cell.ArrowImg.hidden = false
            cell.statusImg.hidden = true
        }else{
            cell.btnStatus.userInteractionEnabled = false
            cell.TickGreenticke.hidden = true
            cell.ArrowImg.hidden = true
            cell.statusImg.hidden = false
        }
        
        cell.delegate = self
        
        cell.btnShow.tag = indexPath.row
        cell.btnStatus.tag = indexPath.row
        
        cell.selectionStyle =  UITableViewCellSelectionStyle.None
         cell.selectedBackgroundView?.backgroundColor = UIColor.whiteColor()
        //cell.userInteractionEnabled = false
        cell.lblName?.text = self.querieObj.arrQuery[indexPath.row].queryName
        cell.lblCreated.text=self.querieObj.arrQuery[indexPath.row].createdAt
        
          cell.cellview.layer.borderWidth=1
        
        return cell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath)
    {
        
    }

    
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat
    {
        return 100.0;//Choose your custom row height
    }
    
    
    func queryService(alertMessage:String, moveForward:Bool)
    {
       //// Settings.stopLoader()
         print("self.querieObj.arrQuery.count(\(self.querieObj.arrQuery.count))" )
        
        Settings.stopLoader()
        self.tblQuery.reloadData()
    }
    
    
    func showButtonTapped(btntag:Int){
        print("Show Button From Delegate with tag \(btntag)")
        let query = querieObj.arrQuery[btntag]
        viewQueryId = query.queryId
        
        self.performSegueWithIdentifier("ViewQueryIdentifier", sender: nil)
        
        viewQueryId = "-1";
    }
    func statusButtonTapped(btntag:Int){
        print("Status Button From Delegate with tag \(btntag)")
//        self.querieObj.delegate = self
//        self.querieObj.RetrieveQueryResult(self.querieObj.arrQuery[btntag].queryId)
        
        queryID = self.querieObj.arrQuery[btntag].taskId
       self.performSegueWithIdentifier("resultQueryIdentifier", sender:nil)
        
        
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject!) {
        
        if let segueId = segue.identifier
        {
            if(segueId == "ViewQueryIdentifier")
            {
                let viewQueryVC = segue.destinationViewController as! ViewQueryVC
                viewQueryVC.queryId = "\(viewQueryId)"
                //!!! Create a global persistant instance of ontologyModel to cache the OntologyTree
                //viewQueryVC.ontologyModel = ontologyModel
            }
            else if segue.identifier == "resultQueryIdentifier"
            {
                let vc = segue.destinationViewController as! QueryResultVC
                vc.QueryToShow = queryID
            
            }
        }

}

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

    func localizedfields(){
        self.title = LocalizedString("Queries", comment: "")
        self.lblQueryTitle.text = LocalizedString("Queries", comment: "")
    
    }
    
    
}
