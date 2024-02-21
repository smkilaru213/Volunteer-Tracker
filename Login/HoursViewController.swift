//
//  HoursViewController.swift
//  Login
//
//  Created by SaiManasa on 1/22/24.
//

import UIKit

class HoursViewController: UIViewController {
    var nameVar = ""
    var fullDisplayedTxt = ""
    @IBOutlet weak var resetButton: UIButton!
    @IBOutlet weak var addHoursButton: UIButton!
   
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var fullLabel: UILabel!
    @IBOutlet weak var goalTextBox: UITextField!
    var hoursCompleted: Int!
    var hoursTotal: Int!
    var defaults = UserDefaults.standard
    var currDict:[String:Any]!
    override func viewDidLoad() {
        super.viewDidLoad()
        currDict = defaults.dictionary(forKey: nameVar)
        hoursCompleted = currDict!["Hours completed"] as? Int
        hoursTotal = currDict!["Hour goal"] as? Int
        if hoursTotal == 0 {
            fullDisplayedTxt = "Enter goal number of hours!"
            addHoursButton.isHidden = true
            resetButton.isHidden = true
            
        }
        else{
            goalTextBox.isHidden = true
            fullDisplayedTxt = "\(hoursCompleted ?? 0) out of \(hoursTotal ?? 0) completed"
        }
        goalTextBox.autocorrectionType = .no
        fullLabel.text = fullDisplayedTxt
        nameLabel.text = "\(nameVar)'s Hours"
        
        
        
        // Do any additional setup after loading the view.
    }
    @IBAction func goalHoursEntered(_ sender: Any) {
        goalTextBox.isHidden = true
        addHoursButton.isHidden = false
        resetButton.isHidden = false
//        broken
        currDict["Hour goal"] = Int(goalTextBox.text!)
        defaults.set(currDict, forKey: nameVar)
        hoursTotal = currDict!["Hour goal"] as? Int
        fullDisplayedTxt = "\(hoursCompleted ?? 0) out of \(hoursTotal ?? 0) completed"
        fullLabel.text = fullDisplayedTxt
        
    }
    @IBAction func addHoursPressed(_ sender: Any) {
        hoursCompleted += 1
        fullDisplayedTxt = "\(hoursCompleted ?? 0) out of \(hoursTotal ?? 0) completed"
        fullLabel.text = fullDisplayedTxt
        currDict["Hours completed"] = hoursCompleted
//        print(currDict["Hours "])
        defaults.set(currDict, forKey: nameVar)
    }
    @IBAction func resetPressed(_ sender: Any) {
        goalTextBox.text = ""
        hoursCompleted = 0
        hoursTotal = 0
        currDict["Hour goal"] = 0
        currDict["Hours completed"] = 0
        fullDisplayedTxt = "Enter goal number of hours!"
        fullLabel.text = fullDisplayedTxt
        addHoursButton.isHidden = true
        goalTextBox.isHidden = false
        resetButton.isHidden = true
        defaults.set(currDict, forKey: nameVar)
    }
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        print("segue ran")
//        
//    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
