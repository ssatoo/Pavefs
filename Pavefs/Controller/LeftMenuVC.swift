//
//  LeftMenuVC.swift
//  Pavefs
//



import UIKit

enum LeftMenu: Int {
    /*case Home = 0
    case RetrieveIndividual
    case Ontology
    case UpdateProfile
    case ChangePassword
    case Signout*/
    
    case  Profile = 0
    case Individual
    case Queries
    case Help
    case About
    case Logout
  
    
}

protocol LeftMenuProtocol : class {
    func changeViewController(menu: LeftMenu)
}

class LeftMenuVC : UIViewController, LeftMenuProtocol, ServiceAPICallDelegate {
    
    
    @IBOutlet weak var imgView: UIImageView!
    @IBOutlet weak var tableView: UITableView!
    
   
    
    var menus = [
        LocalizedString("profile", comment:""),
        LocalizedString("Individual", comment:""),
        LocalizedString("Queries", comment:""),
        LocalizedString("help", comment:""),
        LocalizedString("about", comment:""),
       // NSLocalizedString("ChangePassword", comment:""),
        LocalizedString("Logout", comment:"")]
    
    var menuImage = ["profile", "individuals", "queries", "help", "info", "logout"]
    

    var RetrieveIndividualVC : UIViewController!
    var ProfileVC: UIViewController!
    var QueriesVC: UIViewController!
    var Help2VC: UIViewController!
    var About2VC: UIViewController!
    var ChangePasswordVC: UIViewController!
    
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    func localizedFields(){
        menus = [
            LocalizedString("profile", comment:""),
            LocalizedString("Individual", comment:""),
            LocalizedString("Queries", comment:""),
            LocalizedString("help", comment:""),
            LocalizedString("about", comment:""),
            // NSLocalizedString("ChangePassword", comment:""),
            LocalizedString("Logout", comment:"")]
        self.tableView.reloadData()

    }
    
    
    func UIColorFromRGB(rgbValue: UInt) -> UIColor {
        return UIColor(
            red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
            green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
            blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
            alpha: CGFloat(1.0)
        )
    }
    
   // view.backgroundColor =  UIColorFromRGB(0x66CCFF)
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        self.imgView.layer.masksToBounds = true
        self.imgView.layer.borderWidth = 3.0
        self.imgView.layer.borderColor = UIColor.lightGrayColor().CGColor
        self.imgView.layer.cornerRadius = 10.0
        
        
        self.view.backgroundColor = UIColorFromRGB(0x1A94D1)
       // self.view.backgroundColor = UIColor.darkGrayColor()
        self.tableView.backgroundColor = UIColor.clearColor()
        //self.tableView.separatorColor = UIColor.blackColor()
        self.tableView.scrollEnabled = false
        
        let storyboard = UIStoryboard(name:"Main", bundle: nil)
        
        
        let profileVC = storyboard.instantiateViewControllerWithIdentifier("ProfileViewSID")
        self.ProfileVC = UINavigationController(rootViewController: profileVC)
        
        let QueriesVC = storyboard.instantiateViewControllerWithIdentifier("QueriesViewSID")
        self.QueriesVC = UINavigationController(rootViewController:QueriesVC)
        
        let Help2VC = storyboard.instantiateViewControllerWithIdentifier("Help2ViewSID")
        self.Help2VC = UINavigationController(rootViewController: Help2VC)
        
        let About2VC = storyboard.instantiateViewControllerWithIdentifier("About2ViewSID")
        self.About2VC = UINavigationController(rootViewController: About2VC)
        
        let changePasswordVC = storyboard.instantiateViewControllerWithIdentifier("ChangePasswordViewSID")
        self.ChangePasswordVC = UINavigationController (rootViewController: changePasswordVC)
        
        
        
        self.tableView.registerCellClass(BaseTableViewCell.self)
    }
    
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        self.localizedFields()
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return menus.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell
    {
        let cell: BaseTableViewCell = BaseTableViewCell(style: UITableViewCellStyle.Subtitle, reuseIdentifier: BaseTableViewCell.identifier)
        cell.backgroundColor = UIColor.clearColor()
        cell.textLabel?.font = UIFont(name: "TrebuchetMS-bold", size:15.0)
        cell.textLabel?.textColor = UIColor.whiteColor()
        cell.textLabel?.text = menus[indexPath.row]
        cell.imageView?.image = UIImage(named:menuImage[indexPath.row])
        return cell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        if let menu = LeftMenu(rawValue: indexPath.item) {
            self.changeViewController(menu)
        }
    }
    
    func changeViewController(menu: LeftMenu) {
        switch menu {
        case .Individual:
            self.slideMenuController()?.changeMainViewController(self.RetrieveIndividualVC, close: true)
            break
            
        case .Profile:
            self.slideMenuController()?.changeMainViewController(self.ProfileVC, close: true)
            break
            
        case .Queries:
            self.slideMenuController()?.changeMainViewController(self.QueriesVC, close: true)
            break
            
        case .Help:
            self.slideMenuController()?.changeMainViewController(self.Help2VC, close: true)
            break
            
        case .About:
            self.slideMenuController()?.changeMainViewController(self.About2VC, close: true)
            break

            
//        case .ChangePassword:
//            self.slideMenuController()?.changeMainViewController(self.ChangePasswordVC, close: true)
//            break
        
        case .Logout:
            self.logout()
            break
            
        default:
            break
        }
    }
    
    func logout()
    {
       Settings.startLoader()
        
        
        let serviceRequest = ServiceMethod.generateLogoutRequest(globalConstants.deviceType)
        
        let serviceCall:ServiceAPI = ServiceAPI()
        serviceCall.apiDelegate = self;
        serviceCall.sendRequestToServer(serviceRequest, operationName:apiMethod.LOGOUT_API)
    }
    
    func serviceCallDidFinish(response:String, operationName:String)
    {
        
        Settings.stopLoader()
        
        let responseDic:Dictionary <String, String> = Utility.responseStringToDictionary(response)
        
        if(responseDic["success"] == "true")
        {
            Settings.userLoggedOut()
            
            self.slideMenuController()?.navigationController?.popToRootViewControllerAnimated(true)
            
        }
        else
        {
            self.slideMenuController()?.closeLeft()
            self.showAlertWithMessage("Logout Failed")
        }
        
        
    }
    
    func serviceCallDidFail(error:String, operationName:String)
    {
        PKHUD.sharedHUD.hide()
        self.slideMenuController()?.closeLeft()
        self.showAlertWithMessage(error)
    }
    
    func showAlertWithMessage(alertMessage:String)
    {
        let alertController = UIAlertController(title:globalConstants.alertTitle.appName, message:alertMessage, preferredStyle: UIAlertControllerStyle.Alert)
        
        alertController.addAction(UIAlertAction(title:LocalizedString("OkButton", comment:""), style: UIAlertActionStyle.Default, handler: nil))
        
        self.presentViewController(alertController, animated: true, completion: nil)
    }

    
}

