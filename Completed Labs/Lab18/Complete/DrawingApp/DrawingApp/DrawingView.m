//
//  DrawingView.m
//  DrawingApp
//
//  Copyright (c) 2014 Classroom. All rights reserved.
//

#import "DrawingView.h"

@implementation DrawingView

- (void)drawRect:(CGRect)rect
{
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetLineWidth(context, 4.0);
    CGContextSetStrokeColorWithColor(context, [[UIColor blueColor] CGColor]);
    
    CGContextMoveToPoint(context, 50, 50);
    CGContextAddLineToPoint(context, 300, 400);
    CGContextStrokePath(context);
    
    CGRect rectangle = CGRectMake(60, 170, 200, 80);
    CGContextAddRect(context, rectangle);
    CGContextStrokePath(context);
    
    CGRect rectangle2 = CGRectMake(60, 170, 200, 80);
    CGContextAddEllipseInRect(context, rectangle2);
    CGContextStrokePath(context);
}

@end
