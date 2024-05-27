//
//  BeaconManager.swift
//  CodeQuestGame
//
//  Created by Romi Fadhurohman Nabil on 21/05/24.
//

import Foundation
import CoreLocation

class BeaconManager: NSObject, ObservableObject, CLLocationManagerDelegate {
    private var locationManager: CLLocationManager
    @Published var nearestBeacon: CLBeacon?
    @Published var questAvailable: Bool = false
    
    override init() {
        locationManager = CLLocationManager()
        super.init()
        locationManager.delegate = self
        locationManager.requestAlwaysAuthorization()
    }
    
    func startMonitoring() {
        let beaconRegion = CLBeaconRegion(uuid: UUID(uuidString: "14D8F312-5213-4674-AD77-95F3AF932992")!, identifier: "Beacon1")
        
        locationManager.startMonitoring(for: beaconRegion)
        locationManager.startRangingBeacons(satisfying: beaconRegion.beaconIdentityConstraint)
    }
    
    func locationManager(_ manager: CLLocationManager, didRange beacons: [CLBeacon], satisfying constraint: CLBeaconIdentityConstraint) {
        if let nearestBeacon = beacons.first {
            self.nearestBeacon = nearestBeacon
            checkProximity(beacon: nearestBeacon)
        }
    }
    
    private func checkProximity(beacon: CLBeacon) {
        if beacon.proximity == .immediate {
            // Device is very close to the beacon
            questAvailable = true
        } else {
            questAvailable = false
        }
    }
}
