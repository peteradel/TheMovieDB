//
//  MoviesTableViewCell.swift
//  TheMovieDB
//
//  Created by Peter Sorial on 11/13/18.
//  Copyright © 2018 NEUGELB STUDIOS. All rights reserved.
//

import Kingfisher
import UIKit

class MoviesTableViewCell: UITableViewCell, BaseTableCellProtocol {
    static var cellIdentifier: String {
        return String(describing: MoviesTableViewCell.self)
    }
    
    @IBOutlet var moviePosterImageView: UIImageView!
    @IBOutlet var movieTitleLabel: TitleLabel!
    @IBOutlet var movieReleaseDateLabel: DateLabel!
    @IBOutlet var movieOverviewLabel: OverviewLabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func bind<T>(tableCellViewModel: T) {
        if let movieTableViewCellModel = tableCellViewModel as? MovieTableViewCellModel {
            moviePosterImageView.kf.setImage(with: movieTableViewCellModel.posterURL)
            movieTitleLabel.text = movieTableViewCellModel.title
            movieReleaseDateLabel.text = movieTableViewCellModel.releaseDate
            movieOverviewLabel.text = movieTableViewCellModel.overview
        }
    }
}
