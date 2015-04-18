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
    NSError *error;
    if ([connection.originalRequest.URL.absoluteString isEqualToString:_apiURL]) {
        id jsonObject = [NSJSONSerialization JSONObjectWithData:[_responses objectForKey:_apiURL] options:NSJSONReadingAllowFragments error:&error];
        if ([jsonObject isKindOfClass:[NSArray class]]) {
            for (int ii = 0; ii < [jsonObject count]; ii++) {
                ProductCategory *newCategory = [[ProductCategory alloc] init];
                newCategory.categoryID = [NSString stringWithFormat:@"%@", [[jsonObject objectAtIndex:ii] objectForKey:@"CategoryID"]];
                newCategory.categoryName = [NSString stringWithFormat:@"%@", [[jsonObject objectAtIndex:ii] objectForKey:@"CategoryName"]];
                newCategory.products = [[NSMutableArray alloc] initWithCapacity:5];
                [_categories addObject:newCategory];
            }
        }
        else
        {
            NSLog(@"Response not in expected format.");
        }
    }
    else
    {
        //NSLog(@"Received Response from %@", connection.originalRequest.URL.absoluteString);
        id jsonObject = [NSJSONSerialization JSONObjectWithData:[_responses objectForKey:connection.originalRequest.URL.absoluteString] options:NSJSONReadingAllowFragments error:&error];
        NSRange idRange = NSMakeRange([_apiURL length] + 1, //include slash
                                          [connection.originalRequest.URL.absoluteString length] - ([_apiURL length] + 1));
        NSString *categoryID = [connection.originalRequest.URL.absoluteString substringWithRange:idRange];
        if ([jsonObject isKindOfClass:[NSArray class]]) {
            for (int ii = 0; ii < [_categories count]; ii++) {
                if ([[[_categories objectAtIndex:ii] categoryID] isEqualToString:categoryID]) {
                    [[[_categories objectAtIndex:ii] products] removeAllObjects];
                    [[[_categories objectAtIndex:ii] products] addObjectsFromArray:jsonObject];
                    break;
                }
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
    return [_categories count];
}

-(void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *categoryID = [[_categories objectAtIndex:indexPath.section] categoryID];
    
    NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:@"%@/%@", _apiURL, categoryID]];
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url cachePolicy:NSURLRequestReloadIgnoringCacheData timeoutInterval:5];
    
    _connection = [NSURLConnection connectionWithRequest:request delegate:self];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Return the number of rows in the section.
    NSIndexPath *selectedIP = [self.tableView indexPathForSelectedRow];
    if (selectedIP != nil && section == [selectedIP section]) {
        return [[[_categories objectAtIndex:section] products] count];
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
    NSDictionary *product = [[[_categories objectAtIndex:indexPath.section] products] objectAtIndex:indexPath.row - 1];
    
    NSString *temp = [product objectForKey:@"ProductName"];
    
    if ([temp length] > 13) {
        NSRange range = [[product objectForKey:@"ProductName"] rangeOfComposedCharacterSequencesForRange:(NSRange){0, 13}];
        temp = [[product objectForKey:@"ProductName"] substringWithRange:range];
        temp = [temp stringByAppendingString:@"…"];
    }
    cell.productNameLabel.text = temp;
    cell.unitPriceLabel.text = [NSString stringWithFormat:@"$%.2f", [[product objectForKey:@"UnitPrice"] floatValue]];
    cell.unitsInStockLabel.text = [NSString stringWithFormat:@"%ld in stock", (long)[[product objectForKey:@"UnitsInStock"] integerValue]];
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
