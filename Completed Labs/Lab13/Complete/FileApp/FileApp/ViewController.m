//
//  ViewController.m
//  FileApp
//
//  Copyright (c) 2014 Classroom. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController
{
    NSFileManager *filemgr;
    NSString *dataFilePath;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    filemgr = [NSFileManager defaultManager];
    NSArray *dirPaths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    
    NSString *docsDir = dirPaths[0];
    dataFilePath = [docsDir stringByAppendingPathComponent:@"datafile.dat"];
    
    if ([filemgr fileExistsAtPath:dataFilePath])
    {
        NSData *buffer = [filemgr contentsAtPath:dataFilePath];
        NSString *dataString = [[NSString alloc]
                                initWithData:buffer
                                encoding:NSUTF8StringEncoding];
        
        self.textView.text = dataString;
    }
    else
    {
        self.textView.text = @"";
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)saveAction:(id)sender
{
    NSData *buffer = [[[self textView] text]
                      dataUsingEncoding:NSUTF8StringEncoding];
    
    [filemgr createFileAtPath:dataFilePath
                     contents:buffer attributes:nil];
}

@end
