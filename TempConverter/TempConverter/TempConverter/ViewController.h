//
//  ViewController.h
//  TempConverter
//
//  Created by Ben Frye on 4/13/15.
//  Copyright (c) 2015 Classroom. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

@property (weak, nonatomic) IBOutlet UILabel *resultLabel;
@property (weak, nonatomic) IBOutlet UITextField *tempField;

- (IBAction)convertAction:(id)sender;

@end

