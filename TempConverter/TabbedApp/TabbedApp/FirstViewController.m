//
//  FirstViewController.m
//  TabbedApp
//
//  Created by Ben Frye on 4/14/15.
//  Copyright (c) 2015 Classroom. All rights reserved.
//

#import "FirstViewController.h"

@interface FirstViewController ()
@property (weak, nonatomic) IBOutlet UILabel *incrementingCount;

@end

@implementation FirstViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)stepperChanged:(UIStepper *)sender {
    double value = [sender value];
    
    [_incrementingCount setText:[NSString stringWithFormat:@"%d", (int)value]];
}

@end
