//
//  ViewController.m
//  Tic-Tac-Toe
//
//  Created by Ben Frye on 4/16/15.
//  Copyright (c) 2015 Classroom. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()


@property (weak, nonatomic) IBOutlet UIButton *topLeft;
@property (weak, nonatomic) IBOutlet UIButton *topMid;
@property (weak, nonatomic) IBOutlet UIButton *topRight;
@property (weak, nonatomic) IBOutlet UIButton *midLeft;
@property (weak, nonatomic) IBOutlet UIButton *midMid;
@property (weak, nonatomic) IBOutlet UIButton *midRight;
@property (weak, nonatomic) IBOutlet UIButton *bottomLeft;
@property (weak, nonatomic) IBOutlet UIButton *bottomMid;
@property (weak, nonatomic) IBOutlet UIButton *bottomRight;

@end



@implementation ViewController
{
    NSArray *playerVals;
    NSUInteger currentPlayer;
    NSArray *grid;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    grid = @[@[self.topLeft, self.topMid, self.topRight],
             @[self.midLeft, self.midMid, self.midRight],
             @[self.bottomLeft, self.bottomMid, self.bottomRight]];
    
    playerVals = @[@"X", @"O"];
    currentPlayer = 0;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSString*)checkWinner
{
    NSString *winner = nil;
    
    return winner;
}

- (IBAction)btnPressed:(UIButton *) sender {
    [sender setTitle:[playerVals objectAtIndex:currentPlayer] forState:UIControlStateNormal];
    sender.enabled = NO;
    currentPlayer = (currentPlayer + 1)%[playerVals count];
    
    NSString *winner = [self checkWinner];
}

@end
