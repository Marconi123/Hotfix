//
//  PhoneNumberVC.swift
//  Hotfix
//
//  Created by Владислав on 9.10.22.
//

import UIKit
import FirebaseAuth

final class PhoneNumberVC: UIViewController {
    
    // MARK: - Properties
    
    var phoneNumber: String?
    var currentVerificationId: String?
    
    // MARK: - IBOutlets
    
    @IBOutlet weak var textLabel: UILabel!
    // MARK: - Life cycle

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // MARK: - IBActions
    
    
    @IBAction func getCodeBtnAct(_ sender: UIButton) {
        guard phoneNumber != nil else {
            return
        }
        PhoneAuthProvider.provider().verifyPhoneNumber(phoneNumber!, uiDelegate: nil) {
            (verificationID, error) in
            if error != nil {
                print(error?.localizedDescription ?? "Is empty")
            } else {
                self.currentVerificationId = verificationID
                self.performSegue(withIdentifier: "goToSmsCode", sender: nil)
            }
        }
    }
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let vc = segue.destination as? SmsCodeVC
        vc?.verificationId = currentVerificationId
    }

}
