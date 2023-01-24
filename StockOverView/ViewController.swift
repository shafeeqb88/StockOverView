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
    
    private func addGraphics() {
        
        let graphicsOverlay = AGSGraphicsOverlay()
        mapView.graphicsOverlays.add(graphicsOverlay)
        
        let point = AGSPoint(x: -118.80657463861, y: 34.0005930608889, spatialReference: .wgs84())
        let pointSymbol = AGSSimpleMarkerSymbol(style: .circle, color: .orange, size: 10.0)
        
        pointSymbol.outline = AGSSimpleLineSymbol(style: .solid, color: .blue, width: 2.0)
        
        let pointGraphic = AGSGraphic(geometry: point, symbol: pointSymbol)
        
        graphicsOverlay.graphics.add(pointGraphic)
        
        
        let polyline = AGSPolyline(
            points: [
                AGSPoint(x: -118.821527826096, y: 34.0139576938577, spatialReference: .wgs84()),
                AGSPoint(x: -118.814893761649, y: 34.0080602407843, spatialReference: .wgs84()),
                AGSPoint(x: -118.808878330345, y: 34.0016642996246, spatialReference: .wgs84())
            ]
        )
        
        let polylineSymbol = AGSSimpleLineSymbol(style: .solid, color: .blue, width: 3.0)
        
        let polylineGraphic = AGSGraphic(geometry: polyline, symbol: polylineSymbol)
        
        graphicsOverlay.graphics.add(polylineGraphic)
        
        
        let polygon = AGSPolygon(
            points: [
                AGSPoint(x: -118.818984489994, y: 34.0137559967283, spatialReference: .wgs84()),
                AGSPoint(x: -118.806796597377, y: 34.0215816298725, spatialReference: .wgs84()),
                AGSPoint(x: -118.791432890735, y: 34.0163883241613, spatialReference: .wgs84()),
                AGSPoint(x: -118.79596686535, y: 34.008564864635, spatialReference: .wgs84()),
                AGSPoint(x: -118.808558110679, y: 34.0035027131376, spatialReference: .wgs84())
            ]
        )
        
        let polygonSymbol = AGSSimpleFillSymbol(style: .solid, color: .orange, outline: AGSSimpleLineSymbol(style: .solid, color: .blue, width: 2.0))
        
        let polygonGraphic = AGSGraphic(geometry: polygon, symbol: polygonSymbol)
        
        graphicsOverlay.graphics.add(polygonGraphic)
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupMap()
        addGraphics()
    }
    
    
}

