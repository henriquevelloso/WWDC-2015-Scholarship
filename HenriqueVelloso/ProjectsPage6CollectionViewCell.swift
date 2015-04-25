//
//  ProjectsPage6CollectionViewCell.swift
//  HenriqueVelloso
//
//  Created by Henrique Velloso on 4/25/15.
//
//

import UIKit

class ProjectsPage6CollectionViewCell: UICollectionViewCell {
    
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
            UIImage(named: "redbull01")!,
            UIImage(named: "redbull02")!
        ]
        
        imgTrapRaider.animationImages = images
        imgTrapRaider.animationDuration = 3
        imgTrapRaider.animationRepeatCount = 0
        imgTrapRaider.startAnimating()
        
    }
    
}
