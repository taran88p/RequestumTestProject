//
//  ViewController.swift
//  TestProject
//
//  Created by Pavel on 8/7/19.
//  Copyright © 2019 User. All rights reserved.
//

import UIKit
import CoreData
import Reachability

enum Message {
    static let warning = "Warning"
    static let emptyFeild = "Field for search is empty"
    static let noConnection = "No connection to the network"
}

enum TypeInstructions {
    static let recipe = "Recipe"
    static let searchRecipe = "SearchRecipe"
}

class ViewController: UIViewController {
    
    //MARK: - Outlets
    
    @IBOutlet var contentView: ContentView!
    
    //MARK: - Variables
    
    var recipesArray = [SearchInstruction]() {
        didSet {
            self.contentView.recipesTableView.reloadData()
        }
    }
    
    //MARK: - LifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        getRecipes(entityName: TypeInstructions.recipe)
    }
    
    //MARK: - Get Recipes
    
    private func getRecipes(entityName: String) {
        let entitiesArray = getListRecipesFromStorage(entityName: entityName)
        if entitiesArray.isEmpty {
            getRecipesRequest(parameters: APIParameters.recipeParameters, entityName: entityName)
        } else {
            recipesArray = SearchInstructionResponse.parse(array: entitiesArray)
        }
    }
    
    private func getRecipesRequest(parameters: String, entityName: String) {
        let reachability = Reachability()!
        if reachability.connection == .none {
            createAlert(title: Message.warning, message: Message.noConnection)
        }
        APIManager.getListRecipes(parameters: parameters, entityName: entityName) {
            let entitiesArray = self.getListRecipesFromStorage(entityName: entityName)
            self.recipesArray = SearchInstructionResponse.parse(array: entitiesArray)
            self.recipesArray.reverse()
        }
    }
    
    private func getSearchRecipe(text: String) {
        contentView.recipeSearchBar.endEditing(true)
        if !text.isEmpty {
            self.recipesArray.removeAll()
            let parameters = APIParameters.searchRecipeParameters + text
            getRecipesRequest(parameters: parameters, entityName: TypeInstructions.searchRecipe)
        } else {
            createAlert(title: Message.warning, message: Message.emptyFeild)
        }
    }
    
    //MARK: - CoreData
    
    private func getListRecipesFromStorage(entityName: String) -> [NSManagedObject] {
        return CoreDataManager.shared.fetchEntity(nameEntity: entityName)
    }
    
    //MARK: - Action
    
    @IBAction func searchButtonPressed(_ sender: UIButton) {
        if let text = contentView.recipeSearchBar.text {
            getSearchRecipe(text: text)
        }
    }    
}

extension ViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return recipesArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: RecipeTableViewCell.reuseID(), for: indexPath) as! RecipeTableViewCell
        cell.configure(recipe: recipesArray[indexPath.row])
        return cell
    }    
}

extension ViewController: UISearchBarDelegate {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        if let text = searchBar.text {
            getSearchRecipe(text: text)
        }
    }
}
