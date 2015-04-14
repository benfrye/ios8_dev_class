//
//  Car.h
//  CarBrowser
//
//  Created by Ben Frye on 4/14/15.
//  Copyright (c) 2015 Classroom. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface Car : NSObject

@property (copy, nonatomic) NSString *make;
@property (copy, nonatomic) NSString *model;
@property (strong, nonatomic) UIImage *image;

+ (Car *)carWithMake:(NSString *)make
               model:(NSString *)model
               image:(UIImage *) image;

@end
