//
//  HomeViewController.swift
//  PinterestClone
//
//  Created by Mohamad Zulhilmi on 02/12/2023.
//

import UIKit
import Kingfisher

class HomeViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, CHTCollectionViewDelegateWaterfallLayout {
    
    let movieList = movies
    
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
    
    //MARK: - CollectionView Delegate
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let cellWidth = collectionView.frame.width
        let indexPath = IndexPath(item: indexPath.item, section: 0)
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PostCollectionViewCell", for: indexPath) as! PostCollectionViewCell

        let labelSize = cell.titleLabel.text?.size(withAttributes: [NSAttributedString.Key.font: cell.titleLabel.font as Any]) ?? CGSize.zero
        let labelHeight = labelSize.height
        let imageHeight = cell.imageView.image?.size.height ?? 50 

        return CGSize(width: cellWidth, height: collectionView.frame.height + imageHeight)
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
    

}


