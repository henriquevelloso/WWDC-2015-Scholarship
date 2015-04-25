//
//  ProjectsPage4CollectionViewCell.swift
//  HenriqueVelloso
//
//  Created by Henrique Velloso on 4/25/15.
//
//

import UIKit

class ProjectsPage4CollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var viewContainer: UIView!
    @IBOutlet weak var imgHeader: UIImageView!
    
    @IBOutlet weak var imgTrapRaider: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        viewContainer.layer.cornerRadius = 8
        
        self.imgHeader.blurImage()
        viewContainer.addParallax(20, maximumRelativeValue: -20)
        
        animateImage()
    }
    
    func animateImage() {
        
        var images: [UIImage] = [
            UIImage(named: "facelette01")!,
            UIImage(named: "facelette02")!
        ]
        
        imgTrapRaider.animationImages = images
        imgTrapRaider.animationDuration = 4
        imgTrapRaider.animationRepeatCount = 0
        imgTrapRaider.startAnimating()
        
    }
    
}