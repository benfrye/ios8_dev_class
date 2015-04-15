//
//  ViewController.h
//  MovableImage
//
//  Created by Ben Frye on 4/15/15.
//  Copyright (c) 2015 Classroom. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController 

@property (weak, nonatomic) IBOutlet UIImageView *movableImage;
@property (strong, nonatomic) IBOutlet UIPinchGestureRecognizer *pinchGesture;
@property (weak, nonatomic) IBOutlet UILabel *scaleLabel;

@end

