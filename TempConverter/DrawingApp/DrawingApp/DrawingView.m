//
//  DrawingView.m
//  DrawingApp
//
//  Created by Ben Frye on 4/16/15.
//  Copyright (c) 2015 Classroom. All rights reserved.
//

#import "DrawingView.h"

@implementation DrawingView


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetLineWidth(context, 4.0);
    CGContextSetStrokeColorWithColor(context, [[UIColor cyanColor] CGColor]);
    
    CGRect rectangle = CGRectMake(60, 170, 200, 200);
    CGContextAddEllipseInRect(context, rectangle);
    CGContextAddArcToPoint(context, 60, 170, 160, 270, 25);
    
    CGContextMoveToPoint(context, 90, 220);
    CGContextAddLineToPoint(context, 120, 300);
    
    
    CGContextStrokePath(context);
    
    
    //Ellipse
//    CGRect rectangle = CGRectMake(60, 170, 200, 80);
//    CGContextAddEllipseInRect(context, rectangle);
//    CGContextStrokePath(context);
    
    //Rectangle
//    CGRect rectangle = CGRectMake(60, 170, 200, 80);
//    CGContextAddRect(context, rectangle);
//    CGContextStrokePath(context);
    
    //Line
//    CGContextMoveToPoint(context, 50, 50);
//    CGContextAddLineToPoint(context, 300, 400);
//    CGContextStrokePath(context);
}


@end
