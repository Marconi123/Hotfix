//
//  ContactsVC.swift
//  Hotfix
//
//  Created by Владислав on 28.10.22.
//

import UIKit
import Firebase

final class ContactsVC: UIViewController {
    
    // MARK: - Properties
    
    let ref: DatabaseReference = Database.database().reference(withPath: "contacts")

}
