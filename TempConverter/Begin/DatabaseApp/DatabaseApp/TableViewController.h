//
//  TableViewController.h
//  DatabaseApp
//
//  Created by Ben Frye on 4/15/15.
//  Copyright (c) 2015 Classroom. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <sqlite3.h>

@interface TableViewController : UITableViewController

@property (nonatomic) sqlite3 *contactDB;
@property (copy, nonatomic) NSString *databasePath;

@end
