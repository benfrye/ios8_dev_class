//
//  ViewController.h
//  TempConverter
//
//  Copyright (c) 2014 Classroom. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

@property (weak, nonatomic) IBOutlet UITextField *tempField;
@property (weak, nonatomic) IBOutlet UILabel *resultLabel;

- (IBAction)convertAction:(id)sender;

@end

