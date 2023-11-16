//
//  CustomAnnotation.swift
//  SMUthie
//
//  Created by 김유빈 on 2023/11/16.
//

import Foundation
import MapKit

final class CustomAnnotation: NSObject, MKAnnotation {
    let coordinate: CLLocationCoordinate2D
    let mapResult: MapResult
    
    init(coordinate: CLLocationCoordinate2D, mapResult: MapResult) {
        self.coordinate = coordinate
        self.mapResult = mapResult
    }
}
