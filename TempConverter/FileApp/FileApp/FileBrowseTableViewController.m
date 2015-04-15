//
//  FileBrowseTableViewController.m
//  FileApp
//
//  Created by Ben Frye on 4/14/15.
//  Copyright (c) 2015 Classroom. All rights reserved.
//

#import "FileBrowseTableViewController.h"
#import "ViewController.h"

@interface FileBrowseTableViewController ()
    @property NSMutableArray *fileList;

@end

@implementation FileBrowseTableViewController
{
    NSFileManager *filemgr;
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated ];
    
    self.fileList = [[NSMutableArray alloc] init];
    [self.fileList addObject:@"New File"];
    
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    [self.fileList addObjectsFromArray:[filemgr contentsOfDirectoryAtPath:paths[0] error:nil]];
    
    [self.tableView reloadData];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    filemgr = [NSFileManager defaultManager];
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
    return [self.fileList count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
    cell.textLabel.text = self.fileList[indexPath.row];
    return cell;
}

#pragma mark - Navigation

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqual:@"loadFileSegue"])
    {
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        ViewController *vc = (ViewController *)[segue destinationViewController];
        NSString *trimmedFilename = self.fileList[indexPath.row];
        [trimmedFilename stringByReplacingOccurrencesOfString:@".dat" withString:@""];
        vc.filename = trimmedFilename;
    }
}


@end
