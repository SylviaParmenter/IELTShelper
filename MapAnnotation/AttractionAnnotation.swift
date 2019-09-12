//
//  AttractionAnnotation.swift
//  SeeCampus
//
//  Created by Yusheng Xu on 7/21/19.
//  Copyright © 2019 Edison Yang. All rights reserved.
//

import UIKit
import MapKit

enum AttractionType : String{
    case misc
    case housing
    case food
    case firstAid
    case church
    case library
    case sports
    case administration
    case health
    case store
    case TVA
    case delivery
    case parking
    case flag
    case hub
    case sewing
    case swimming
    case gym
    case security
    case museum
    case multimediaLab
    case testingCenter
    case HGB
    case MPC
    
    func image() -> UIImage {
        switch self {
        case .misc:
            return #imageLiteral(resourceName: "star")
        case .housing:
            return #imageLiteral(resourceName: "housing")
        case .food:
            return #imageLiteral(resourceName: "food")
        case .firstAid:
            return #imageLiteral(resourceName: "firstaid")
        case .church:
            return #imageLiteral(resourceName: "Church")
        case .library:
            return #imageLiteral(resourceName: "library")
        case .sports:
            return #imageLiteral(resourceName: "sports")
        case .administration:
            return #imageLiteral(resourceName: "administration")
        case .health:
            return #imageLiteral(resourceName: "health")
        case .store:
            return #imageLiteral(resourceName: "store")
        case .TVA:
            return #imageLiteral(resourceName: "housing")
        case .delivery:
            return #imageLiteral(resourceName: "Delivery")
        case .parking:
            return #imageLiteral(resourceName: "Parking")
        case .flag:
            return #imageLiteral(resourceName: "flag")
        case .hub:
            return #imageLiteral(resourceName: "bowling")
        case .sewing:
            return #imageLiteral(resourceName: "sewing")
        case .swimming:
            return #imageLiteral(resourceName: "swimming")
        case .gym:
            return #imageLiteral(resourceName: "gym")
        case .security:
            return #imageLiteral(resourceName: "security")
        case .museum:
            return #imageLiteral(resourceName: "museum")
        case .multimediaLab:
            return #imageLiteral(resourceName: "multimediaLab")
        case .testingCenter:
            return #imageLiteral(resourceName: "testingCenter")
        case .HGB:
            return #imageLiteral(resourceName: "HGB")
        case .MPC:
            return #imageLiteral(resourceName: "mpc")
        }
    }
}

class AttractionAnnotation: NSObject, MKAnnotation {
    var coordinate: CLLocationCoordinate2D
    var title: String?
    var subtitle: String?
    var type: AttractionType
    var priority: Int?
    
    init(coordinate: CLLocationCoordinate2D, title: String, subtitle: String, type: AttractionType, priority: Int) {
        self.coordinate = coordinate
        self.title = title
        self.subtitle = subtitle
        self.type = type
        self.priority = priority
    }

}
