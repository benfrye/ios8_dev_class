//
//  ViewController.m
//  StoryboardApp
//
//  Created by Ben Frye on 4/14/15.
//  Copyright (c) 2015 Classroom. All rights reserved.
//

#import "ViewController.h"
#import "SecondViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UITextField *textField;

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
- (IBAction)buttonPressed:(id)sender {
     NSString *text = [[self textField] text];
    
    if ([text isEqual:@"one"])
        [self performSegueWithIdentifier:@"segueOne" sender:self];
    else if ([text isEqual:@"two"])
        [self performSegueWithIdentifier:@"segueTwo" sender:self];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqual:@"segueOne"])
    {
        SecondViewController *svc = (SecondViewController *)[segue destinationViewController];
        
        svc.textValue = self.textField.text;
    }
}

@end
