//
//  MainTabBarViewController.swift
//  PinterestClone
//
//  Created by Mohamad Zulhilmi on 01/12/2023.
//

import UIKit

class MainTabBarViewController: UITabBarController, UITabBarControllerDelegate {
    
    // MARK: Outlets
    @IBOutlet weak var mainTabBar: UITabBar!
    
    // MARK: View Lifecycles
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTabBar()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setTabBarItems()
    }
    
    // MARK: Tab Bar
    override func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem) {
        handleTabSelection(tabBar: tabBar, item: item)
    }
    
    func tabBarController(_ tabBarController: UITabBarController, shouldSelect viewController: UIViewController) -> Bool {
        return true
    }
    
    // MARK: Setup
    // This function sets up the tab bar's appearance.
    private func setupTabBar() {
        mainTabBar?.tintColor = UIColor.black
        mainTabBar?.backgroundColor = UIColor.white.withAlphaComponent(0.5)
        mainTabBar.backgroundImage = UIImage()
        mainTabBar.shadowImage = UIImage()
        
           self.delegate = self
       }
       
    // This function sets up the tab bar items.
       private func setTabBarItems() {
           let tabBarItems = [
               ("home", "home_selected", "Home"),
               ("explore", "explore_selected", "Explore"),
               ("messages", "messages_selected", "Messages"),
               ("profile", "profile_selected", "Profile"),
           ]
           for (index, item) in tabBarItems.enumerated() {
               if let myTabBarItem = self.tabBar.items?[index] {
                   if let image = UIImage(named: item.0) {
                       let size = CGSize(width: 30, height: 30)
                       UIGraphicsBeginImageContext(size)
                       image.draw(in: CGRect(x: 0, y: 0, width: size.width, height: size.height))
                       let resizedImage = UIGraphicsGetImageFromCurrentImageContext()
                       UIGraphicsEndImageContext()
                       
                       myTabBarItem.image = resizedImage?.withRenderingMode(.alwaysOriginal)
                   }
                   myTabBarItem.selectedImage = UIImage(named: item.1)?.withRenderingMode(.alwaysOriginal)
                   myTabBarItem.title = nil
                   myTabBarItem.imageInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
                   myTabBarItem.setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor.black], for: .normal)
                   myTabBarItem.setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor.clear], for: .selected)
               }
           }

       }
       
    // This function handles the logic that occurs when a tab is selected.
    private func handleTabSelection(tabBar: UITabBar, item: UITabBarItem) {
           if let index = tabBar.items?.firstIndex(of: item),
              let imageView = tabBar.subviews[index + 1].subviews.first as? UIImageView {
               UIView.animate(withDuration: 0.6) {
                   imageView.transform = CGAffineTransform(scaleX: 5.25, y: 5.25)
               } completion: { _ in
                   UIView.animate(withDuration: 0.6) {
                       imageView.transform = CGAffineTransform.identity
                   }
               }
           }
       }

}
