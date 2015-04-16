//
//  ViewController.h
//  MapApp
//
//  Created by Ben Frye on 4/16/15.
//  Copyright (c) 2015 Classroom. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>
#import <CoreLocation/CoreLocation.h>

@interface ViewController : UIViewController <MKMapViewDelegate, CLLocationManagerDelegate>

@property CLLocationManager *locationManager;

@end

