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
    
    @IBOutlet private weak var fullNameLabel: UILabel!
    @IBOutlet private weak var fullNameTF: UITextField!
    @IBOutlet private weak var phoneNumberLabel: UILabel!
    @IBOutlet private weak var dateOfBirthLabel: UILabel!
    @IBOutlet private weak var datePicker: UIDatePicker!
    
    // MARK: - Properties
    
    private let ref = Database.database().reference()

    
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
