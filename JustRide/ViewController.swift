//
//  ViewController.swift
//  JustRide
//
//  Created by Charlyn Gonda on 8/24/16.
//  Copyright © 2016 Charlyn Gonda. All rights reserved.
//

import UIKit
import UberRides
import CoreLocation

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // ride request button
        let button = RideRequestButton()
        
        // set a dropoff location
        let dropoffLocation = CLLocation(latitude: 37.6213129, longitude: -122.3789554)
        let builder = RideParametersBuilder()
                        .setDropoffLocation(dropoffLocation,
                                            nickname: "San Francisco International Airport")
        button.rideParameters = builder.build()
        
        // center the button
        button.center = view.center
        
        //put the button in the view
        view.addSubview(button)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

