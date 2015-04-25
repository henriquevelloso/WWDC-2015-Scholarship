//
//  EducationPageCollectionViewCell.swift
//  HenriqueVelloso
//
//  Created by Henrique Velloso on 4/24/15.
//
//

import UIKit

class EducationPageCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var viewContainer: UIView!
    @IBOutlet weak var imgHeader: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        viewContainer.layer.cornerRadius = 8
        
        self.imgHeader.blurImage()
        viewContainer.addParallax(20, maximumRelativeValue: -20)
        
    }
}
