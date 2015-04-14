//
//  ViewController.m
//  PickerApp
//
//  Created by Ben Frye on 4/14/15.
//  Copyright (c) 2015 Classroom. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UITextField *usdTextField;
@property (weak, nonatomic) IBOutlet UILabel *resultLabel;
@property (weak, nonatomic) IBOutlet UIPickerView *currencyPickerView;
@property (weak, nonatomic) IBOutlet UIPickerView *valuePickerView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self setExchangeRates:@[
                             @[@"United States (USD)", @1.0],
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
- (IBAction)textFieldReturn:(id)sender {
    [sender resignFirstResponder];
}

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 2;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    return self.exchangeRates.count;
}

- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    if ([pickerView isEqual: [self currencyPickerView]]) {
        NSArray *rate = self.exchangeRates[row];
        return rate[0];
    }
    else
        return [NSString stringWithFormat:@"%ld", (long)row];
}

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
    NSInteger firstComponentRow = [self.currencyPickerView selectedRowInComponent:0];
    NSInteger secondComponentRow = [self.currencyPickerView selectedRowInComponent:1];
    
    NSArray *selectedFromRate = self.exchangeRates[firstComponentRow];
    NSArray *selectedToRate = self.exchangeRates[secondComponentRow];
    
    float inputRate = [selectedFromRate[1] floatValue];
    float outputRate = [selectedToRate[1] floatValue];
    float inputAmount = self.usdTextField.text.floatValue;
    float result = inputAmount * outputRate/inputRate;
    
    NSString *resultString = [[NSString alloc] initWithFormat:@"%.2f %@ = %.2f %@", inputAmount, selectedFromRate[0], result, selectedToRate[0]];
    
    self.resultLabel.text = resultString;
}


@end
