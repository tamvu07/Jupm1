//
//  ProfileTableCell.swift
//  Jump1
//
//  Created by vuminhtam on 5/15/21.
//

import UIKit

class ProfileTableCell: UITableViewCell {
    
    
    @IBOutlet weak var backgroundImageView: UIView!
    
    @IBOutlet weak var nameLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
