//
//  AttractionAnnotationView.swift
//  SeeCampus
//
//  Created by Yusheng Xu on 7/21/19.
//  Copyright © 2019 Edison Yang. All rights reserved.
//

import UIKit
import MapKit

class AttractionAnnotationView: MKMarkerAnnotationView {
    // Required for MKAnnotationView
    static let ReuseID = "mainAnnotation"
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override init(annotation: MKAnnotation?, reuseIdentifier: String?) {
        super.init(annotation: annotation, reuseIdentifier: reuseIdentifier)
    }
    

    override var annotation: MKAnnotation? {
        willSet {
            // 1
            //guard let attractionAnnotation = newValue as? AttractionAnnotation else { return }

            guard let attractionAnnotation = self.annotation as? AttractionAnnotation else { return }
            image = attractionAnnotation.type.image()
            self.frame.size = CGSize(width: 35, height: 35)
            displayPriority = MKFeatureDisplayPriority(rawValue:Float( attractionAnnotation.priority ?? 0))
            canShowCallout = true
            calloutOffset = CGPoint(x: 0, y: -4)
            rightCalloutAccessoryView = UIButton(type: .detailDisclosure)
            // 2
            markerTintColor = UIColor.clear
            subtitleVisibility = .adaptive
            titleVisibility = .adaptive
            glyphImage = UIImage()
            
            //glyphText = String(attractionAnnotation.type)
            //let image = attractionAnnotation.type.image()
            collisionMode = .circle
        }
    }
}

class TVAAnnotationView: MKMarkerAnnotationView {
    // Required for MKAnnotationView
    static let ReuseID = "TVAAnnotation"
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override init(annotation: MKAnnotation?, reuseIdentifier: String?) {
        super.init(annotation: annotation, reuseIdentifier: reuseIdentifier)
    }
    
    override var annotation: MKAnnotation? {
        willSet {
            // 1
            //guard let attractionAnnotation = newValue as? AttractionAnnotation else { return }
            guard let attractionAnnotation = self.annotation as? AttractionAnnotation else { return }
            displayPriority = MKFeatureDisplayPriority(rawValue:Float( attractionAnnotation.priority ?? 0))
            glyphText = String((attractionAnnotation.title?.last!)!)
            //image = attractionAnnotation.type.image()
            //self.frame.size = CGSize(width: 40, height: 40)
            canShowCallout = true
            calloutOffset = CGPoint(x: 0, y: 20)
            rightCalloutAccessoryView = UIButton(type: .detailDisclosure)
            // 2
            //markerTintColor = UIColor.clear
            subtitleVisibility = .hidden
            titleVisibility = .adaptive
            //glyphImage = UIImage()
            //glyphText = String(attractionAnnotation.type)
            //let image = attractionAnnotation.type.image()
            collisionMode = .circle
            isHidden = true
        }
    }
}
