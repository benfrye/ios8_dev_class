//
//  ViewController.m
//  TempConverter
//
//  Created by Ben Frye on 4/13/15.
//  Copyright (c) 2015 Classroom. All rights reserved.
//

#import "ViewController.h"
#import "MyConverter.h"

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

- (IBAction)convertAction:(id)sender {
    float temp = [[[self tempField] text] floatValue];
    
    MyConverter *converter = [[MyConverter alloc] init];
    converter.temperatureScale = F;
    converter.temperature = temp;
    float result = [converter convert:temp];
    
    [[self resultLabel] setText:[NSString stringWithFormat:@"%f", result]];
}
@end
