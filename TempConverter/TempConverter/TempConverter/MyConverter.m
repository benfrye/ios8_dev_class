//
//  MyConverter.m
//  TempConverter
//
//  Created by Ben Frye on 4/13/15.
//  Copyright (c) 2015 Classroom. All rights reserved.
//

#import "MyConverter.h"

@implementation MyConverter

- (id) init
{
    if (self = [super init])
    {
        _temperatureScale = F;
        _temperature = 32.0;
    }
    return self;
}

- (float) convert:(TempScale)scale
{
    float tempInFarenheit = 0.0, tempInCelcius = 0.0, tempInKelvin = 0.0;
    switch (_temperatureScale)
    {
        case F:
            tempInFarenheit = _temperature;
            tempInCelcius = (tempInFarenheit - 32.0) * (5.0 / 9.0);
            tempInKelvin = (tempInFarenheit + 459.67) * (5.0 / 9.0);
            break;
        case C:
            tempInCelcius = _temperature;
            tempInFarenheit = tempInCelcius * (9.0 / 5.0) + 32.0;
            tempInKelvin = tempInCelcius + 273.15;
            break;
        case K:
            tempInKelvin = _temperature;
            tempInFarenheit = tempInKelvin * (9.0 / 5.0) - 459.67;
            tempInCelcius = tempInKelvin - 273.15;
            break;
    }
    switch (scale) {
        case F: return tempInFarenheit;
        case C: return tempInCelcius;
        case K: return tempInKelvin;
    }
}

@end
