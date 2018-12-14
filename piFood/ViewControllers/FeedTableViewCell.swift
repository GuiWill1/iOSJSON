//
//  FeedTableViewCell.swift
//  piFood
//
//  Created by Guilhermy William Andrade on 14/12/18.
//  Copyright © 2018 Guilhermy William Andrade. All rights reserved.
//

import UIKit

class FeedTableViewCell: UITableViewCell {
    
    @IBOutlet weak var nomeLabel: UILabel!
    @IBOutlet weak var precoLabel: UILabel!
    @IBOutlet weak var coutLabel: UILabel!
    @IBOutlet weak var stepper: UIStepper!
    
   
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    @IBAction func stepperAction(_ sender: UIStepper) {
        coutLabel.text = "\(Int(stepper.value))"
    }
    
}
