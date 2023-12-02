//
//  HomeViewController.swift
//  PinterestClone
//
//  Created by Mohamad Zulhilmi on 02/12/2023.
//

import UIKit
import Kingfisher

class HomeViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, CHTCollectionViewDelegateWaterfallLayout {
    
    var movieList = [Movie]()
    
    // MARK: Outlets
    @IBOutlet weak var postCollectionView: UICollectionView!
    
    // MARK: View Lifecycles
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Attach datasource and delegate
        postCollectionView.delegate = self
        postCollectionView.dataSource = self
        
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
        self.getHomeFeedList()
    }
    
    //MARK: - CollectionView Delegate
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let cellWidth = collectionView.frame.width

        return CGSize(width: cellWidth, height: collectionView.frame.height)
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
    
    // MARK: Private Methods
    func getHomeFeedList() {
        let _ = HomeFeedAPI(search: "batman", page: "1") {moviesArr in 
            if let movies = moviesArr {
                self.movieList = movies
                self.postCollectionView.reloadData()
            }
        }
    }
    

}


