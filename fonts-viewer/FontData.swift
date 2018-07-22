//
//  FontData.swift
//  fonts-viewer
//
//  Created by Светлана Лобан on 7/21/18.
//  Copyright © 2018 Sviatlana Loban. All rights reserved.
//

import Foundation
import UIKit

struct FontData {

    var family: String
    var name: String
    var weight: String
    
    var fullName : String {
        return weight != "" ? name + "-" + weight : name
    }

}
