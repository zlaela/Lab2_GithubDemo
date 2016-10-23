//
//  starsViewCell.swift
//  GithubDemo
//
//  Created by lmohamed on 10/22/16.
//  Copyright © 2016 codepath. All rights reserved.
//

import UIKit

// create the protocol
protocol starSettingsDelegate {
    func updateStarSetting(newValue: Int)
}

class starsViewCell: UITableViewCell {

    
    @IBOutlet weak var minimumStarsLabel: UILabel!
    @IBOutlet weak var minimumStarsSlider: UISlider!
    
    // create a property to hold a reference to the listener
    var starsDelegate: starSettingsDelegate?
    
    
    // create a function when the slider moves to pass the value to the delegate
    @IBAction func didMoveStarSlider(_ sender: AnyObject) {
        starsDelegate?.updateStarSetting(newValue: Int(minimumStarsSlider.value))
        minimumStarsLabel.text = "Minimum \(Int(minimumStarsSlider.value)) stars only"
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
