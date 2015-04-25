//
//  FeedViewController.swift
//  HenriqueVelloso
//
//  Created by Henrique Velloso on 4/18/15.
//
//

import UIKit

class FeedViewController: UITableViewController  {
    
    //MARK: Outlets
    
    @IBOutlet weak var imgAboutCell: UIImageView!
    @IBOutlet weak var imgProjectsCell: UIImageView!
    @IBOutlet weak var imgSkillsCell: UIImageView!
    @IBOutlet weak var imgEducationalCell: UIImageView!
    @IBOutlet weak var imgProfessionalCell: UIImageView!
    @IBOutlet weak var imgInterestCell: UIImageView!
    
    
    //MARK: - Delegates
    
    override func viewWillAppear(animated: Bool) {
        

        
        var imgBackground : UIImageView = UIImageView(image: UIImage(named: "brick"))
        imgBackground.frame = self.tableView.frame
        imgBackground.contentMode = UIViewContentMode.ScaleAspectFill
        self.tableView.backgroundView = imgBackground
        self.tableView.autoresizingMask = UIViewAutoresizing.FlexibleHeight
    }
    
    override func viewDidLayoutSubviews() {
        generateRect(imgAboutCell, contentOffsetY: self.tableView.contentOffset.y)
        generateRect(imgProjectsCell, contentOffsetY: self.tableView.contentOffset.y)
        generateRect(imgSkillsCell, contentOffsetY: self.tableView.contentOffset.y)
        generateRect(imgEducationalCell, contentOffsetY: self.tableView.contentOffset.y)
        generateRect(imgProfessionalCell, contentOffsetY: self.tableView.contentOffset.y)
        generateRect(imgInterestCell, contentOffsetY: self.tableView.contentOffset.y)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        

        self.setNavigationBarHeader("henriqueVelloso")
        
        
        imgAboutCell.addParallax(0, maximumRelativeValueX: 0, minimumRelativeValueY: -20, maximumRelativeValueY: 20)
        imgProjectsCell.addParallax(0, maximumRelativeValueX: 0, minimumRelativeValueY: -20, maximumRelativeValueY: 20)
        imgSkillsCell.addParallax(0, maximumRelativeValueX: 0, minimumRelativeValueY: -20, maximumRelativeValueY: 20)
        imgEducationalCell.addParallax(0, maximumRelativeValueX: 0, minimumRelativeValueY: -20, maximumRelativeValueY: 20)
        imgProfessionalCell.addParallax(0, maximumRelativeValueX: 0, minimumRelativeValueY: -20, maximumRelativeValueY: 20)
        imgInterestCell.addParallax(0, maximumRelativeValueX: 0, minimumRelativeValueY: -20, maximumRelativeValueY: 20)

        
        
   //     self.performSegueWithIdentifier("segueToWelcome", sender: nil)

    }
    
    override func viewDidAppear(animated: Bool) {
       // setupInitialImagesOffset()
    }
    
    override func willAnimateRotationToInterfaceOrientation(toInterfaceOrientation: UIInterfaceOrientation, duration: NSTimeInterval) {
        generateRect(imgAboutCell, contentOffsetY: self.tableView.contentOffset.y)
        generateRect(imgProjectsCell, contentOffsetY: self.tableView.contentOffset.y)
        generateRect(imgSkillsCell, contentOffsetY: self.tableView.contentOffset.y)
        generateRect(imgEducationalCell, contentOffsetY: self.tableView.contentOffset.y)
        generateRect(imgProfessionalCell, contentOffsetY: self.tableView.contentOffset.y)
        generateRect(imgInterestCell, contentOffsetY: self.tableView.contentOffset.y)
    }
    
    
    override func prefersStatusBarHidden() -> Bool {
        return true
    }
    
    override func scrollViewDidScroll(scrollView: UIScrollView) {
        
        for cell in self.tableView.visibleCells() {
            var reuseIdentifier = (cell as! UITableViewCell).reuseIdentifier
            if (reuseIdentifier == "aboutMe") {
                generateRect(imgAboutCell, contentOffsetY: scrollView.contentOffset.y)
            }
            else if (reuseIdentifier == "projects") {
                generateRect(imgProjectsCell, contentOffsetY: scrollView.contentOffset.y)
            }
            else if (reuseIdentifier == "skills") {
                generateRect(imgSkillsCell, contentOffsetY: scrollView.contentOffset.y)
            }
            else if (reuseIdentifier == "education") {
                generateRect(imgEducationalCell, contentOffsetY: scrollView.contentOffset.y)
            }
            else if (reuseIdentifier == "professional") {
                generateRect(imgProfessionalCell, contentOffsetY: scrollView.contentOffset.y)
            }
            else if (reuseIdentifier == "interest") {
                generateRect(imgInterestCell, contentOffsetY: scrollView.contentOffset.y)
            }
        }
        
    }
    
    
    //MARK: Custom Functions
    
    func generateRect(imageView : UIImageView, contentOffsetY: CGFloat) {
        
        var initY : CGFloat = -100
        var offSet = imageView.frame.origin.y - contentOffsetY
        var frame = imageView.frame
        frame.origin.y = offSet / 10
        imageView.frame.origin.y =  frame.origin.y
        
        if imageView.frame.origin.y < initY*2 {
            imageView.frame.origin.y = initY*2
        }
        
        if imageView.frame.origin.y > 0 {
            imageView.frame.origin.y = 0
        }
    }
    
    func setupInitialImagesOffset() {
        imgAboutCell.frame.origin.y =  0
        imgProjectsCell.frame.origin.y = 0
        imgSkillsCell.frame.origin.y = 0
        imgEducationalCell.frame.origin.y = 0
        imgProfessionalCell.frame.origin.y = 0
        imgInterestCell.frame.origin.y = 0
    }
    
    
    // MARK: - Table view data source
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 6
    }
    
    override func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return self.tableView.bounds.height * 0.5 - self.navigationController!.navigationBar.bounds.height / 2
    }
    
}