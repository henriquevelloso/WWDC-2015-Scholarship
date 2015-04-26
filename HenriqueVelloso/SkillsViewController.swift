//
//  SkillsViewController.swift
//  HenriqueVelloso
//
//  Created by Henrique Velloso on 4/24/15.
//
//

import UIKit

class SkillsViewController: UIViewController , UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout , UIScrollViewDelegate {
    
    
    
    
    @IBOutlet weak var imgBackground: UIImageView!
    @IBOutlet weak var pageControl: UIPageControl!
    @IBOutlet weak var collectionView: UICollectionView!
    var currentIndexX : Int = 0
    var currentIndexY : Int = 0
    
    
    //MARK: Default Delegates
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setNavigationBarHeader("technicalSkills")
        imgBackground.addParallax(-50, maximumRelativeValue: 50)

        
        
        
        setupCollectionView()
    }
    
    override func viewWillAppear(animated: Bool) {
        
        self.collectionView.collectionViewLayout.invalidateLayout()
        
        var currentOffset: CGPoint = self.collectionView.contentOffset
        self.currentIndexX = Int(currentOffset.x / self.collectionView.frame.size.width)
        self.currentIndexY = Int(currentOffset.y / self.collectionView.frame.size.height)
        
        var currentSize : CGSize = self.collectionView.bounds.size
        var offSetX : CGFloat = CGFloat(self.currentIndexX) * currentSize.width
        var offSetY : CGFloat = CGFloat(self.currentIndexY) * currentSize.height
        
        self.collectionView.setContentOffset(CGPointMake(offSetX, offSetY), animated: animated)
        
        
        
        
        
    }
    
    override func willRotateToInterfaceOrientation(toInterfaceOrientation: UIInterfaceOrientation, duration: NSTimeInterval) {
        
        self.collectionView.collectionViewLayout.invalidateLayout()
        
        var currentOffset: CGPoint = self.collectionView.contentOffset
        self.currentIndexX = Int(currentOffset.x / self.collectionView.frame.size.width)
        self.currentIndexY = Int(currentOffset.y / self.collectionView.frame.size.height)
        
        
    }
    
    
    override func prefersStatusBarHidden() -> Bool {
        return true
    }
    
    
    
    override func didRotateFromInterfaceOrientation(fromInterfaceOrientation: UIInterfaceOrientation) {
        self.collectionView.collectionViewLayout.invalidateLayout()
        
        
        var currentSize : CGSize = self.collectionView.bounds.size
        var offSetX : CGFloat = CGFloat(self.currentIndexX) * currentSize.width
        var offSetY : CGFloat = CGFloat(self.currentIndexY) * currentSize.height
        
        
        self.collectionView.setContentOffset(CGPointMake(offSetX, offSetY), animated: true)
        
        
        
    }
    
    
    //MARK: Custom Functions
    
    
    func setupCollectionView () {
        
        self.pageControl.numberOfPages = 2
        self.pageControl.currentPage = 0
        
        var flowLayout : UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        flowLayout.scrollDirection = UICollectionViewScrollDirection.Horizontal
        flowLayout.minimumInteritemSpacing = 0
        flowLayout.minimumLineSpacing = 0
        
        self.collectionView.pagingEnabled = true
        self.collectionView.setCollectionViewLayout(flowLayout, animated: true)
        self.collectionView.collectionViewLayout.invalidateLayout()
        
        var currentOffset: CGPoint = self.collectionView.contentOffset
        self.currentIndexX = Int(currentOffset.x / self.collectionView.frame.size.width)
        self.currentIndexY = Int(currentOffset.y / self.collectionView.frame.size.height)
        
        var currentSize : CGSize = self.collectionView.bounds.size
        var offSetX : CGFloat = CGFloat(self.currentIndexX) * currentSize.width
        var offSetY : CGFloat = CGFloat(self.currentIndexY) * currentSize.height
        
        self.collectionView.setContentOffset(CGPointMake(offSetX, offSetY), animated: true)
        self.collectionView.layoutIfNeeded()
        
    }
    
    //MARK: Collection Handler
    
    func scrollViewDidEndDecelerating(scrollView: UIScrollView) {
        
        var pageWidth : CGFloat  = self.collectionView.frame.size.width;
        self.pageControl.currentPage = Int(self.collectionView.contentOffset.x) / Int(pageWidth);
    }
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
        return CGSizeMake(self.collectionView.frame.width, self.collectionView.frame.height)
    }
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 2
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        
        
        var reuseIdentifierPrefix = "skillsPage"
        
        var cellOrigin: UICollectionViewCell = collectionView.dequeueReusableCellWithReuseIdentifier(reuseIdentifierPrefix + "\(indexPath.row + 1)", forIndexPath: indexPath) as! UICollectionViewCell
        return cellOrigin
        
    }
    
    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 1
    }
    
    
    
    
    
    
    // MARK: - Navigation
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    
    
}