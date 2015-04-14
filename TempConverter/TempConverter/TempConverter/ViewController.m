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

@property MyConverter *converter;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    _converter = [[MyConverter alloc] init];
    _converter.temperatureScale = F;
    _converter.temperature = 32.0;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)farenheitEditted:(id)sender {
    float farenheitTemp = [[[self farenheitField] text] floatValue];
    float convertedTemp;
    
    _converter.temperatureScale = F;
    _converter.temperature = farenheitTemp;
    convertedTemp = [_converter convert:C];
    [[self celciusField] setText:[NSString stringWithFormat:@"%f", convertedTemp]];
    
    convertedTemp = [_converter convert:K];
    [[self kelvinField] setText:[NSString stringWithFormat:@"%f", convertedTemp]];
}

- (IBAction)celciusEditted:(id)sender {
}

- (IBAction)kelvinEditted:(id)sender {
}
@end
