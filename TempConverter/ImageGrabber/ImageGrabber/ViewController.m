//
//  ViewController.m
//  ImageGrabber
//
//  Created by Ben Frye on 4/17/15.
//  Copyright (c) 2015 Classroom. All rights reserved.
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

- (IBAction)getImageAction:(id)sender {
    //Bonus:
    //refactor with NSBlockOperation
    //store the image data (NSData) to a file on a background thread
    
    //With NSOperation
    __block UIImage *image = nil;
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *filePath = [[paths objectAtIndex:0] stringByAppendingPathComponent:@"Image.jpg"];
    
    NSBlockOperation* getImage = [NSBlockOperation blockOperationWithBlock:^{
        NSData *imageData = [NSData dataWithContentsOfFile:filePath];
        NSError *downloadError = nil;
        
        if (imageData == nil) {
            //download image here
            NSLog(@"Image not present.  Downloading...");
            NSURL *url = [NSURL URLWithString:@"http://imgsrc.hubblesite.org/"
                          @"hu/db/images/hs-2012-49-a-full_jpg.jpg"];
            
            NSURLRequest *urlRequest = [NSURLRequest requestWithURL:url];
            
            imageData = [NSURLConnection sendSynchronousRequest:urlRequest returningResponse:nil error:&downloadError];
        }
        else
        {
            NSLog(@"Loading image from file.");
        }

        if (downloadError == nil && imageData != nil) {
            image = [UIImage imageWithData:imageData];
        }
        
        dispatch_sync(dispatch_get_main_queue(), ^{
           //update UI here
            self.imageView.image = image;
        });
    }];
    
    NSBlockOperation* saveImage = [NSBlockOperation blockOperationWithBlock:^{
        if (image != nil) {
            [UIImageJPEGRepresentation(image, .0) writeToFile:filePath atomically:YES];
            //[UIImagePNGRepresentation(image) writeToFile:filePath atomically:YES];
            NSLog(@"Saved Image to %@", filePath);
        }
        else
        {
            NSLog(@"Image Not Present");
        }
    }];
    
    [saveImage addDependency:getImage];
    
    NSOperationQueue* queue = [[NSOperationQueue alloc] init];
    [queue addOperation:getImage];
    [queue addOperation:saveImage];

    //With Dispatch Queue
//    dispatch_queue_t q = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
//    
//    dispatch_async(q, ^{
//        __block UIImage *image = nil;
//        
//        dispatch_sync(q, ^{
//           //download image here
//            NSURL *url = [NSURL URLWithString:@"http://imgsrc.hubblesite.org/"
//                          @"hu/db/images/hs-2012-49-a-full_jpg.jpg"];
//            
//            NSURLRequest *urlRequest = [NSURLRequest requestWithURL:url];
//            NSError *downloadError = nil;
//            
//            NSData *imageData = [NSURLConnection sendSynchronousRequest:urlRequest returningResponse:nil error:&downloadError];
//            
//            if (downloadError == nil && imageData != nil) {
//                image = [UIImage imageWithData:imageData];
//            }
//        });
//        
//        dispatch_sync(dispatch_get_main_queue(), ^{
//           //update UI here
//            self.imageView.image = image;
//        });
//    });
//    
    
    // No Queuing
//    NSURL *url = [NSURL URLWithString:@"http://imgsrc.hubblesite.org/"
//                  @"hu/db/images/hs-2012-49-a-full_jpg.jpg"];
//    
//    NSURLRequest *urlRequest = [NSURLRequest requestWithURL:url];
//    NSError *downloadError = nil;
//    UIImage *image = nil;
//    
//    NSData *imageData = [NSURLConnection sendSynchronousRequest:urlRequest returningResponse:nil error:&downloadError];
//    
//    if (downloadError == nil && imageData != nil) {
//        image = [UIImage imageWithData:imageData];
//        self.imageView.image = image;
//    }
}
@end
