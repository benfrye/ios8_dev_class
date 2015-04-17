//
//  ViewController.m
//  NetworkingApp
//
//  Copyright (c) 2014 Classroom. All rights reserved.
//
// Bonus: Fetch another URL's contents and load the HTML in a UIWebView

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController
{
    NSURLConnection *_connection;
    NSMutableData *_data;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)getAction:(id)sender {
    [self.view endEditing:YES];
    
    NSURL *url = [NSURL URLWithString:self.urlTextField.text];
    
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
    
    _data = [NSMutableData data];
    _connection = [NSURLConnection connectionWithRequest:request delegate:self];
}

-(void)connection:(NSURLConnection *) connection didReceiveResponse:(NSURLResponse *)response
{
    if ([response respondsToSelector:@selector(statusCode)]) {
        NSInteger statusCode = [((NSHTTPURLResponse *) response) statusCode];
        self.statusLabel.text = [NSString stringWithFormat:@"%li", (long)statusCode];
    }
}

-(void)connection: (NSURLConnection *) connection didReceiveData:(NSData *)data
{
    [_data appendData:data];
}

-(void)connectionDidFinishLoading:(NSURLConnection *)connection
{
    NSString *responseString = [NSString stringWithFormat:@"%.*s", (int)[_data length], [_data bytes]];
    [self.webView loadHTMLString:responseString baseURL:[NSURL URLWithString:self.urlTextField.text]];
}

-(void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error
{
    if (error) {
        self.statusLabel.text = @"Error";
    }
}

@end
