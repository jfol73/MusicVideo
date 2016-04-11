//
//  MyExtensions.swift
//  MusicVideo
//
//  Created by Officefront on 8/04/16.
//  Copyright © 2016 jfol73. All rights reserved.
//

import UIKit

extension MusicVideoTVC: UISearchResultsUpdating {
    func updateSearchResultsForSearchController(searchController: UISearchController) {
        searchController.searchBar.text!.lowercaseString
        filterSearch(searchController.searchBar.text!)
    }
}