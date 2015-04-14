//
//  Car.m
//  CarBrowser
//
//  Created by Ben Frye on 4/14/15.
//  Copyright (c) 2015 Classroom. All rights reserved.
//

#import "Car.h"

@implementation Car

+ (Car *)carWithMake:(NSString *)make
               model:(NSString *)model
               image:(UIImage *)image
{
    Car *car = [[Car alloc] init];
    
    car.make = make;
    car.model = model;
    car.image = image;
    
    return car;
}

@end
