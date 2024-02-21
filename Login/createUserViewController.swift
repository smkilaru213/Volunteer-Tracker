//
//  createUserViewController.swift
//  Login
//
//  Created by SaiManasa on 1/22/24.
//

import UIKit

class createUserViewController: UIViewController {


    @IBOutlet weak var usernameLabel: UILabel!
    @IBOutlet weak var usernameOutlet: UITextField!
    @IBOutlet weak var passwordLabel: UILabel!
    @IBOutlet weak var passwordOutlet: UITextField!
    var defaults = UserDefaults.standard
    @IBOutlet weak var acLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        usernameOutlet.autocorrectionType = .no
        passwordOutlet.autocorrectionType = .no
        passwordLabel.isHidden = true
        passwordOutlet.isHidden = true
        acLabel.isHidden = true
        // Do any additional setup after loading the view.
    }
    
    @IBAction func usernameTyped(_ sender: Any) {
        let logDict = defaults.dictionary(forKey: usernameOutlet.text ?? "")
        if ((logDict?.isEmpty) != nil){
            let alert = UIAlertController(title: "Username already exists", message: "please try a different username", preferredStyle: UIAlertController.Style.alert)
            alert.addAction(UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
            
        }
        else{
            passwordOutlet.isHidden = false
            passwordLabel.isHidden = false
            
//            print("logDict went through")
//            if logDict?["Password"] as! String == passwordOutlet.text ?? ""{
//                print("password was correct")
//                performSegue(withIdentifier: "loginSeg", sender: sender)
//            }
        }
    }
    
    @IBAction func passwordTyped(_ sender: Any) {
        acLabel.isHidden = false
        passwordOutlet.isHidden = true
        passwordLabel.isHidden = true
        usernameOutlet.isHidden = true
        usernameLabel.isHidden = true
        let dict : [String : Any] = ["Password" : passwordOutlet.text!, "Hours completed": 0, "Hour goal": 0]
        defaults.set(dict, forKey: usernameOutlet.text ?? "")
    }
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
