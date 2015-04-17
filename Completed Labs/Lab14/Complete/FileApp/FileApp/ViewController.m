//
//  ViewController.m
//  FileApp
//
//  Copyright (c) 2014 Classroom. All rights reserved.
//

#import "ViewController.h"
#import "MyDocument.h"

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
    dataFilePath = [docsDir stringByAppendingPathComponent:@"doc.data"];
    NSURL *docURL = [NSURL fileURLWithPath:dataFilePath];
    
    _document = [[MyDocument alloc] initWithFileURL:docURL];
    
    if ([filemgr fileExistsAtPath:dataFilePath])
    {
        [[self document] openWithCompletionHandler:^(BOOL success)
         {
             if (success)
             {
                 NSLog(@"Opened");
                 self.textView.text = self.document.userText;
             }
             else NSLog(@"Not opened");
         }];
    }
    else
    {
        [[self document] saveToURL:docURL
                  forSaveOperation:UIDocumentSaveForCreating
                 completionHandler:^(BOOL success)
         {
             if (success) NSLog(@"Created");
             else NSLog(@"Not created");
         }];
        self.textView.text = @"";
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)saveAction:(id)sender
{
    self.document.userText = self.textView.text;
    
    [[self document] saveToURL:[NSURL fileURLWithPath:dataFilePath]
              forSaveOperation:UIDocumentSaveForOverwriting
             completionHandler:^(BOOL success)
     {
         if (success) NSLog(@"Saved");
         else NSLog(@"Not saved");
     }];
}

@end
