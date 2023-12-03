//
//  HomeViewController.swift
//  PinterestClone
//
//  Created by Mohamad Zulhilmi on 02/12/2023.
//

import UIKit
import Kingfisher

class HomeViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, CHTCollectionViewDelegateWaterfallLayout {
    
    // MARK: Outlets
    @IBOutlet weak var postCollectionView: UICollectionView!
    
    // MARK: Variables
    var movieList = [Movie]()
    var page = 1
    let refreshControl = UIRefreshControl()
    
    // MARK: View Lifecycles
    override func viewDidLoad() {
        super.viewDidLoad()
        
        refreshControl.addTarget(self, action: #selector(refresh), for: .valueChanged)
        
        // Attach datasource, refresh control and delegate
        postCollectionView.delegate = self
        postCollectionView.dataSource = self
        postCollectionView.refreshControl = refreshControl
        
        //Layout setup
        let layout = CHTCollectionViewWaterfallLayout()
        layout.minimumColumnSpacing = 3.0
        layout.minimumInteritemSpacing = 3.0
        self.postCollectionView.collectionViewLayout = layout
        
        //Register nibs
        let nib = UINib(nibName: "PostCollectionViewCell", bundle: nil)
        postCollectionView.register(nib, forCellWithReuseIdentifier: "PostCollectionViewCell")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        self.getHomeFeedList(page: String(page))
    }
    
    //MARK: - CollectionView Delegate
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let cellWidth = collectionView.bounds.width

        return CGSize(width: cellWidth, height: collectionView.bounds.height + CGFloat.random(in: 60...100))
      }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
     let mdVc = MovieDetailViewController.init(nibName: "MovieDetailViewController", bundle: nil)
        mdVc.movie = movieList[indexPath.row]
     self.present(mdVc, animated: true, completion: nil)
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 5, bottom: 0, right: 5)
    }
    
      
      func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, columnCountFor section: Int) -> Int {
          return 2
      }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return movieList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = postCollectionView.dequeueReusableCell(withReuseIdentifier: "PostCollectionViewCell", for: indexPath) as! PostCollectionViewCell
        cell.backgroundColor = .white
        cell.layer.cornerRadius = 10
        cell.layer.shadowColor = UIColor.black.cgColor
        cell.layer.shadowOffset = CGSize(width: 0, height: 1)
        cell.layer.shadowOpacity = 0.1
        cell.layer.shadowRadius = 10
        cell.configureCell(movie: movieList[indexPath.row])
        
        return cell
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let offsetY = scrollView.contentOffset.y
                let contentHeight = scrollView.contentSize.height

                if (offsetY > contentHeight - scrollView.frame.height * 4) {
                    self.page = self.page + 1
                    getHomeFeedList(page: String(page))
                }
    }
    
    // MARK: Private Methods
    func getHomeFeedList(page: String) {
        let _ = HomeFeedAPI(search: getRandomMovieName(), page: page) {moviesArr in
            if let movies = moviesArr {
                if page != "1" {
                    self.movieList.append(contentsOf: movies)
                } else {
                    self.movieList.removeAll()
                    self.movieList = movies
                }
                self.postCollectionView.reloadData()
            }
        }
    }
    
    func getRandomMovieName() -> String {
        let movieNames = ["batman", "superman", "spiderman", "ironman", "hulk", "wonderwoman", "blackwidow"]
        let randomIndex = Int(arc4random_uniform(UInt32(movieNames.count)))
        return movieNames[randomIndex]
    }

    
    // MARK: Object
    @objc func refresh() {
        getHomeFeedList(page: "1")
        refreshControl.endRefreshing()
    }
    

}


