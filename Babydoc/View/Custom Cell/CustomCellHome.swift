//
//  CustomCellHome.swift
//  Babydoc
//
//  Created by Luchi Parejo alcazar on 15/04/2019.
//  Copyright © 2019 Luchi Parejo alcazar. All rights reserved.
//

import UIKit

class CustomCellHome: UITableViewCell {

    
    @IBOutlet weak var icon: UIImageView!
    @IBOutlet weak var action: UILabel!
    
    @IBOutlet weak var dateTitle: UILabel!
    @IBOutlet weak var dateField: UILabel!
    @IBOutlet weak var noteTitle: UILabel!
    
    @IBOutlet weak var noteField: UITextField!
    
    
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
