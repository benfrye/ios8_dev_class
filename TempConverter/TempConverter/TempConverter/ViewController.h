//
//  ViewController.h
//  TempConverter
//
//  Created by Ben Frye on 4/13/15.
//  Copyright (c) 2015 Classroom. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

@property (weak, nonatomic) IBOutlet UITextField *farenheitField;
@property (weak, nonatomic) IBOutlet UITextField *celciusField;
@property (weak, nonatomic) IBOutlet UITextField *kelvinField;

- (IBAction)farenheitEditted:(id)sender;
- (IBAction)celciusEditted:(id)sender;
- (IBAction)kelvinEditted:(id)sender;

@end

