//
//  ContentView.swift
//  TestProject
//
//  Created by Pavel on 8/7/19.
//  Copyright © 2019 User. All rights reserved.
//

import UIKit

class ContentView: UIView {

    //MARK: - Outlets
    
    @IBOutlet weak var recipesTableView: UITableView! {
        didSet {
            recipesTableView.registerNib(with: RecipeTableViewCell.reuseID())
        }
    }
    @IBOutlet weak var recipeSearchBar: UISearchBar!
    @IBOutlet weak var searchButton: UIButton!
    
    //MARK: - Variables
    
    var rowHeight: CGFloat = 80.0
    
    //MARK: - LifeCycle
    
    override func draw(_ rect: CGRect) {
        recipeSearchBar.backgroundImage = UIImage()
        recipesTableView.rowHeight = UITableView.automaticDimension
        recipesTableView.estimatedRowHeight = rowHeight
    }
}
