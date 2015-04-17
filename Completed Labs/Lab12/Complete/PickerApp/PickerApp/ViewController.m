//
//  ViewController.m
//  PickerApp
//
//  Copyright (c) 2014 Classroom. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setExchangeRates:@[
                             @[@"Australia (AUD)", @0.9922],
                             @[@"China (CNY)", @6.5938],
                             @[@"France (EUR)", @0.7270],
                             @[@"Great Britain (GBP)", @0.6206],
                             @[@"Japan (JPY)", @81.57]]];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)textFieldReturn:(id)sender
{
    [sender resignFirstResponder];
}

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 1;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    return self.exchangeRates.count;
}

- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    NSArray *rate = self.exchangeRates[row];
    return rate[0];
}

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
    NSArray *selectedRate = self.exchangeRates[row];
    float rate = [selectedRate[1] floatValue];
    float dollars = self.usdTextField.text.floatValue;
    float result = dollars * rate;
    
    NSString *resultString = [[NSString alloc] initWithFormat:
                              @"%.2f USD = %.2f %@", dollars,
                              result, selectedRate[0]];
    
    self.resultLabel.text = resultString;
}

@end
