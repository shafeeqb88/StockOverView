//
//  ViewController.swift
//  StockOverView
//
//  Created by Shafeeq on 23/01/23.
//

import UIKit
import ArcGIS

class ViewController: UIViewController {
    
    @IBOutlet weak var mapView: AGSMapView!
    
    private func setupMap() {
        let map = AGSMap(
            basemapStyle: .arcGISTopographic
        )
        mapView.map = map
        mapView.setViewpoint(
            AGSViewpoint(
                latitude: 34.02700,
                longitude: -118.80500,
                scale: 72_000
            )
        )
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupMap()
    }


}

