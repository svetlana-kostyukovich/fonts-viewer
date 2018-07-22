//
//  FontDetailsViewController.swift
//  fonts-viewer
//
//  Created by Светлана Лобан on 7/22/18.
//  Copyright © 2018 Sviatlana Loban. All rights reserved.
//

import UIKit

class FontDetailsViewController: UIViewController {
    
    var fontData: FontData?
    let exampleSize: CGFloat = 17

    @IBOutlet weak var familyNameLabel: UILabel!
    @IBOutlet weak var weightLabel: UILabel!    
    @IBOutlet weak var exampleLabel: UILabel!
    @IBOutlet weak var sizeLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController!.navigationBar.isHidden = false
        
        if let fontData = fontData {
            navigationItem.title = fontData.name
            familyNameLabel.text = "Family Name: \(fontData.family)"
            weightLabel.text = "Weight: \(fontData.weight)"
            
            exampleLabel.text = "Example"
            exampleLabel.font = UIFont(name: fontData.fullName, size: exampleSize)
            exampleLabel.textColor = UIColor.green

            sizeLabel.text = "Size(pt): \(exampleLabel.font.pointSize)"
        }

    }

    override func viewWillDisappear(_ animated: Bool) { //hide the bar for full screen
        super.viewWillDisappear(animated)
        self.navigationController?.navigationBar.isHidden = true
    }
    
}
