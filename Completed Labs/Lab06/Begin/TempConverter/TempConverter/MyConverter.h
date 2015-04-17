//
//  MyConverter.h
//  TempConverter
//
//  Copyright (c) 2014 Classroom. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef enum { F, C, K } TempScale;

@interface MyConverter : NSObject

@property TempScale temperatureScale;
@property float temperature;

- (float)convert:(TempScale)scale;

@end
