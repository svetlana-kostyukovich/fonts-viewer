//
//  ViewController.swift
//  fonts-viewer
//
//  Created by Светлана Лобан on 7/21/18.
//  Copyright © 2018 Sviatlana Loban. All rights reserved.
//

import UIKit

class ViewController: UICollectionViewController {
    
    // MARK: - Properties
    fileprivate let reuseIdentifier = "FontDescriptionCell"

    override func viewDidLoad() {
        super.viewDidLoad()
        getListOfFonts()

        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 4
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        //TODO: refactor reuseIdentifier
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! FontCell
        
        //TODO: refactor
        cell.backgroundColor = UIColor.blue
        return cell
    }
    
    
    func getListOfFonts() {
        
        UIFont.familyNames.forEach({ familyName in
            let fontNames = UIFont.fontNames(forFamilyName: familyName)
            for fontExtended in fontNames {
                let nameIndex = fontExtended.index(of: "-") ?? fontExtended.endIndex  //font name extracting
                let fontName = String(fontExtended[..<nameIndex])  // making a String from a Substring
                
                let weightIndex = nameIndex != fontExtended.endIndex ? fontExtended.index(nameIndex, offsetBy: 1) : fontExtended.endIndex // Weight extracting if existing
                
                let fontWeight = String(fontExtended[weightIndex...])
                print("fontName: \(fontName), fontWeight:\(fontWeight)")
            }
            
        })
    }

}

