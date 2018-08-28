//
//  ContactsListVC.swift
//  ContactsBookCD
//
//  Created by user on 25.08.2018.
//  Copyright © 2018 user. All rights reserved.
//

import UIKit

class CreateContactVC: UIViewController {

    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var phoneTextField: UITextField!
    @IBOutlet weak var companyTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    @IBAction func cancelButtonPressed(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    

    @IBAction func saveButtonPressed(_ sender: Any) {
        saveContact()
        dismiss(animated: true, completion: nil)
    }
    
    func saveContact() {
        guard var name = nameTextField.text else { return }
        guard let phone = phoneTextField.text else { return }
        guard let company = companyTextField.text else { return }
        if name == "" {
            name = phone
        }
        let contact = Contact(context: PersistenceManager.shared.context)
        contact.name = name
        contact.phone = phone
        contact.company = company
        
        PersistenceManager.shared.save()
    }
    
    
}

