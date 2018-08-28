//
//  ContactsListVC.swift
//  ContactsBookCD
//
//  Created by user on 25.08.2018.
//  Copyright © 2018 user. All rights reserved.
//

import UIKit

class ContactsListVC: UIViewController {

    
    @IBOutlet weak var tableView: UITableView!
    
    var contacts = [Contact]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        getContacts()
        NotificationCenter.default.addObserver(self, selector: #selector(reloadDataInTable(_:)), name: NOTIF_SAVED_DATA_SUCCESS, object: nil)
    }
    
    @IBAction func createButtonPressed(_ sender: Any) {
        guard let createContactVC = storyboard?.instantiateViewController(withIdentifier: "CreateContactVC") as? CreateContactVC else { return }
        present(createContactVC, animated: true, completion: nil)
    }
    
    @objc func reloadDataInTable(_ notif: Notification) {
        getContacts()
        tableView.reloadData()
    }
    
    func getContacts() {
        let contacts = PersistenceManager.shared.fetch(Contact.self)
        self.contacts = contacts
    }
    
}

extension ContactsListVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return contacts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let contact = contacts[indexPath.row]
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "contactCell", for: indexPath) as? ContactCell else { return UITableViewCell() }
        cell.configureCell(contact: contact)
        return cell
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        return .none
    }
    
    func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        let deletAction = UITableViewRowAction(style: .destructive, title: "Delete") { (tableRow, indexPath) in
            PersistenceManager.shared.delete(object: self.contacts[indexPath.row])
        }
        deletAction.backgroundColor = #colorLiteral(red: 1, green: 0.02831841314, blue: 0.03442573562, alpha: 1)
        return [deletAction]
    }
}


