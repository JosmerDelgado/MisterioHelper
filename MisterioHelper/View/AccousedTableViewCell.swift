//
//  AccousedTableViewCell.swift
//  MisterioHelper
//
//  Created by Josmer Delgado on 29/12/2018.
//  Copyright © 2018 Josmer Delgado. All rights reserved.
//

import UIKit

class AccousedTableViewCell: UITableViewCell {
	@IBOutlet weak var descriptiveImage: UIImageView!
	@IBOutlet weak var selectedIcon: UIImageView!
	@IBOutlet weak var accusedNameLabel: UILabel!

	override func awakeFromNib() {
        super.awakeFromNib()
		selectedIcon.image = UIImage(named: "selectedIcon")
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
//        super.setSelected(selected, animated: animated)

    }

}
