//
//  ViewController.m
//  FileApp
//
//  Created by Ben Frye on 4/14/15.
//  Copyright (c) 2015 Classroom. All rights reserved.
//

#import "ViewController.h"
#import "MyDocument.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UITextView *textView;

@end

@implementation ViewController
{
    NSFileManager *filemgr;
    NSString *dataFilePath;
    NSString *dataFileDir;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    filemgr = [NSFileManager defaultManager];
    NSArray *dirPaths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    
    if ([self.filename isEqual:@""] || [self.filename isEqual:@"New File"])
    {
        self.filename = @"datafile.dat";
    }
    else
    {
        self.filenameTextField.text = self.filename;
    }
    
    dataFileDir = dirPaths[0];
    dataFilePath = [dataFileDir stringByAppendingPathComponent:self.filename];
    NSURL *docURL = [NSURL fileURLWithPath:dataFilePath];
    
    _document = [[MyDocument alloc] initWithFileURL:docURL];
    
    if ([filemgr fileExistsAtPath:dataFilePath])
    {
        [[self document] openWithCompletionHandler:^(BOOL success)
         {
             if (success) {
                 NSLog(@"Opened");
                 self.textView.text = self.document.userText;
             }
             else NSLog(@"Not Opened");
         }];
//        [self deleteButton].enabled = YES;
    }
    else
    {
        [[self document] saveToURL:docURL forSaveOperation:UIDocumentSaveForCreating completionHandler:^(BOOL success)
         {
             if (success) NSLog(@"Created");
             else NSLog(@"Not Created");
         }];
        self.textView.text = @"";
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)deleteAction:(id)sender {
    [filemgr removeItemAtPath:dataFilePath error:nil];
    self.textView.text = @"";
    [self deleteButton].enabled = NO;
}

- (void)textViewDidChange:(UITextView *)textView
{
    [self saveAction:nil];
}

- (IBAction)saveAction:(id)sender {
    if (self.document.documentState == UIDocumentStateNormal) {
        self.document.userText = self.textView.text;
        dataFilePath = [dataFileDir stringByAppendingPathComponent:self.filenameTextField.text];
        [[self document] saveToURL:[NSURL fileURLWithPath:dataFilePath] forSaveOperation:UIDocumentSaveForCreating completionHandler:^(BOOL success)
         {
             if (success)
             {
                 NSLog(@"Saved");
                 NSLog(@"Saved to: %@", dataFilePath);
             }
             else NSLog(@"Not Saved");
         }];

    }
//    [self deleteButton].enabled = YES;
}
@end
