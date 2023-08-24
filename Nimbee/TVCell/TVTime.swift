//
//  TVTime.swift
//  Nimbee
//
//  Created by iMac on 03/08/23.
//

import UIKit

class TVTime: UITableViewCell {
    @IBOutlet weak var lblTime: UILabel!
    
    @IBOutlet weak var lblCurrentTime: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    
//    func setTime(_ time: String, isCurrent: Bool) {
//        lblTime.text = time
//        lblTime.textColor = isCurrent ? .white : .black
//        }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
