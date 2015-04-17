//
//  Car.h
//  CarBrowser
//
//  Copyright (c) 2014 Classroom. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface Car : NSObject

@property (copy, nonatomic) NSString *make;
@property (copy, nonatomic) NSString *model;
@property (strong, nonatomic) UIImage *image;

+ (Car *)carWithMake:(NSString *)make
               model:(NSString *)model
               image:(UIImage *)image;

@end
