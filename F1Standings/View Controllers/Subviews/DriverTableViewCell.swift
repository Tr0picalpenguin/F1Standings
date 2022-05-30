//
//  DriverTableViewCell.swift
//  F1Standings
//
//  Created by Scott Cox on 5/30/22.
//

import UIKit

class DriverTableViewCell: UITableViewCell {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var rankLabel: UILabel!
    @IBOutlet weak var nationalityLabel: UILabel!
    @IBOutlet weak var constructorLabel: UILabel!
    
    func setViews(with model: Driver) {
        nameLabel.text = "\(model.driverDetails.givenName) \(model.driverDetails.familyName)"
        rankLabel.text = model.position
        nationalityLabel.text = model.driverDetails.nationality
        constructorLabel.text = model.constructors.first?.name
    }
    
    
    }


