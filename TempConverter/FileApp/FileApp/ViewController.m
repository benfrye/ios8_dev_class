//
//  ViewController.m
//  FileApp
//
//  Created by Ben Frye on 4/14/15.
//  Copyright (c) 2015 Classroom. All rights reserved.
//

#import "ViewController.h"

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
    
    dataFileDir = dirPaths[0];
    
    if ([self.filename isEqual:@""] || [self.filename isEqual:@"New File"])
    {
        self.filename = @"datafile.dat";
    }
    else
    {
        self.filenameTextField.text = self.filename;
    }
    dataFilePath = [dataFileDir stringByAppendingPathComponent:self.filename];
    
    if ([filemgr fileExistsAtPath:dataFilePath])
    {
        NSData *buffer = [filemgr contentsAtPath:dataFilePath];
        NSString *dataString = [[NSString alloc] initWithData:buffer encoding:NSUTF8StringEncoding];
        
        self.textView.text = dataString;
        [self deleteButton].enabled = YES;
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

- (IBAction)deleteAction:(id)sender {
    [filemgr removeItemAtPath:dataFilePath error:nil];
    self.textView.text = @"";
    [self deleteButton].enabled = NO;
}

- (IBAction)saveAction:(id)sender {
    NSData *buffer = [[[self textView] text] dataUsingEncoding:NSUTF8StringEncoding];
    
    if (![self.filenameTextField.text isEqual: @""]) {
        dataFilePath = [dataFileDir stringByAppendingPathComponent:[NSString stringWithFormat:@"%@.dat", self.filenameTextField.text]];
    }
    
    [filemgr createFileAtPath:dataFilePath contents:buffer attributes:nil];
    self.statusTextView.text = [NSString stringWithFormat:@"Saved to: %@", dataFilePath];
    [self deleteButton].enabled = YES;
}
@end
