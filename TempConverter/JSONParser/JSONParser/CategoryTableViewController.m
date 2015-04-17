//
//  CategoryTableViewController.m
//  JSONParser
//
//  Created by Ben Frye on 4/17/15.
//  Copyright (c) 2015 Classroom. All rights reserved.
//

#import "CategoryTableViewController.h"
#import "DescriptionTableViewCell.h"
#import "ProductCategory.h"

@interface CategoryTableViewController ()

@end

@implementation CategoryTableViewController
{
    NSMutableArray *_categories;
    NSURLConnection *_connection;
    NSMutableDictionary *_responses;
    NSString *_apiURL;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _categories = [[NSMutableArray alloc] initWithCapacity:5];
    _responses = [[NSMutableDictionary alloc] initWithCapacity:5];
    
    _apiURL = @"http://svc.treeloop.net/product";
    
    NSURL *url = [NSURL URLWithString:_apiURL];
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
    
    _connection = [NSURLConnection connectionWithRequest:request delegate:self];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

-(void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data
{
    NSMutableData *responseData = [_responses objectForKey:connection.originalRequest.URL.absoluteString];
    if (!responseData)
        responseData = [NSMutableData dataWithCapacity:32];
    
    [responseData appendData:data];
    [_responses setObject:responseData forKey:connection.originalRequest.URL.absoluteString];
}

-(void)connectionDidFinishLoading:(NSURLConnection *)connection
{
    if ([connection.originalRequest.URL.absoluteString isEqualToString:_apiURL]) {
        NSError *error;
        id jsonObject = [NSJSONSerialization JSONObjectWithData:[_responses objectForKey:_apiURL] options:NSJSONReadingAllowFragments error:&error];
        if ([jsonObject isKindOfClass:[NSArray class]]) {
            for (int ii = 0; ii < [jsonObject count]; ii++) {
                ProductCategory *newCategory = [[ProductCategory alloc] init];
                newCategory.categoryID = [NSString stringWithFormat:@"%@", [[jsonObject objectAtIndex:ii] objectForKey:@"CategoryID"]];
                newCategory.categoryName = [NSString stringWithFormat:@"%@", [[jsonObject objectAtIndex:ii] objectForKey:@"CategoryName"]];
                [_categories addObject:newCategory];
            }
        }
    }
    
    [self.tableView reloadData];
}

-(void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error
{
    if (error) {
        NSLog(@"Error getting data from server. %ld", (long)error.code);
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    // Return the number of sections.
    return [_categories count];
}

-(void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *categoryID = [[_categories objectAtIndex:indexPath.section] objectForKey:@"CategoryID"];
    
    NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:@"%@/%@", _apiURL, categoryID]];
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
    
    _connection = [NSURLConnection connectionWithRequest:request delegate:self];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Return the number of rows in the section.
    NSIndexPath *selectedIP = [self.tableView indexPathForSelectedRow];
    if (selectedIP != nil && section == [selectedIP section]) {
        NSLog(@"Section selected %ld", (long)section);
        return 2;
    }
    else
    {
        return 1;
    }
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.row == 0) {
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
        cell.textLabel.text = [[_categories objectAtIndex:indexPath.section] categoryName];
        return cell;
    }
    
    DescriptionTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"descriptionCell" forIndexPath:indexPath];
    //cell.productNameLabel.text =
    return cell;
}


/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
