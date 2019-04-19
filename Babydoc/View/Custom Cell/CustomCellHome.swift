//
//  CustomCellHome.swift
//  Babydoc
//
//  Created by Luchi Parejo alcazar on 15/04/2019.
//  Copyright © 2019 Luchi Parejo alcazar. All rights reserved.
//

import UIKit
import ChameleonFramework

class CustomCellHome: UITableViewCell{

    
    @IBOutlet var actionImage: UIImageView!
    
    @IBOutlet var actionName: UILabel!

    
    @IBOutlet var nameTitle: UILabel!
    @IBOutlet var nameField: UILabel!
    
    @IBOutlet var quantityTitle: UILabel!
    @IBOutlet var quantityField: UILabel!
    
    
    @IBOutlet var dateTitle: UILabel!
    @IBOutlet var dateField: UILabel!
    
    @IBOutlet var noteTitle: UILabel!
   
    @IBOutlet var noteField: UILabel!
    
    @IBOutlet var stackViewTitles: UIStackView!
    @IBOutlet var stackViewFields: UIStackView!
    
    
    @IBOutlet var inforDisplay: UIView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code goes here
        
       
        
    }

   
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}


