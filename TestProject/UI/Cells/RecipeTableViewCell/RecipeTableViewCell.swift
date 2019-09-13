//
//  RecipeTableViewCell.swift
//  TestProject
//
//  Created by Pavel on 8/7/19.
//  Copyright © 2019 User. All rights reserved.
//

import UIKit

class RecipeTableViewCell: UITableViewCell {
    
    //MARK: - Outlets
    
    @IBOutlet weak var iconImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    //MARK: - LifeCycle
    
    override func awakeFromNib() {
        super.awakeFromNib()
        iconImageView.layer.cornerRadius = iconImageView.frame.size.height/2
    }
    
    //MARK: - Configure
    
    func configure(recipe: SearchInstruction) {
        if let title = recipe.title {
            titleLabel.text = title.replacingOccurrences(of: "\n", with: "")
        }
        
        if let ingredients = recipe.ingredients {
            descriptionLabel.text = ingredients.firstUppercased
        }
        
        if let thumbnail = recipe.thumbnail {
            iconImageView.setImage(imageURL: thumbnail, placeholder: "omelette")
        }
    }
    
    //MARK: - Other
    
    class func reuseID() -> String {
        return NSStringFromClass(RecipeTableViewCell.self).components(separatedBy: ".").last!
    }
}


