//
//  MovieDetailViewController.swift
//  PinterestClone
//
//  Created by Mohamad Zulhilmi on 03/12/2023.
//

import UIKit
import Kingfisher

class MovieDetailViewController: ViewController {
    
    // MARK: Outlet
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var totalWatchingLabel: UILabel!
    @IBOutlet weak var genreLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var plotLabel: UILabel!
    @IBOutlet weak var saveButton: UIButton!
    @IBOutlet weak var backView: UIView!
    
    // MARK: Variables
    var movie: Movie? = nil

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let gesture = UITapGestureRecognizer(target: self, action: #selector(self.backAction))
        backView.addGestureRecognizer(gesture)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        if let movieObj = movie {
            getMovieDetail(imdbID: movieObj.imdbID)
        }

    }
    
    @objc func backAction(sender : UITapGestureRecognizer) {
        self.dismiss(animated: true)
    }
    
    func getMovieDetail(imdbID: String) {
        MovieDetailAPI.init(search: imdbID) {movie in
            self.titleLabel.text = movie.title
            self.imageView.kf.setImage(with:URL(string: movie.poster))
            self.totalWatchingLabel.text = movie.runtime
            self.genreLabel.text = movie.genre
            self.dateLabel.text = movie.released
            self.plotLabel.text = movie.plot
        
        }
    }
}
