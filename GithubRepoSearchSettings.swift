//
//  GithubRepoSearchSettings.swift
//  GithubDemo
//
//  Created by Nhan Nguyen on 5/12/15.
//  Copyright (c) 2015 codepath. All rights reserved.
//

import Foundation

// Model class that represents the user's search settings
class GithubRepoSearchSettings {
    var searchString: String?
    var minStars = 0
    var languages = [String]()
    
    init() {
        languages = ["JavaScript"]
        languages += ["CoffeeScript"]
        languages += ["HTML"]
        languages += ["CSS"]
        languages += ["C++"]
        languages += ["Java"]
        languages += ["Go"]
        languages += ["Ruby"]
        languages += ["PHP"]
        languages += ["Python"]
        languages += ["Perl"]
        languages += ["Objective-C"]
        languages += ["Swift"]
        languages += ["TypeScript"]
        languages += ["C"]
    }
}
