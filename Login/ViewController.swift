//
//  ViewController.swift
//  Login
//
//  Created by SaiManasa on 1/22/24.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var createAccountButton: UIButton!
    @IBOutlet weak var forgotPasswordButton: UIButton!
    @IBOutlet weak var NameOutlet: UITextField!
    @IBOutlet weak var passwordOutlet: UITextField!
    var defaults = UserDefaults.standard
    
    override func viewDidLoad() {
        super.viewDidLoad()
        NameOutlet.text = ""
        passwordOutlet.text = ""
//        let dict : [String : Any] = ["Password": "pw", "Hours completed": 0, "Hour goal": 0]
//        defaults.set(dict, forKey: "Akilan")
        // Do any additional setup after loading the view.
    }
    
//    @IBAction func forgotUsernameAction(_ sender: Any) {
//        performSegue(withIdentifier: "ForgotUsernameorPassword", sender: sender)
//    }
//    
    @IBAction func loginAction(_ sender: Any) {
        
//        let logDict: [String: Any] = defaults.dictionary(forKey: NameOutlet.text ?? "")!
        let logDict = defaults.dictionary(forKey: NameOutlet.text ?? "")
        if ((logDict?.isEmpty) != nil){
            print("logDict went through")
            if logDict?["Password"] as! String == passwordOutlet.text ?? ""{
                print("password was correct")
                performSegue(withIdentifier: "loginSeg", sender: sender)
            }
            else{
                let alert = UIAlertController(title: "Invalid username or password", message: "please try again", preferredStyle: UIAlertController.Style.alert)
                alert.addAction(UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: nil))
                self.present(alert, animated: true, completion: nil)
            }
        }
        else{
            let alert = UIAlertController(title: "Invalid username or password", message: "please try again", preferredStyle: UIAlertController.Style.alert)
            alert.addAction(UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
//        if defaults.dictionary(forKey: NameOutlet.text) != nil{
//            
//        }
        
    }
    @IBAction func createAccountAction(_ sender: Any) {
        performSegue(withIdentifier: "createAccountSeg", sender: sender)
    }
    @IBAction func forgotPasswordAction(_ sender: Any) {
        performSegue(withIdentifier: "ForgotUsernameorPassword", sender: sender)
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let sender = sender as? UIButton else {return}
        guard let username = NameOutlet.text else {return}
        if sender == forgotPasswordButton {
            segue.destination.navigationItem.title = "Forgot password"
        }
        else if sender == loginButton{
//            segue.destination. = NameOutlet.text
//            broken
            if let hoursVC = segue.destination as? HoursViewController{
                hoursVC.nameVar = username
            }
        }
        
//        else if sender == forgotUsernameButton {
//            segue.destination.navigationItem.title = "Forgot username"
        else {
//            segue.destination.navigationItem.title = NameOutlet.text
        }
        
    }
    
}

