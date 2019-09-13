//
//  RecipeResponse.swift
//  TestProject
//
//  Created by Pavel on 8/7/19.
//  Copyright © 2019 User. All rights reserved.
//

import Foundation
import SwiftyJSON

class InstructionResponse {
    
    class func parse(dictionary: JSON) -> Instruction {
        return Instruction(dictionary: dictionary)
    }
}
