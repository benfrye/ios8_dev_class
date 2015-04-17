//
//  ViewController.h
//  FileApp
//
//  Copyright (c) 2014 Classroom. All rights reserved.
//

#import <UIKit/UIKit.h>

@class MyDocument;

@interface ViewController : UIViewController

@property MyDocument *document;

@property (weak, nonatomic) IBOutlet UITextView *textView;

- (IBAction)saveAction:(id)sender;

@end

