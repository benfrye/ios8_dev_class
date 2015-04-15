//
//  TableViewController.m
//  DatabaseApp
//
//  Created by Ben Frye on 4/15/15.
//  Copyright (c) 2015 Classroom. All rights reserved.
//

#import "TableViewController.h"
#import "ContactTableViewCell.h"

@interface TableViewController ()
@property NSMutableArray *contactList;

@end

@implementation TableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _contactList = [NSMutableArray arrayWithCapacity:5];
    
    sqlite3_stmt *statement;
    NSString *sql = @"SELECT Name, Address, Phone "
                    @"FROM Contacts";
    
    NSInteger rowNum = 0;
    
    if (sqlite3_open([_databasePath UTF8String], &_contactDB) == SQLITE_OK) {
        if (sqlite3_prepare_v2(_contactDB, [sql UTF8String], -1, &statement, NULL) == SQLITE_OK)
        {
            while (sqlite3_step(statement) == SQLITE_ROW)
            {
                _contactList[rowNum] = @[[[NSString alloc] initWithUTF8String:(const char*)sqlite3_column_text(statement, 0)],
                                         [[NSString alloc] initWithUTF8String:(const char*)sqlite3_column_text(statement, 1)],
                                         [[NSString alloc] initWithUTF8String:(const char*)sqlite3_column_text(statement, 2)]];
                rowNum++;
            }
            sqlite3_finalize(statement);
        }
        sqlite3_close(_contactDB);
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Return the number of rows in the section.
    return [_contactList count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
     ContactTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
    
    NSString *name = [[_contactList objectAtIndex:indexPath.row] objectAtIndex:0];
    NSString *address = [[_contactList objectAtIndex:indexPath.row] objectAtIndex:1];
    NSString *phone = [[_contactList objectAtIndex:indexPath.row] objectAtIndex:2];
    
    cell.nameLabel.text = name;
    cell.addressLabel.text = address;
    cell.phoneLabel.text = phone;
    
    // Configure the cell...
    
    return cell;
}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
