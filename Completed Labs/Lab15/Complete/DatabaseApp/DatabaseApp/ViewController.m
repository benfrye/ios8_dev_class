//
//  ViewController.m
//  DatabaseApp
//
//  Copyright (c) 2014 Classroom. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSString *docPath = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0];
    
    [self setDatabasePath:[[NSString alloc] initWithString:[docPath stringByAppendingPathComponent:@"contacts.db"]]];
    
    NSFileManager *filemgr = [NSFileManager defaultManager];
    
    if (![filemgr fileExistsAtPath:[self databasePath]])
    {
        if (sqlite3_open([[self databasePath] UTF8String], &_contactDB) == SQLITE_OK)
        {
            char *errMsg;
            NSString *sql = @"CREATE TABLE IF NOT EXISTS Contacts "
                            @"(ID INTEGER PRIMARY KEY AUTOINCREMENT, "
                            @"Name TEXT, Address TEXT, Phone TEXT)";
            
            if (sqlite3_exec(_contactDB, [sql UTF8String], NULL, NULL, &errMsg) != SQLITE_OK)
            {
                self.statusLabel.text = @"Failed to create table";
            }
            sqlite3_close(_contactDB);
        }
        else
        {
            self.statusLabel.text = @"Failed to open/create database";
        }
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)saveAction:(id)sender
{
    sqlite3_stmt *statement;
    NSString *sql = [NSString stringWithFormat:@"INSERT INTO Contacts "
                     @"(Name, Address, Phone) VALUES "
                     @"(\"%@\", \"%@\", \"%@\")",
                     self.nameTextField.text, self.addressTextField.text,
                     self.phoneTextField.text];
    
    if (sqlite3_open([_databasePath UTF8String], &_contactDB) == SQLITE_OK)
    {
        sqlite3_prepare_v2(_contactDB, [sql UTF8String], -1, &statement, NULL);
        
        if (sqlite3_step(statement) == SQLITE_DONE)
        {
            self.statusLabel.text = @"Contact added";
            self.nameTextField.text = @"";
            self.addressTextField.text = @"";
            self.phoneTextField.text = @"";
        }
        else self.statusLabel.text = @"Failed to add contact";
        
        sqlite3_finalize(statement);
        sqlite3_close(_contactDB);
    }
}

- (IBAction)findAction:(id)sender
{
    sqlite3_stmt *statement;
    NSString *sql = [NSString stringWithFormat:@"SELECT Address, Phone "
                     @"FROM Contacts WHERE Name=\"%@\"",
                     self.nameTextField.text];
    
    if (sqlite3_open([_databasePath UTF8String], &_contactDB) == SQLITE_OK)
    {
        sqlite3_prepare_v2(_contactDB, [sql UTF8String], -1, &statement, NULL);
        
        if (sqlite3_step(statement) == SQLITE_ROW)
        {
            self.addressTextField.text = [[NSString alloc] initWithUTF8String:
                                          (const char*)sqlite3_column_text(statement, 0)];
            
            self.phoneTextField.text = [[NSString alloc] initWithUTF8String:
                                        (const char*)sqlite3_column_text(statement, 1)];
            
            self.statusLabel.text = @"Match found";
        }
        else
        {
            self.statusLabel.text = @"Match not found";
            self.addressTextField.text = @"";
            self.phoneTextField.text = @"";
        }
        sqlite3_finalize(statement);
        sqlite3_close(_contactDB);
    }
}

@end
