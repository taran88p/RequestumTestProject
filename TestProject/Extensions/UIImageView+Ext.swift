//
//  UIImageView+Ext.swift
//  TestProject
//
//  Created by Pavel on 8/7/19.
//  Copyright © 2019 User. All rights reserved.
//

import Foundation
import Kingfisher

extension UIImageView {
    
    func setImage(imageURL urlString: String, placeholder: String) {
        if let url = URL(string: urlString) {
            let resource = ImageResource(downloadURL: url)
            self.kf.setImage(with: resource, placeholder: nil, options: nil)
        } else {
            self.image = UIImage(named: placeholder)
        }
    }
}
