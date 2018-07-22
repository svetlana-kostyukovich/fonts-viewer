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
    
    let fontNameSize: CGFloat = 20
    let fontWeightSize: CGFloat = 15
    
    func displayContent(for fontData: FontData) {
    //func displayContent(name: String, weight: String) {
        fontName.text = fontData.name
        fontWeight.text = fontData.weight
        
        
        //let fontFullName = weight != "" ? name + "-" + weight : name
        if let labelFont = UIFont(name: fontData.fullName, size: fontNameSize) {
            fontName.font = labelFont
        }
        fontWeight.font = fontWeight.font.withSize(fontWeightSize)
        
        fontName.adjustsFontSizeToFitWidth = true // scale to fit
        fontWeight.adjustsFontSizeToFitWidth = true
    }
}
