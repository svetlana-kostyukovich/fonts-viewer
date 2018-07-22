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
            familyNameLabel.text = "Family Name \(fontData.family)"
            weightLabel.text = "Weight: \(fontData.weight)"
            
            exampleLabel.text = "Example"
            exampleLabel.font = UIFont(name: fontData.fullName, size: exampleSize)
            exampleLabel.textColor = UIColor.green
            
            sizeLabel.text = "Size: \(exampleLabel.font.pointSize)"
        }

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
