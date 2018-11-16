//
//  OverviewLabel.swift
//  TheMovieDB
//
//  Created by Peter Sorial on 11/13/18.
//  Copyright © 2018 NEUGELB STUDIOS. All rights reserved.
//

import UIKit

class OverviewLabel: BaseLabel {
    override func initView() {
        super.initView()

        self.font = UIFont.systemFont(ofSize: 14)
        self.textColor = Colors.overviewLabelColor
    }
}
