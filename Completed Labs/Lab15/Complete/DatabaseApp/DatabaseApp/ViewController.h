//
//  ViewController.h
//  DatabaseApp
//
//  Copyright (c) 2014 Classroom. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <sqlite3.h>

@interface ViewController : UIViewController

@property (nonatomic) sqlite3 *contactDB;
@property (copy, nonatomic) NSString *databasePath;

@property (weak, nonatomic) IBOutlet UITextField *nameTextField;
@property (weak, nonatomic) IBOutlet UITextField *addressTextField;
@property (weak, nonatomic) IBOutlet UITextField *phoneTextField;
@property (weak, nonatomic) IBOutlet UILabel *statusLabel;

- (IBAction)saveAction:(id)sender;
- (IBAction)findAction:(id)sender;

@end

