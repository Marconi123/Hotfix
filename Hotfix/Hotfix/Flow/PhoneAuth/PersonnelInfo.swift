//
//  PersonnelInfo.swift
//  Hotfix
//
//  Created by Владислав on 10.10.22.
//

import UIKit
import Firebase

final class PersonnelInfo: UIViewController {
    
    // MARK: - IBOutlets
    
    @IBOutlet weak var fullNameLabel: UILabel!
    @IBOutlet weak var fullNameTF: UITextField!
    @IBOutlet weak var phoneNumberLabel: UILabel!
    @IBOutlet weak var dateOfBirthLabel: UILabel!
    @IBOutlet weak var datePicker: UIDatePicker!
    
    // MARK: - Properties
    
    let ref = Database.database().reference()

    
    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // MARK: - IBActions
    
    @IBAction func datePickerBtn(_ sender: UIDatePicker) {
    }
    
    @IBAction func saveBtn(_ sender: Any) {
    }
}
