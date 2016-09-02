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

    let ridesClient = RidesClient()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let button = RideRequestButton()
        let pickupLocation = CLLocation(latitude: 37.775159, longitude: -122.417907)
        let dropoffLocation = CLLocation(latitude: 37.6213129, longitude: -122.3789554)
        
        //make sure that the pickupLocation and dropoffLocation is set in the deeplink
        let builder = RideParametersBuilder()
            .setPickupLocation(pickupLocation)
            // nickname or address is required to properly display destination on the Uber App
            .setDropoffLocation(dropoffLocation,
                                nickname: "San Francisco International Airport")
        
        // use the same pickupLocation to get the estimate
        ridesClient.fetchCheapestProduct(pickupLocation: pickupLocation, completion: {
            product, response in
            if let productID = product?.productID { //check if the productID exists
                builder.setProductID(productID)
                button.rideParameters = builder.build()
                
                // show estimate in the button
                button.loadRideInformation()
            }
        })
        
        // center the button
        button.center = view.center
        
        //put the button in the view
        view.addSubview(button)

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

}

