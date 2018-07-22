//
//  FontCell.swift
//  fonts-viewer
//
//  Created by Светлана Лобан on 7/21/18.
//  Copyright © 2018 Sviatlana Loban. All rights reserved.
//

import UIKit

class FontCell: UICollectionViewCell {
    
    @IBOutlet weak var fontName: UILabel!
    @IBOutlet weak var fontWeight: UILabel!
    
    func displayContent(name: String, weight: String) {
        fontName.text = name
        fontWeight.text = weight
        
        
        let fontFullName = weight != "" ? name + "-" + weight : name
         if let labelFont = UIFont(name: fontFullName, size: 20) {
            fontName.font = labelFont
        }
        fontWeight.font = fontWeight.font.withSize(15)
        
        fontName.adjustsFontSizeToFitWidth = true // scale to fit
        fontWeight.adjustsFontSizeToFitWidth = true
    }
}
