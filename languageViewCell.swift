//
//  settingsViewCell.swift
//  GithubDemo
//
//  Created by lmohamed on 10/22/16.
//  Copyright © 2016 codepath. All rights reserved.
//

import UIKit

// create the protocol
protocol languageSettingsDelegate {
    func toggledLanguageSwitch(newValue:Bool)
}

class languageViewCell: UITableViewCell {
    
    @IBOutlet weak var languageSwitchLabel: UILabel!
    @IBOutlet weak var languageSwitch: UISwitch!

    // create a property to hold a reference to the listener
    var languageDelegate: languageSettingsDelegate?
    
    var languageSelected: String! {
        didSet {
            languageSwitchLabel?.text = languageSelected
        }
    }
    
    // create a function that sends the state of the switch to the delegate when it's toggled
    @IBAction func didToggleLanguageSwitch(_ sender: AnyObject) {
        
        languageSwitch.setOn(languageSwitch.isOn, animated: true)
        
        languageDelegate?.toggledLanguageSwitch(newValue: languageSwitch.isOn)
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
