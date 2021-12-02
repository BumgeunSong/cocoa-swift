//
//  DeckTableCell.swift
//  Sprep_2
//
//  Created by Bumgeun Song on 2021/12/02.
//

import UIKit

class DeckTableCell: UITableViewCell {

    @IBOutlet weak var questionNumLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        
        if questionNumLabel == nil {
            print("It's nil!")
        }
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
