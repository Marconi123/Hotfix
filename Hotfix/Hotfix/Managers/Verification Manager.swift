//
//  Verification Manager.swift
//  Hotfix
//
//  Created by Владислав on 10.10.22.
//

import Foundation

enum VerificationManager {
    
    static func isValidPhoneNumber (phone: String) -> Bool {
        let phoneRegex = "^[0-9 +]{13}$"
        let emailPred = NSPredicate(format: "SELF MATCHES %@", phoneRegex)
        return emailPred.evaluate(with: phone)
    }
}
