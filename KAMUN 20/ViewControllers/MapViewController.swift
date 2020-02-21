//
//  MapViewController.swift
//  KAMUN 20
//
//  Created by Noredeen AL-Zu'bi on 2/12/20.
//  Copyright © 2020 Bashar Al-Zu'bi. All rights reserved.
//

import UIKit
import  GoogleMaps

class MapViewController: UIViewController {
    
    public var startingLocation: [Double] = [31.752567,35.846952]
    public var segueLocation: [Double] = []
    
    
    var locationManager = CLLocationManager()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.isNavigationBarHidden = false
        // Do any additional setup after loading the view.
        self.navigationController?.navigationBar.setBackgroundImage(nil, for: UIBarMetrics.default)
        self.navigationController?.view.backgroundColor = nil

       
        
    }
    
    override func loadView() {
         let camera = GMSCameraPosition.camera(withLatitude: startingLocation[0], longitude: startingLocation[1], zoom: 17.5, bearing: 66, viewingAngle: 0)
               let mapView = GMSMapView.map(withFrame: CGRect.zero, camera: camera)
               mapView.mapType =  .satellite
               mapView.settings.rotateGestures = false
               mapView.settings.tiltGestures = false
               mapView.isMyLocationEnabled = true
               
               for (name,location) in locationsOnMap{
                   let position = CLLocationCoordinate2D(latitude: location[0], longitude: location[1])
                   let marker = GMSMarker(position: position)
                   marker.title = name
                   marker.map = mapView
                   marker.snippet = name
                
                    if(segueLocation.count > 0 && location[0] == segueLocation[0] && location[1] == segueLocation[1]){
                          mapView.selectedMarker = marker
                        mapView.animate(to: GMSCameraPosition.camera(withLatitude: location[0], longitude: location[1], zoom: 17.5, bearing: 66, viewingAngle: 0))
                    }
                   
               
               }
        
      //  if segueLocation.count > 0 {
                              
                              
                 //          mapView.selectedMarker = GMSMarker(position: CLLocationCoordinate2D(latitude: (locationsOnMap[segueLocation]?[0])!, longitude: (locationsOnMap[segueLocation]?[1])!))
                              
               //           }
        
        view = mapView
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
