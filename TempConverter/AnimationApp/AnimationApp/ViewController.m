//
//  ViewController.m
//  AnimationApp
//
//  Created by Ben Frye on 4/16/15.
//  Copyright (c) 2015 Classroom. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.scaleFactor = 2.0;
    self.angle = 180;
    CGRect frameRect = CGRectMake(40, 40, 45, 45);
    self.boxView = [[UIView alloc] initWithFrame:frameRect];
    self.boxView.backgroundColor = [UIColor blueColor];
    [self.view addSubview:self.boxView];
}

-(void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    UITouch *touch = [touches anyObject];
    CGPoint location = [touch locationInView:self.view];
    
    
    //animateWithDuration
    [UIView animateWithDuration:2 delay:0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
        CGAffineTransform scaleTrans = CGAffineTransformMakeScale(self.scaleFactor, self.scaleFactor);
        
        CGAffineTransform rotateTrans = CGAffineTransformMakeRotation(self.angle * M_PI / 180);
        
        [self.boxView setTransform:CGAffineTransformConcat(scaleTrans, rotateTrans)];
        
        self.angle = (self.angle == 180 ? 360 : 180);
        self.scaleFactor = (self.scaleFactor == 2 ? 1 : 2);
        self.boxView.center = location;
    } completion:^(BOOL finished) {}];
    
    
//
//    [UIView beginAnimations:nil context:nil];
//    [UIView setAnimationDelegate:self];
//    [UIView setAnimationDuration:2];
//    [UIView setAnimationCurve:UIViewAnimationCurveEaseInOut];
    
//    CGAffineTransform scaleTrans = CGAffineTransformMakeScale(self.scaleFactor, self.scaleFactor);
//    
//    CGAffineTransform rotateTrans = CGAffineTransformMakeRotation(self.angle * M_PI / 180);
//    
//    [self.boxView setTransform:CGAffineTransformConcat(scaleTrans, rotateTrans)];
//    
//    self.angle = (self.angle == 180 ? 360 : 180);
//    self.scaleFactor = (self.scaleFactor == 2 ? 1 : 2);
//    self.boxView.center = location;
//    
//    [UIView commitAnimations];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
