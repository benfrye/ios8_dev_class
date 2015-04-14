//
//  SecondViewController.m
//  TabbedApp
//
//  Created by Ben Frye on 4/14/15.
//  Copyright (c) 2015 Classroom. All rights reserved.
//

#import "SecondViewController.h"

@interface SecondViewController ()
@property (weak, nonatomic) IBOutlet UILabel *shadingLabel;

@end

@implementation SecondViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)shaderChanged:(UISlider *)sender {
    double value = 1 - [sender value];
    _shadingLabel.textColor = [UIColor colorWithRed:value green: value blue: value alpha: 1.0];
}

@end
