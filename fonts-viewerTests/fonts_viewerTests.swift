//
//  fonts_viewerTests.swift
//  fonts-viewerTests
//
//  Created by Светлана Лобан on 7/21/18.
//  Copyright © 2018 Sviatlana Loban. All rights reserved.
//

import XCTest
@testable import fonts_viewer

class fonts_viewerTests: XCTestCase {
    
    var collectionView = ViewController()
    
    override func setUp() {
        super.setUp()
        //collectionView = ViewController()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testInitFontsList() {
        collectionView.initFontsList()
        XCTAssertTrue(!collectionView.fontsList.isEmpty)
    }
    
}
