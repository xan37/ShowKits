//
//  Photo.swift
//  ShowKits
//
//  Created by Михаил Зайцев on 04.02.16.
//  Copyright © 2016 Nikolay Shubenkov. All rights reserved.
//

import UIKit
import MapKit

class Photo: NSObject {
    var name: String?
    var coordinate:CLLocationCoordinate2D
    var photoURL:String = ""
    
    init(info: [String:AnyObject]) {
        if let parsedName = info["title"] as? String {
            name = parsedName
        }
        
        guard let long = info["longitude"] as? String,
            let lat = info["latitude"] as? String else {
                coordinate = CLLocationCoordinate2D(latitude: -500, longitude: 500)
                super.init()
                return
        }
        
        coordinate = CLLocationCoordinate2D(latitude: Double(lat)!, longitude: Double(long)!)
        
        if let url = info["url_l"] as? String {
            photoURL = url
        }
        super.init()
    }
    
}
