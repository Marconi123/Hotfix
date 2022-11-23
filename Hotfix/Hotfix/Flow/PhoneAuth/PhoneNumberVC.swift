//
//  PhoneNumberVC.swift
//  Hotfix
//
//  Created by Владислав on 9.10.22.
//

import Firebase
import UIKit

final class PhoneNumberVC: BasicVC {
    // MARK: - Properties
    
    var phoneNumber: String?
    var currentVerificationId: String?
    var ref: DatabaseReference!
    
    // MARK: - IBOutlets
    
    @IBOutlet var textLabel: UILabel!
    @IBOutlet var phoneTF: UITextField!
    
    // MARK: - Life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        userVerification()
    }
    
    // MARK: - IBActions
    
    @IBAction func getCodeBtnAct(_ sender: UIButton) {
        phoneNumber = "+375\(phoneTF.text ?? "Empty")"
        guard phoneNumber != nil else {
            return
        }
        guard VerificationManager.isValidPhoneNumber(phone: phoneNumber!) else {
            return alert(title: "Wrong format",
                         message: "Wrong format",
                         style: .alert)
        }
        PhoneAuthProvider.provider().verifyPhoneNumber(phoneNumber!, uiDelegate: nil) {
            verificationID, error in
            if error != nil {
                print(error?.localizedDescription ?? "Is empty")
            } else {
                self.currentVerificationId = verificationID
                self.performSegue(withIdentifier: "openSms", sender: nil)
            }
        }
    }
    
    // MARK: - Private functions
    
    private func setupUI() {
        navigationController?.navigationBar.isHidden = true
        textLabel.text = "Please, specify a phone number to receive a verification code. Phone number example:\n 291234567"
        textLabel.numberOfLines = 0
    }
    
    private func userVerification() {
        Auth.auth().addStateDidChangeListener { [weak self] _, user in
            guard let _ = user else {
                return
            }
            self?.performSegue(withIdentifier: "openTabBar", sender: nil)
        }
    }
    
    // MARK: - Navigation
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let vc = segue.destination as? SmsCodeVC, let id = currentVerificationId {
            vc.verificationId = id
        }
    }
}
