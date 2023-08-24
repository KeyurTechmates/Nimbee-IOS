//
//  RecentSearchCell.swift
//  Nimbee
//
//  Created by iMac on 28/07/23.
//

import UIKit

class RecentSearchCell: UITableViewCell {
    
    
    @IBOutlet weak var lblLocation: UILabel!
    
    @IBOutlet weak var lblRecentDay: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
