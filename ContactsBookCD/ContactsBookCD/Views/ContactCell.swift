//
//  ContactCell.swift
//  ContactsBookCD
//
//  Created by user on 25.08.2018.
//  Copyright © 2018 user. All rights reserved.
//

import UIKit

class ContactCell: UITableViewCell {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var phoneLabel: UILabel!
    @IBOutlet weak var companyLabel: UILabel!
    
    func configureCell(contact: Contact) {
        nameLabel.text = contact.name
        phoneLabel.text = contact.phone
        companyLabel.text = contact.company
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
