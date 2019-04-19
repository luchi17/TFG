//
//  MultilineLabel.swift
//  Babydoc
//
//  Created by Luchi Parejo alcazar on 19/04/2019.
//  Copyright © 2019 Luchi Parejo alcazar. All rights reserved.
//

import UIKit

extension UILabel{
    var optimalHeight : CGFloat{
        get{
            let label = UILabel(frame: CGRect(x: 0, y: 0, width: self.bounds.width, height: CGFloat.greatestFiniteMagnitude))
            label.numberOfLines = 0
            label.lineBreakMode = .byWordWrapping
            label.font = self.font
            label.text = self.text
            label.sizeToFit()
            return label.frame.height
            
        }
    }
}
