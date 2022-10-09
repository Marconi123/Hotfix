//
//  SmsCodeVC.swift
//  Hotfix
//
//  Created by Владислав on 9.10.22.
//

import UIKit
import FirebaseAuth

final class SmsCodeVC: UIViewController {

    // MARK: - Properties
    
    var verificationId: String?
    
    // MARK: - IBOutlets
    
    @IBOutlet weak var textLabel: UILabel!
    
    // MARK: - Life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    // MARK: - IBActions

    @IBAction func verifyCodeBtn() {
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
