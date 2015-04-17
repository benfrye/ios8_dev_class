//
//  ViewController.h
//  TicTacToe
//
//  Copyright (c) 2013 Acme. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AudioToolbox/AudioToolbox.h>
#import <AVFoundation/AVFoundation.h>

@class BoardView;

@interface ViewController : UIViewController <AVAudioPlayerDelegate>

@property (weak, nonatomic) IBOutlet UITextField *numPlayersField;

- (IBAction)tapAction:(id)sender;
- (IBAction)newGameAction:(id)sender;


@end
