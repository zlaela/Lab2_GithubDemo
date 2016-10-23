//
//  githubTableViewCell.swift
//  GithubDemo
//
//  Created by lmohamed on 10/20/16.
//  Copyright © 2016 codepath. All rights reserved.
//

import UIKit

class githubTableViewCell: UITableViewCell {

    @IBOutlet weak var repoNameLabel: UILabel!
    @IBOutlet weak var repoAuthorLabel: UILabel!
    @IBOutlet weak var repoDescriptionLabel: UILabel!
    @IBOutlet weak var numberStartsLabel: UILabel!
    @IBOutlet weak var numberForksLabel: UILabel!
    @IBOutlet weak var starImageView: UIImageView!
    @IBOutlet weak var forkImageView: UIImageView!
    @IBOutlet weak var authorImageView: UIImageView!
    @IBOutlet weak var repoLanguageLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        
        // round the corners
        authorImageView.layer.cornerRadius = 5
        authorImageView.clipsToBounds = true
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
