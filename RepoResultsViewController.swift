//
//  ViewController.swift
//  GithubDemo
//
//  Created by Nhan Nguyen on 5/12/15.
//  Copyright (c) 2015 codepath. All rights reserved.
//

import UIKit
import MBProgressHUD

// Main ViewController
class RepoResultsViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, starSettingsDelegate {

    var searchBar: UISearchBar!
    
    var searchSettings = GithubRepoSearchSettings()

    var repos: [GithubRepo]!

    @IBOutlet weak var repoTableViewOutlet: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Initialize the UISearchBar
        searchBar = UISearchBar()
        searchBar.delegate = self

        // Add SearchBar to the NavigationBar
        searchBar.sizeToFit()
        navigationItem.titleView = searchBar

        // Perform the first search when the view controller first loads
        doSearch()
        
        repoTableViewOutlet.dataSource = self
        repoTableViewOutlet.delegate = self
        
        // AutoLayout
        repoTableViewOutlet.rowHeight = UITableViewAutomaticDimension
        repoTableViewOutlet.estimatedRowHeight = 135
        
        
    }
    
    // create a function that updates the settings
    func updateStarSetting(newValue: Int) {
        searchSettings.minStars = newValue
        self.repos.removeAll()
        self.doSearch()
    }

    // Perform the search.
    fileprivate func doSearch() {

        MBProgressHUD.showAdded(to: self.view, animated: true)

        // Perform request to GitHub API to get the list of repositories
        GithubRepo.fetchRepos(searchSettings, successCallback: { (newRepos) -> Void in
            
            // Print the returned repositories to the output window
            for repo in newRepos {
                print(repo)
                self.repos = newRepos
            }
            
            // reload after the network request
            self.repoTableViewOutlet.reloadData()
            
            MBProgressHUD.hide(for: self.view, animated: true)
            }, error: { (error) -> Void in
                print(error)
        })
    }

    func tableView(_ repoTableViewOutlet: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = repoTableViewOutlet.dequeueReusableCell(withIdentifier: "githubTableCell") as! githubTableViewCell
        
        // Get repo for row# as index
        let repoName = repos[indexPath.row].name
        let repoAuthor = repos[indexPath.row].ownerHandle
        let stars = repos[indexPath.row].stars
        let forks = repos[indexPath.row].forks
        let image = repos[indexPath.row].ownerAvatarURL
        let description = repos[indexPath.row].repoDescription
        let language = repos[indexPath.row].repoLanguage
        
        cell.repoNameLabel.text = repoName
        cell.forkImageView.image = #imageLiteral(resourceName: "fork")
        cell.numberForksLabel.text = String(forks!)
        cell.starImageView.image = #imageLiteral(resourceName: "star")
        cell.numberStartsLabel.text = String(stars!)
        cell.repoAuthorLabel.text = repoAuthor
        cell.authorImageView.setImageWith(URL(string: image!)!)
        cell.repoDescriptionLabel.text = description
        cell.repoLanguageLabel.text = language
        
        return cell
    }
    
    func tableView(_ repoTableViewOutlet: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        // Create as many rows as there are repos, or 0
        if repos != nil {
            return repos!.count
        } else {
            return 0
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "segueToSettingsView" {
            
            let navigationView = segue.destination as! UINavigationController
            let settingsView = navigationView.topViewController as! SettingsViewController
            settingsView.searchSettings = searchSettings
            settingsView.minStars = searchSettings.minStars
            settingsView.starDelegate = self
        }
    }
}

// SearchBar methods
extension RepoResultsViewController: UISearchBarDelegate {

    func searchBarShouldBeginEditing(_ searchBar: UISearchBar) -> Bool {
        searchBar.setShowsCancelButton(true, animated: true)
        return true
    }

    func searchBarShouldEndEditing(_ searchBar: UISearchBar) -> Bool {
        searchBar.setShowsCancelButton(false, animated: true)
        return true
    }

    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searchBar.text = ""
        searchBar.resignFirstResponder()
    }

    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchSettings.searchString = searchBar.text
        searchBar.resignFirstResponder()
        doSearch()
    }
}
