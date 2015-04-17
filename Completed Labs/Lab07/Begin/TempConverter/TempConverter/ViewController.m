//
//  ViewController.m
//  TempConverter
//
//  Copyright (c) 2014 Classroom. All rights reserved.
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

- (IBAction)convertAction:(id)sender
{
    [[self view] endEditing:YES];
    
    float temp = [[[self tempField] text] floatValue];
    
    MyConverter *converter = [[MyConverter alloc] init];
    converter.temperatureScale = F;
    converter.temperature = temp;
    
    float result = [converter convert:C];
    
    [[self resultLabel] setText:[NSString stringWithFormat:@"%f", result]];
}

- (IBAction)textFieldDidReturn:(id)sender
{
    [self convertAction:nil];
}

@end
