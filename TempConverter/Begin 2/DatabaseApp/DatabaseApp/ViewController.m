//
//  ViewController.m
//  DatabaseApp
//
//  Copyright (c) 2014 Classroom. All rights reserved.
//

#import "ViewController.h"
#import "AppDelegate.h"
#import "Contact.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)saveAction:(id)sender
{
    AppDelegate *appDelegate = [[UIApplication sharedApplication] delegate];
    NSManagedObjectContext *context = appDelegate.managedObjectContext;
    
    Contact *newContact = [NSEntityDescription insertNewObjectForEntityForName:@"Contact" inManagedObjectContext:context];

    newContact.name = self.nameTextField.text;
    newContact.address = self.addressTextField.text;
    newContact.phone = self.phoneTextField.text;
    
    self.nameTextField.text = @"";
    self.addressTextField.text = @"";
    self.phoneTextField.text = @"";
    
    NSError *error;
    [context save:&error];
    self.statusLabel.text = @"Contact saved";
}

- (IBAction)findAction:(id)sender
{
    AppDelegate *appDelegate = [[UIApplication sharedApplication] delegate];
    NSManagedObjectContext *context = appDelegate.managedObjectContext;
    
    NSEntityDescription *entityDesc = [NSEntityDescription entityForName:@"Contact" inManagedObjectContext:context];
    
    NSFetchRequest *request = [[NSFetchRequest alloc] init];
    request.entity = entityDesc;
    
    NSPredicate *pred = [NSPredicate predicateWithFormat:@"(name = %@)", self.nameTextField.text];
    
    request.predicate = pred;
    
    NSError *error;
    NSArray *results = [context executeFetchRequest:request error:&error];
    
    if ([results count] == 0) self.statusLabel.text = @"No Matches";
    else{
        Contact *obj = results[0];
        self.nameTextField.text = obj.name;
        self.addressTextField.text = obj.address;
        self.phoneTextField.text = obj.phone;
        self.statusLabel.text = [NSString stringWithFormat:@"%lu matches found", results.count];
    }
}

@end
