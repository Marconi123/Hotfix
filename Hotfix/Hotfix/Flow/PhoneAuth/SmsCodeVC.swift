//
//  SmsCodeVC.swift
//  Hotfix
//
//  Created by Владислав on 9.10.22.
//

import FirebaseAuth
import UIKit

final class SmsCodeVC: BasicVC {
    // MARK: - Properties

    var verificationId: String?

    // MARK: - IBOutlets

    @IBOutlet var textLabel: UILabel!
    @IBOutlet var smsCodeTF: UITextField!
    
    // MARK: - Life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }

    // MARK: - IBActions

    @IBAction func verifyCodeBtn() {
        guard let code = smsCodeTF.text, verificationId != nil else {
            return
        }
        let credential = PhoneAuthProvider.provider().credential(withVerificationID: verificationId!, verificationCode: code)
        Auth.auth().signIn(with: credential) { _, error in
            if error != nil {
                self.alert(title: "Error", message: "Invalid code", style: .alert)
                print(error?.localizedDescription ?? "Is empty")
            } else {
                self.performSegue(withIdentifier: "openPersonnel", sender: nil)
            }
        }
    }
    
    private func setupUI() {
        textLabel.text = "Verification code is sent within 1 minute. Please, input it and verify."
        textLabel.numberOfLines = 0
    }
}
