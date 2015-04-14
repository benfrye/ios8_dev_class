//
//  MyConverter.h
//  TempConverter
//
//  Created by Ben Frye on 4/13/15.
//  Copyright (c) 2015 Classroom. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MyConverter : NSObject

typedef enum { F, C, K } TempScale;

@property TempScale temperatureScale;
@property float temperature;

- (float) convert: (TempScale) scale;

@end
