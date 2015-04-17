//
//  SecondViewController.h
//  StoryboardApp
//
//  Copyright (c) 2014 Classroom. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SecondViewController : UIViewController

@property (copy, nonatomic) NSString *textValue;

@property (weak, nonatomic) IBOutlet UILabel *theLabel;

@end
