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
    
    UIPinchGestureRecognizer *pinch = [[UIPinchGestureRecognizer alloc] initWithTarget:self action:@selector(pinchDetected:)];
    [[self view] addGestureRecognizer:pinch];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)pinchDetected:(UIPinchGestureRecognizer*)gestureRecognizer;
{
    self.scaleLabel.text = [NSString stringWithFormat:@"%f", gestureRecognizer.scale];
    self.movableImage.frame = CGRectMake(self.movableImage.frame.origin.x, self.movableImage.frame.origin.y, self.movableImage.frame.size.width*gestureRecognizer.scale, self.movableImage.frame.size.height*gestureRecognizer.scale);
}

//-(void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
//{
//    UITouch *touch = [touches anyObject];
//    
//    CGPoint p = [touch locationInView:self.view];
//    self.movableImage.center = p;
//}
//
//-(void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event
//{
//    UITouch *touch = [touches anyObject];
//    
//    CGPoint p = [touch locationInView:self.view];
//    self.movableImage.center = p;
//}

@end
