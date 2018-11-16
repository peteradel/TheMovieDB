//
//  DateLabel.swift
//  TheMovieDB
//
//  Created by Peter Sorial on 11/13/18.
//  Copyright © 2018 NEUGELB STUDIOS. All rights reserved.
//

import UIKit

class DateLabel: BaseLabel {
    override func initView() {
        super.initView()

        self.font = UIFont.systemFont(ofSize: 16)
        self.numberOfLines = 0
        self.lineBreakMode = NSLineBreakMode.byWordWrapping
        self.textColor = Colors.dateLabelColor
    }
}
