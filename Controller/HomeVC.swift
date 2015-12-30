//
//  HomeVC.swift
//  Pavefs


import UIKit

class HomeVC: UIViewController ,ProfileServiceDelegate {

    
    let profileObj:ProfileModel = ProfileModel()
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
       
        //self.navigationController?.navigationBarHidden = false;
        //Utility.addSlideMenuButtonAndSetTitle(self, title:"home")
        self.setNavigationBarItem()
        self.title = LocalizedString("home", comment:"")

        profileObj.delegate = self
        Settings.startLoader()
        profileObj.retrieveUserProfile()
        
        
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        print("Controllers")
        print(self.navigationController?.viewControllers)
    }
    
    /*func onSlideMenuButtonPressed (sender:UIButton)
    {
        self.navigationController?.popViewControllerAnimated(true)
    }
    
    func popToPreviousController(sender:UIButton)
    {
        self.navigationController?.popViewControllerAnimated(true)
    }*/
    
    override func viewWillDisappear(animated: Bool) {
        super.viewWillDisappear(animated)
        
        //self.navigationController?.navigationBarHidden = true;
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    func profileService(operationName:String, alertMessage:String, moveForward:Bool)
    {
        Settings.stopLoader()
        
        if(operationName == apiMethod.RETRIEVE_PROFILE_API)
        {
            if(moveForward == true)
            {
               // self.setupUserDetail()
                Settings.SetUserCategory(self.profileObj.user.user_category)
                
            }
            else
            {
                self.showAlertWithMessage(alertMessage)
            }
        }
        else if(operationName == apiMethod.UPDATE_PROFILE_API)
        {
            self.showAlertWithMessage(alertMessage)
        }
    }
    
    func showAlertWithMessage(alertMessage:String)
    {
        let alertController = UIAlertController(title:globalConstants.alertTitle.appName, message:alertMessage, preferredStyle: UIAlertControllerStyle.Alert)
        
        alertController.addAction(UIAlertAction(title:LocalizedString("OkButton", comment:""), style: UIAlertActionStyle.Default, handler: nil))
        
        self.presentViewController(alertController, animated: true, completion: nil)
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
