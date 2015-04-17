//
//  ViewController.m
//  ImageGrabber
//
//  Copyright (c) 2014 Classroom. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)getImageAction:(id)sender
{
    dispatch_queue_t q = dispatch_get_global_queue(
                                                   DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    
    dispatch_async(q, ^{
        __block UIImage *image = nil;
        
        dispatch_sync(q, ^{
            NSURL *url = [NSURL URLWithString:@"http://imgsrc.hubblesite.org/"
                          @"hu/db/images/hs-2012-49-a-full_jpg.jpg"];
            
            NSURLRequest *urlRequest = [NSURLRequest requestWithURL:url];
            NSError *downloadError = nil;
            
            NSData *imageData = [NSURLConnection
                                 sendSynchronousRequest:urlRequest
                                 returningResponse:nil
                                 error:&downloadError];
            
            if (downloadError == nil && imageData != nil)
            {
                image = [UIImage imageWithData:imageData];
            }
        });
        
        dispatch_sync(dispatch_get_main_queue(), ^{
            self.imageView.image = image;
        });
    });
}

@end
