//
//  MapViewController.swift
//  MuseumAPP
//
//  Created by Paulo Rodrigo Noronha Orozco on 1/06/23.
//

import UIKit
import MapKit

class MapViewController: UIViewController {

    @IBOutlet weak var mapView: MKMapView!
    
    let locations = [
        CLLocationCoordinate2D(latitude: -12.1101194, longitude: -77.0538379),
        CLLocationCoordinate2D(latitude: -12.058461111111, longitude: -77.0368),
        CLLocationCoordinate2D(latitude: -12.086805555556, longitude: -77.001888888889),
        CLLocationCoordinate2D(latitude: -12.04808, longitude: -76.93444),
        CLLocationCoordinate2D(latitude: -12.03429, longitude: -77.01767),
        CLLocationCoordinate2D(latitude: -12.0972, longitude: -77.0403),
        CLLocationCoordinate2D(latitude: -12.2556204, longitude: -76.9070072),
        CLLocationCoordinate2D(latitude: -12.11111111, longitude: -77.03388889),
        CLLocationCoordinate2D(latitude: -12.063883, longitude: -77.03894983),
        CLLocationCoordinate2D(latitude: -12.07725, longitude: -77.062138888889),
        CLLocationCoordinate2D(latitude: -12.04791, longitude: -77.04312),
        CLLocationCoordinate2D(latitude: -12.254115, longitude: -76.910521944444),
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        mapView.delegate = self
        addAnnotationsToMap()
        zoomToAnnotations()
    }
    
    func addAnnotationsToMap() {
        for location in locations {
            let annotation = MKPointAnnotation()
            annotation.coordinate = location
            mapView.addAnnotation(annotation)
        }
    }
    
    func zoomToAnnotations() {
        var zoomRect = MKMapRect.null
        for annotation in mapView.annotations {
            let annotationPoint = MKMapPoint(annotation.coordinate)
            let pointRect = MKMapRect(x: annotationPoint.x, y: annotationPoint.y, width: 0, height: 0)
            if zoomRect.isNull {
                zoomRect = pointRect
            } else {
                zoomRect = zoomRect.union(pointRect)
            }
        }
        mapView.setVisibleMapRect(zoomRect, edgePadding: UIEdgeInsets(top: 50, left: 50, bottom: 50, right: 50), animated: true)
    }
}

extension MapViewController: MKMapViewDelegate {
    // Customize the appearance of the annotations if needed
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        // Customize the annotation view if needed
        return nil
    }
}
