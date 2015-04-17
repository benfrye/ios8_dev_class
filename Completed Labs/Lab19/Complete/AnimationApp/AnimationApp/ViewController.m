//
//  ViewController.m
//  AnimationApp
//
//  Copyright (c) 2014 Classroom. All rights reserved.
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

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    UITouch *touch = [touches anyObject];
    CGPoint location = [touch locationInView:self.view];
    
    [UIView beginAnimations:nil context:nil];
    
    [UIView setAnimationDelegate:self];
    [UIView setAnimationDuration:2];
    [UIView setAnimationCurve:UIViewAnimationCurveEaseInOut];
    
    CGAffineTransform scaleTrans = CGAffineTransformMakeScale(
                                                              self.scaleFactor, self.scaleFactor);
    
    CGAffineTransform rotateTrans = CGAffineTransformMakeRotation(
                                                                  self.angle * M_PI / 180);
    
    [self.boxView setTransform:CGAffineTransformConcat(
                                                       scaleTrans, rotateTrans)];
    
    self.angle = (self.angle == 180 ? 360 : 180);
    self.scaleFactor = (self.scaleFactor == 2 ? 1 : 2);
    self.boxView.center = location;
    
    [UIView commitAnimations];
}

@end
