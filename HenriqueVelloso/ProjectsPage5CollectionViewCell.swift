//
//  ProjectsPage5CollectionViewCell.swift
//  HenriqueVelloso
//
//  Created by Henrique Velloso on 4/25/15.
//
//

import UIKit

class ProjectsPage5CollectionViewCell: UICollectionViewCell {
    
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
            UIImage(named: "music01")!,
            UIImage(named: "music02")!,
            UIImage(named: "music03")!

        ]
        
        imgTrapRaider.animationImages = images
        imgTrapRaider.animationDuration = 4
        imgTrapRaider.animationRepeatCount = 0
        imgTrapRaider.startAnimating()
        
    }
    
}
