//
//  TitleLabel.swift
//  TheMovieDB
//
//  Created by Peter Sorial on 11/13/18.
//  Copyright © 2018 NEUGELB STUDIOS. All rights reserved.
//

import UIKit

class TitleLabel: BaseLabel {
    override func initView() {
        super.initView()

        self.font = UIFont.boldSystemFont(ofSize: 18)
        self.numberOfLines = 0
        self.lineBreakMode = NSLineBreakMode.byWordWrapping
        self.textColor = Colors.titleLabelColor
    }
}
