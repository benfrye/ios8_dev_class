//
//  MyConverter.m
//  TempConverter
//
//  Copyright (c) 2014 Classroom. All rights reserved.
//

#import "MyConverter.h"

@implementation MyConverter

- (id)init
{
    if (self = [super init])
    {
        _temperatureScale = F;
        _temperature = 32.0;
    }
    return self;
}

- (float)convert:(TempScale)scale
{
    float f = 0.0, c = 0.0, k = 0.0;
    switch (_temperatureScale)
    {
        case F:
            f = _temperature;
            c = (f - 32.0) * (5.0 / 9.0);
            k = (f + 459.67) * (5.0 / 9.0);
            break;
        case C:
            c = _temperature;
            f = c * (9.0 / 5.0) + 32.0;
            k = c + 273.15;
            break;
        case K:
            k = _temperature;
            f = k * (9.0 / 5.0) - 459.67;
            c = k - 273.15;
            break;
    }
    switch (scale)
    {
        case F: return f;
        case C: return c;
        case K: return k;
    }
}

@end
