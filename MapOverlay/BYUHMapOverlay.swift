//
//  BYUHMapOverlay.swift
//  SeeCampus
//
//  Created by Yusheng Xu on 7/20/19.
//  Copyright © 2019 Edison Yang. All rights reserved.
//

import UIKit
import MapKit

class BYUHMapOverlay: NSObject, MKOverlay {
    var coordinate: CLLocationCoordinate2D
    var boundingMapRect: MKMapRect
    var image: UIImage?
    init(map: Map, atImage: UIImage) {
        boundingMapRect = map.overlayBoundingMapRect
        coordinate = map.midCoordinate
        image = atImage
    }
}

