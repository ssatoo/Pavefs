//
//  HelpVC.swift
//  Pavefs
//

import UIKit

class HelpVC: UIViewController {

     @IBOutlet var txtViewHelp : UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.navigationController?.navigationBarHidden = false;
        Utility.prepareNavBarForControllerWithTitleAndBackButton(self, title:"help")
        self.localizeUIElements()
        self.txtViewHelp.editable = false
        self.txtViewHelp.scrollEnabled = true
        
    }
    
    func popToPreviousController(sender:UIButton)
    {
        self.navigationController?.popViewControllerAnimated(true)
    }
    
    func localizeUIElements ()
    {
        self.txtViewHelp.text = LocalizedString("HelpText", comment:"")
        
    }
    
    override func viewWillDisappear(animated: Bool) {
        super.viewWillDisappear(animated)
        
        self.navigationController?.navigationBarHidden = true;
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
