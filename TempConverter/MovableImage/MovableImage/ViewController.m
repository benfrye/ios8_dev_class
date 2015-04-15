//
//  ViewController.m
//  MovableImage
//
//  Created by Ben Frye on 4/15/15.
//  Copyright (c) 2015 Classroom. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.movableImage.image = [UIImage imageNamed:@"ChevyVolt"];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    UITouch *touch = [touches anyObject];
    
    CGPoint p = [touch locationInView:self.view];
    self.movableImage.center = p;
}

-(void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event
{
    UITouch *touch = [touches anyObject];
    
    CGPoint p = [touch locationInView:self.view];
    self.movableImage.center = p;
}

@end
