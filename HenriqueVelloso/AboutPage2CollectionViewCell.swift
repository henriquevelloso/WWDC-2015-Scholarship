//
//  AboutPage2CollectionViewCell.swift
//  HenriqueVelloso
//
//  Created by Henrique Velloso on 4/20/15.
//
//

import UIKit
import CoreLocation
import MapKit

class AboutPage2CollectionViewCell: UICollectionViewCell {

    
    @IBOutlet weak var map: MKMapView!
    @IBOutlet weak var viewContainer: UIView!

    @IBOutlet weak var imgHeader: UIImageView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        viewContainer.layer.cornerRadius = 8
        
        self.imgHeader.blurImage()
        
        self.map.zoomEnabled = true;
        self.map.scrollEnabled = false;
        self.map.userInteractionEnabled = true;
        
        var track = CLLocationCoordinate2D()
        track.latitude = -30.042687;
        track.longitude = -51.2162737
        
        var region = MKCoordinateRegion();
        var span = MKCoordinateSpan();
        span.latitudeDelta = 40;
        span.longitudeDelta = 40;
        region.span = span;
        region.center = track;
        
        var annotation =   MKPointAnnotation()
        annotation.coordinate = track
        
        map.addAnnotation(annotation)
        map.setRegion(region, animated: true)
        map.regionThatFits(region)

        
    }

}
