//
//  BasicVC.swift
//  Hotfix
//
//  Created by Владислав on 10.10.22.
//

import UIKit

class BasicVC: UIViewController {
     func alert(title: String, message: String, style: UIAlertController.Style) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: style)
        let action = UIAlertAction(title: "Ok", style: .default) { _ in
        }
        alertController.addAction(action)
        self.present(alertController, animated: true, completion: nil)
    }
}

