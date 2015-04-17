//
//  ViewController.m
//  NSNotificationLab
//
//  Created by Ben Frye on 4/16/15.
//  Copyright (c) 2015 Classroom. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UITextField *messageTextField;

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
- (IBAction)sendMessage:(id)sender {
    NSDictionary *dict = [NSDictionary dictionaryWithObjectsAndKeys:self.messageTextField.text, @"text", [NSDate date], @"datetime", nil];
    [[NSNotificationCenter defaultCenter] postNotificationName:@"TextAlert" object:self userInfo:dict];
    
    [self.navigationController popViewControllerAnimated:YES];
}

@end
