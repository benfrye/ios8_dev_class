//
//  ViewController.m
//  MapApp
//
//  Created by Ben Frye on 4/16/15.
//  Copyright (c) 2015 Classroom. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet MKMapView *mapView;
@property (weak, nonatomic) IBOutlet UIButton *typeButton;

@end

@implementation ViewController
{
    CLLocation *originalUserLocation;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    UITapGestureRecognizer *tgr = [[UITapGestureRecognizer alloc]
                                   initWithTarget:self action:@selector(handleGesture:)];
    tgr.numberOfTapsRequired = 1;
    tgr.numberOfTouchesRequired = 1;
    [self.mapView addGestureRecognizer:tgr];
    
    self.locationManager = [[CLLocationManager alloc] init];
    self.locationManager.desiredAccuracy = kCLLocationAccuracyBest;
    self.locationManager.delegate = self;
    [self.locationManager requestWhenInUseAuthorization];
    [self.locationManager startUpdatingLocation];
    
    CLLocationCoordinate2D annotationCoord;
    annotationCoord.latitude = 47.640071;
    annotationCoord.longitude = -122.129598;
    
    MKPointAnnotation *ap = [[MKPointAnnotation alloc] init];
    ap.coordinate = annotationCoord;
    ap.title = @"Microsoft";
    ap.subtitle = @"Microsoft Headquarters";
    [self.mapView addAnnotation:ap];
    
    [NSTimer scheduledTimerWithTimeInterval:2. target:self selector:@selector(updateSpan) userInfo:nil repeats:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)typeAction:(id)sender {
    if (self.mapView.mapType == MKMapTypeStandard)
    {
        self.mapView.mapType = MKMapTypeSatellite;
    }
    else
    {
        self.mapView.mapType = MKMapTypeStandard;
    }
}

-(void)updateSpan
{
    [UIView animateWithDuration:2. animations:^{
//        MKCoordinateRegion newRegion = MKCoordinateRegionMakeWithDistance(self.mapView.userLocation.coordinate, 20, 20);
//        [self.mapView setRegion:newRegion];
    }];
}

-(void)mapView:(MKMapView *)mapView didUpdateUserLocation:(MKUserLocation *)userLocation
{
    originalUserLocation = [[CLLocation alloc] initWithCoordinate:userLocation.location.coordinate altitude:1 horizontalAccuracy:1 verticalAccuracy:1 timestamp:nil];
}
- (void)handleGesture:(UIGestureRecognizer *)gestureRecognizer
{
    CGPoint touchPoint = [gestureRecognizer locationInView:self.mapView];
    CLLocationCoordinate2D touchMapCoordinate = [self.mapView convertPoint:touchPoint toCoordinateFromView:self.mapView];
    
    MKPointAnnotation *ap = [[MKPointAnnotation alloc] init];
    ap.coordinate = touchMapCoordinate;
    
    CLLocation *newLocation = [[CLLocation alloc] initWithCoordinate:touchMapCoordinate altitude:1 horizontalAccuracy:1 verticalAccuracy:1 timestamp:nil];
    CLLocationDistance distanceChange = [newLocation distanceFromLocation:originalUserLocation];
    ap.title = [NSString stringWithFormat:@"%f", distanceChange];
    
    [self.mapView addAnnotation:ap];
}

@end
