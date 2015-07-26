//
//  SendViewController.swift
//  Bumpay
//
//  Created by Aayush Ranaut on 7/26/15.
//  Copyright (c) 2015 Prathmesh Ranaut. All rights reserved.
//

import UIKit
import CoreLocation

class SendViewController : UIViewController, CLLocationManagerDelegate
{
    var locationManager: CLLocationManager!
    var location: CLLocation! {
        didSet {
            //What happens when this is set
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        locationManager = CLLocationManager()
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        
        checkCLPermissions()
        //DETECT Accelerometer!
        
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        self.becomeFirstResponder()
    }
    
    override func canBecomeFirstResponder() -> Bool {
        return true
    }
    
    func checkCLPermissions()
    {
        if CLLocationManager.authorizationStatus() == .AuthorizedWhenInUse {
            locationManager.startUpdatingLocation()
        }
    }
    
    // MARK: - CLLocationManagerDelegate
    
    func locationManager(manager: CLLocationManager!, didUpdateLocations locations: [AnyObject]!) {
        location = (locations as! [CLLocation]).last
        locationManager.stopUpdatingLocation()
    }
    
    override func motionEnded(motion: UIEventSubtype, withEvent event: UIEvent!) {
        if(event.subtype == UIEventSubtype.MotionShake) {
            println("Shake ended")
        }
    }
}