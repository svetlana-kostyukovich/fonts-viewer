//
//  ViewController.swift
//  fonts-viewer
//
//  Created by Светлана Лобан on 7/21/18.
//  Copyright © 2018 Sviatlana Loban. All rights reserved.
//

import UIKit

class ViewController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    
    // MARK: - Properties
    fileprivate let reuseIdentifier = "FontDescriptionCell"
    
    var fontsList = [FontData]()
    
    // MARK: initials
    override func viewDidLoad() {
        super.viewDidLoad()
        initFontsList()

        self.navigationController!.navigationBar.isHidden = true
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    // MARK: UICollectionViewDataSource
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return fontsList.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! FontCell
        let font = fontsList[indexPath.row]

        cell.displayContent(for: font)
        return cell
    }
    
    // MARK: - UICollectionViewDelegateFlowLayout
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width/2-10.0, height: collectionView.frame.height/4-10.0)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 10.0, left: 5.0, bottom: 0.0, right: 5.0)
    }
    
    // MARK: - Navigation
    let fontDetailSegueIdentifier = "ShowFontDetailsSegue"
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if  segue.identifier == fontDetailSegueIdentifier,
            let destination = segue.destination as? FontDetailsViewController
        {
            let selectedCell = sender as! UICollectionViewCell
            let indexPath = collectionView?.indexPath(for: selectedCell)
            
            let fontData = fontsList[indexPath!.row]
            destination.fontData = fontData
        }
    }
    
    // MARK: - createFontsList
    func initFontsList() {
        for familyName in UIFont.familyNames {
            let fontNames = UIFont.fontNames(forFamilyName: familyName)
            for fontExtended in fontNames {
                let nameIndex = fontExtended.index(of: "-") ?? fontExtended.endIndex  //font name extracting
                let fontName = String(fontExtended[..<nameIndex])  // making a String from a Substring
                
                let weightIndex = nameIndex != fontExtended.endIndex ? fontExtended.index(nameIndex, offsetBy: 1) : fontExtended.endIndex // Weight extracting if existing
                
                let fontWeight = String(fontExtended[weightIndex...])
                //print("fam: \(familyName), font: \(fontExtended)")
                fontsList.append(FontData(family: familyName, name: fontName, weight: fontWeight))
            }
        }
    }
}
