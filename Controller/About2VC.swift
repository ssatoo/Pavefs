//
//  About2VC.swift
//  Pavefs
//


import UIKit

class About2VC: UIViewController {
    
     @IBOutlet var txtViewAbout : UITextView!
    @IBOutlet var vLbl: UILabel!
    
    @IBAction func enAction(sender: AnyObject) {
        print("enAction")
        
        LocalizedSetLanguage("en")
        localizeUIElements()
        
    }
    
   
    @IBAction func elAction(sender: AnyObject) {
        LocalizedSetLanguage("el")
        self.localizeUIElements()
        localizeUIElements()
        
    }
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.setNavigationBarItem()
        self.title = LocalizedString("about", comment:"")
        self.localizeUIElements()
        self.txtViewAbout.editable = false
        
        
        let nsObject: AnyObject? = NSBundle.mainBundle().infoDictionary!["CFBundleShortVersionString"]
        
        //Then just cast the object as a String, but be careful, you may want to double check for nil
        let version = nsObject as! String
        
        self.vLbl.text = version
        
    }
    
    func popToPreviousController(sender:UIButton)
    {
        self.navigationController?.popViewControllerAnimated(true)
    }
    
    func localizeUIElements ()
    {
        self.txtViewAbout.text = LocalizedString("AboutText", comment:"")
        self.title = LocalizedString("about", comment:"")
        
    }
    
    override func viewWillDisappear(animated: Bool) {
        super.viewWillDisappear(animated)
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
