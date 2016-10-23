//
//  SettingsViewController.swift
//  GithubDemo
//
//  Created by lmohamed on 10/22/16.
//  Copyright © 2016 codepath. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, starSettingsDelegate, languageSettingsDelegate {

    @IBOutlet weak var settingsTableView: UITableView!
    
    @IBAction func onCancelButton(_ sender: AnyObject) {
        // Dismiss the current view controller
        dismiss(animated: true, completion: nil)
    }
    @IBAction func onSearchButton(_ sender: AnyObject) {
        // Dismiss the current view controller
        dismiss(animated: true, completion: nil)
    }
    
    var searchSettings = GithubRepoSearchSettings()
    var minStars = Int()
    var starDelegate: starSettingsDelegate?
    var languageDelegate: languageSettingsDelegate?
    
    var languageSwitchCurrentValue = false

    override func viewDidLoad() {

        super.viewDidLoad()

        settingsTableView.dataSource = self
        settingsTableView.delegate = self
        
    }
    
    
    func updateStarSetting(newValue: Int) {
        self.minStars = newValue
    }
    
    func toggledLanguageSwitch(newValue: Bool) {
        languageSwitchCurrentValue = newValue
        settingsTableView.reloadData()
    }
    
    
    
    // Number of rows
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return 1
        }
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "languageCell") as! languageViewCell
        if cell.languageSwitch.isOn {
            return searchSettings.languages.count + 1
        }
        
        return 1
    }
    
    //number of cells
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "starsCell") as! starsViewCell
            
            cell.minimumStarsLabel.text = "Minimum \(searchSettings.minStars)"
            cell.minimumStarsSlider.value = Float(searchSettings.minStars)
            cell.starsDelegate = self
            return cell
            } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "languageCell", for: indexPath) as! languageViewCell
            
            if indexPath.row == 0 {
                cell.languageSwitchLabel.text = "Langauges"
                cell.languageSwitch.isHidden = false
                
                cell.languageSwitch.setOn(languageSwitchCurrentValue, animated: true)
                    
            }
            else {
                let language = searchSettings.languages[indexPath.row - 1]
                cell.languageSwitchLabel?.text = language
                cell.languageSwitch.isHidden = true
            }
            
            cell.languageDelegate = self
            return cell
        }
    }


    // Number of section
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
