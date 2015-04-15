//
//  ViewController.h
//  FileApp
//
//  Created by Ben Frye on 4/14/15.
//  Copyright (c) 2015 Classroom. All rights reserved.
//

#import <UIKit/UIKit.h>

@class MyDocument;

@interface ViewController : UIViewController <UITextViewDelegate>

@property (strong, nonatomic) NSString *filename;
@property (weak, nonatomic) IBOutlet UIButton *deleteButton;
@property (weak, nonatomic) IBOutlet UITextField *filenameTextField;
@property (weak, nonatomic) IBOutlet UITextView *statusTextView;

@property MyDocument *document;

@end

