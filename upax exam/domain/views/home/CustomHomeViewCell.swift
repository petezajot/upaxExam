//
//  CustomHomeViewCell.swift
//  upax exam
//
//  Created by Sergio García Vargas on 04/05/22.
//

import UIKit

class CustomHomeViewCell: UITableViewCell {
    @IBOutlet weak var listImage: UIImageView!
    @IBOutlet weak var listName: UILabel!
    @IBOutlet weak var listLastName: UILabel!
    @IBOutlet weak var listDescription: UILabel!
    
    var results: Results? {
        didSet {
            listName.text = results?.user?.first_name
            listLastName.text = results?.user?.last_name
            listDescription.text = results?.description
            listDescription.numberOfLines = 0
            listDescription.sizeToFit()
            listImage.loadImageUsingCacheWithUrlString((results?.user?.profile_image?.medium)!)
        }
    }
}
