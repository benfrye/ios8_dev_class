//
//  FieldView.m
//  Tic-Tac-Toe
//
//  Created by Ben Frye on 4/16/15.
//  Copyright (c) 2015 Classroom. All rights reserved.
//

#import "FieldView.h"

@implementation FieldView

// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetLineWidth(context, 4.0);
    CGContextSetStrokeColorWithColor(context, [[UIColor blackColor] CGColor]);
    
    CGContextMoveToPoint(context, 220, 100);
    CGContextAddLineToPoint(context, 220, 500);
    
    CGContextMoveToPoint(context, 370, 100);
    CGContextAddLineToPoint(context, 370, 500);
    
    CGContextMoveToPoint(context, 130, 220);
    CGContextAddLineToPoint(context, 500, 220);
    
    CGContextMoveToPoint(context, 130, 370);
    CGContextAddLineToPoint(context, 500, 370);
    
    
    CGContextStrokePath(context);
}

@end
