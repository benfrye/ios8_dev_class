//
//  ViewController.h
//  MapApp
//
//  Copyright (c) 2014 Classroom. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>

@interface ViewController : UIViewController <MKMapViewDelegate>

@property (weak, nonatomic) IBOutlet MKMapView *mapView;

- (IBAction)typeAction:(id)sender;

@end

