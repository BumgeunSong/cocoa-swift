//
//  DeckTableViewCell.swift
//  Sprep_2
//
//  Created by Bumgeun Song on 2021/12/01.
//

import UIKit

class DeckTableViewCell: UITableViewCell {
    @IBOutlet weak var questionNumberLabel: UILabel!
    @IBOutlet weak var questionNumLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        if questionNumLabel == nil {
                print("No question label")
        } else {
            questionNumLabel.text = "testtest"
        }
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
