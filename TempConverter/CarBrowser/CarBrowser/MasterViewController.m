//
//  MasterViewController.m
//  CarBrowser
//
//  Created by Ben Frye on 4/14/15.
//  Copyright (c) 2015 Classroom. All rights reserved.
//

#import "MasterViewController.h"
#import "DetailViewController.h"
#import "Car.h"
#import "CarTableViewCell.h"

@interface MasterViewController ()

@property NSArray *carSectionTitles;
@property NSDictionary *cars;
@end

@implementation MasterViewController

- (void)awakeFromNib {
    [super awakeFromNib];
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPad) {
        self.clearsSelectionOnViewWillAppear = NO;
        self.preferredContentSize = CGSizeMake(320.0, 600.0);
    }
    
    self.cars = @{@"First Set": @[[Car carWithMake:@"Chevy" model:@"Volt" image: [UIImage imageNamed:@"ChevyVolt"]],
                                  [Car carWithMake:@"BMW" model:@"Mini" image: [UIImage imageNamed:@"MiniClubman"]],
                                  [Car carWithMake:@"Toyota" model:@"Venza" image: [UIImage imageNamed:@"ToyotaVenza"]]],
                  @"Second Set": @[[Car carWithMake:@"Volvo" model:@"S60" image: [UIImage imageNamed:@"VolvoS60"]],
                                   [Car carWithMake:@"Smart" model:@"Fortwo" image: [UIImage imageNamed:@"SmartFortwo"]]]};
    self.carSectionTitles = [[self.cars allKeys] sortedArrayUsingSelector:@selector(localizedCaseInsensitiveCompare:)];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.navigationItem.leftBarButtonItem = self.editButtonItem;
    self.detailViewController = (DetailViewController *)[[self.splitViewController.viewControllers lastObject] topViewController];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Segues

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([[segue identifier] isEqualToString:@"showDetail"]) {
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        NSString *sectionTitle = [self.carSectionTitles objectAtIndex:indexPath.section];
        NSArray *sectionCars = [self.cars objectForKey:sectionTitle];
        NSDate *object = [sectionCars objectAtIndex:indexPath.row];
        DetailViewController *controller = (DetailViewController *)[[segue destinationViewController] topViewController];
        [controller setDetailItem:object];
        controller.navigationItem.leftBarButtonItem = self.splitViewController.displayModeButtonItem;
        controller.navigationItem.leftItemsSupplementBackButton = YES;
    }
}

#pragma mark - Table View

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return self.carSectionTitles.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    NSString *sectionTitle = [self.carSectionTitles objectAtIndex:section];
    NSArray *sectionAnimals = [self.cars objectForKey:sectionTitle];
    return [sectionAnimals count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    CarTableViewCell *cell = [tableView
                              dequeueReusableCellWithIdentifier:@"Cell"
                              forIndexPath:indexPath];
    
    // Configure the cell...
    NSString *sectionTitle = [self.carSectionTitles objectAtIndex:indexPath.section];
    NSArray *sectionCars = [self.cars objectForKey:sectionTitle];
    Car *car = [sectionCars objectAtIndex:indexPath.row];
    cell.makeLabel.text = car.make;
    cell.modelLabel.text = car.model;
    cell.carImageView.image = car.image;
    
    return cell;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    return [self.carSectionTitles objectAtIndex:section];
}

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        NSString *sectionTitle = [self.carSectionTitles objectAtIndex:indexPath.section];
        [[self.cars objectForKey:sectionTitle] removeObjectAtIndex:indexPath.row];
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view.
    }
}

@end
