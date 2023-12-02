//
//  PostCollectionViewCell.swift
//  PinterestClone
//
//  Created by Mohamad Zulhilmi on 02/12/2023.
//

import UIKit
import Kingfisher

class PostCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var totalWatchingLabel: UILabel!
    @IBOutlet weak var genreLabel: UILabel!
    @IBOutlet weak var yearLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    private let gradientLayer = CAGradientLayer()
    var onImageDownloaded: (() -> Void)?

    override func awakeFromNib() {
        super.awakeFromNib()
        setupGradientLayer()
    }
    
    private func setupGradientLayer() {
//            gradientLayer.colors = [UIColor.clear.cgColor, UIColor.black.cgColor]
//            gradientLayer.startPoint = CGPoint(x: 0.5, y: 0.5)
//            gradientLayer.endPoint = CGPoint(x: 1, y: 1)
//            gradientLayer.type = .radial
//        gradientLayer.frame = self.imageView.bounds
//        self.imageView.layer.addSublayer(gradientLayer)
        }
    
    // MARK: Configure Cell
    func configureCell(movie: Movie) {
        let imageUrl = URL(string: "https://www.dvdsreleasedates.com/posters/800/O/Oppenheimer-2023-movie-poster.jpg")
        self.imageView.kf.setImage(with: imageUrl) { result in
            switch result {
            case .success(_):
                DispatchQueue.main.async {
                    self.onImageDownloaded?()
                }
            case .failure(let error):
                print("Error: \(error)")
            }
        }
        self.titleLabel.text = movie.title
        self.totalWatchingLabel.text = "\(movie.totalWatchingTime) min"
        self.genreLabel.text = movie.genres[0].uppercased()
        self.yearLabel.text = "\(movie.year)"
        self.descriptionLabel.text = "\(movie.shortDescription)"
        self.invalidateIntrinsicContentSize()
    }

}
