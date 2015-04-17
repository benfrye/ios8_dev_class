//
//  ViewController.m
//  DatabaseApp
//
//  Copyright (c) 2014 Classroom. All rights reserved.
//

#import "ViewController.h"
#import "AppDelegate.h"

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
    
    NSManagedObject *newContact = [NSEntityDescription
                                   insertNewObjectForEntityForName:@"Contact"
                                   inManagedObjectContext:context];
    
    [newContact setValue:[[self nameTextField] text] forKey:@"name"];
    [newContact setValue:[[self addressTextField] text] forKey:@"address"];
    [newContact setValue:[[self phoneTextField] text] forKey:@"phone"];
    
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
    
    NSEntityDescription *entityDesc = [NSEntityDescription
                                       entityForName:@"Contact"
                                       inManagedObjectContext:context];
    
    NSFetchRequest *request = [[NSFetchRequest alloc] init];
    request.entity = entityDesc;
    
    NSPredicate *pred = [NSPredicate predicateWithFormat:
                         @"(name = %@)", self.nameTextField.text];
    
    request.predicate = pred;
    
    NSError *error;
    NSArray *results = [context executeFetchRequest:request error:&error];
    
    if ([results count] == 0) self.statusLabel.text = @"No matches";
    else
    {
        NSManagedObject *obj = results[0];
        self.nameTextField.text = [obj valueForKey:@"name"];
        self.addressTextField.text = [obj valueForKey:@"address"];
        self.phoneTextField.text = [obj valueForKey:@"phone"];
        self.statusLabel.text = [NSString stringWithFormat:
                                 @"%lu matches found", (unsigned long)results.count];
    }
}

@end
