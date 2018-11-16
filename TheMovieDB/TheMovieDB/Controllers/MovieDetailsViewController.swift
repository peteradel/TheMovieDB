//
//  MovieDetailsViewController.swift
//  TheMovieDB
//
//  Created by Peter Sorial on 11/13/18.
//  Copyright © 2018 NEUGELB STUDIOS. All rights reserved.
//

import UIKit

class MovieDetailsViewController: BaseViewController {
    private let movieDetailsViewModel: MovieDetailsViewModel
    
    @IBOutlet var movieBackdropImageView: UIImageView!
    @IBOutlet var moviePosterImageView: UIImageView!
    @IBOutlet var movieTitleLabel: TitleLabel!
    @IBOutlet var movieReleaseDateLabel: DateLabel!
    @IBOutlet var movieRatingLabel: UILabel!
    @IBOutlet var movieOverviewLabel: UILabel!
    @IBOutlet var movieOriginalTitleLabel: UILabel!
    @IBOutlet var movieOverviewValueLabel: OverviewLabel!
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    init(movieDetailsViewModel: MovieDetailsViewModel) {
        self.movieDetailsViewModel = movieDetailsViewModel
        super.init(nibName: String(describing: MovieDetailsViewController.self), bundle: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    // MARK: - BaseViewController methods
    
    override func getViewControllerTitle() -> String? {
        return movieDetailsViewModel.title
    }
    
    override func setText() {
        super.setText()
        
        movieTitleLabel.text = movieDetailsViewModel.title
        movieReleaseDateLabel.text = movieDetailsViewModel.releaseDate
        movieRatingLabel.text = movieDetailsViewModel.rating
        movieOverviewLabel.text = "label_text_overview".localized().uppercased()
        movieOriginalTitleLabel.text = movieDetailsViewModel.originalTitle
        movieOverviewValueLabel.text = movieDetailsViewModel.overview
    }
    
    override func setStyle() {
        super.setStyle()
        
        movieBackdropImageView.kf.setImage(with: movieDetailsViewModel.backdropURL)
        moviePosterImageView.kf.setImage(with: movieDetailsViewModel.posterURL)
        
        movieOverviewLabel.font = UIFont.systemFont(ofSize: 20)
        movieOriginalTitleLabel.font = UIFont.boldSystemFont(ofSize: 20)
    }
}
