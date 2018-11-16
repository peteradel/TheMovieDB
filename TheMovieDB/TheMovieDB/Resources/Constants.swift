//
//  Colors.swift
//  TheMovieDB
//
//  Created by Peter Sorial on 11/13/18.
//  Copyright © 2018 NEUGELB STUDIOS. All rights reserved.
//

import FontAwesome_swift
import Foundation
import UIColor_Hex_Swift
import UIKit

struct Colors {
    static let masterColor = UIColor("#081C23")
    static let secondaryColor = UIColor("#01D277")
    static let navigationBarBGColor = masterColor
    static let navigationBarFGColor = UIColor.white
    static let titleLabelColor = UIColor.black
    static let dateLabelColor = UIColor.darkGray
    static let overviewLabelColor = UIColor.gray
    static let activityIndicatorColor = secondaryColor
}

struct Icons {
    static let searchIcon = UIImage.fontAwesomeIcon(name: FontAwesome.search, style: FontAwesomeStyle.solid, textColor: Colors.navigationBarFGColor, size: CGSize(width: 30, height: 30))
}
