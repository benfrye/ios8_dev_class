//
//  ViewController.m
//  GestureApp
//
//  Copyright (c) 2014 Classroom. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)reportEvent:(NSString *)method touches:(NSSet *)touches
{
    UITouch *touch = [touches anyObject];
    
    NSInteger touchCount = touches.count;
    NSInteger tapCount = touch.tapCount;
    CGPoint p = [touch locationInView:self.view];
    
    self.methodLabel.text = method;
    self.touchesLabel.text = [NSString stringWithFormat:
                              @"%ld touches", (long)touchCount];
    
    self.tapsLabel.text = [NSString stringWithFormat:@"%ld taps", (long)tapCount];
    self.positionLabel.text = [NSString stringWithFormat:
                               @"(%.2f, %.2f)", p.x, p.y];
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [self reportEvent:@"touchesBegan" touches:touches];
}

- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event
{
    [self reportEvent:@"touchesMoved" touches:touches];
}

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    [self reportEvent:@"touchesEnded" touches:touches];
}

@end
