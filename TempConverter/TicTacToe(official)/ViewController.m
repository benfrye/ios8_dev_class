//
//  ViewController.m
//  TicTacToe
//
//  Copyright (c) 2013 Acme. All rights reserved.
//

#import "ViewController.h"
#import "Game.h"
#import "BoardView.h"

@implementation ViewController
{
    Game *_game;
    BoardView *_boardView;
    int _numPlayers;
    AVAudioPlayer *_avPlayer;
    NSTimer *_timer;
    int _numJoshuaGames;
    int _joshuaMoveIndex;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    _game = [[Game alloc] init];
    _boardView = (BoardView *)self.view;
    _boardView.game = _game;
    
    [self configureBoard];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)didRotateFromInterfaceOrientation:(UIInterfaceOrientation)fromInterfaceOrientation
{
    [self configureBoard];
}

- (void)configureBoard
{
    CGRect frame = _boardView.frame;
    float boardDim = MIN(frame.size.height, frame.size.width) - 20.0;
    
    _boardView.boardRect = CGRectMake(frame.size.width / 2 - boardDim / 2,
                                      frame.size.height / 2 - boardDim / 2 + 20,
                                      boardDim, boardDim);
}

- (IBAction)tapAction:(id)sender
{
    CGPoint point = [(UITapGestureRecognizer *)sender locationInView:_boardView];
    int cell = [_boardView cellForPoint:point];
    if (cell > -1)
    {
        if ([_game makeMove:cell]) [_boardView setNeedsDisplay];
        if (self.numPlayersField.text.integerValue == 1)
        {
            [_game makeCPUMove];
            [_boardView setNeedsDisplay];
        }
    }
}

- (IBAction)newGameAction:(id)sender
{
    [[self view] endEditing:YES];
    [_game reset];
    [_boardView setNeedsDisplay];
    if (self.numPlayersField.text.integerValue == 0)
    {
        [self joshua];
    }
}

#pragma mark - Joshua Code

- (void)joshua
{
    _numJoshuaGames = 0;
    _joshuaMoveIndex = 0;
    _timer = [NSTimer scheduledTimerWithTimeInterval:0.05
                                              target:self
                                            selector:@selector(joshuaPlay)
                                            userInfo:nil
                                             repeats:YES];
}

- (void)joshuaPlay
{
    if (_numJoshuaGames % 2 == 0)
    {
        if (_joshuaMoveIndex == 0) [_game makeMove:4];
        if (_joshuaMoveIndex == 1) [_game makeMove:0];
        if (_joshuaMoveIndex == 2) [_game makeMove:2];
        if (_joshuaMoveIndex == 3) [_game makeMove:6];
        if (_joshuaMoveIndex == 4) [_game makeMove:3];
        if (_joshuaMoveIndex == 5) [_game makeMove:5];
        if (_joshuaMoveIndex == 6) [_game makeMove:1];
        if (_joshuaMoveIndex == 7) [_game makeMove:7];
        if (_joshuaMoveIndex == 8) [_game makeMove:8];
    }
    else
    {
        if (_joshuaMoveIndex == 0) [_game makeMove:4];
        if (_joshuaMoveIndex == 1) [_game makeMove:6];
        if (_joshuaMoveIndex == 2) [_game makeMove:0];
        if (_joshuaMoveIndex == 3) [_game makeMove:8];
        if (_joshuaMoveIndex == 4) [_game makeMove:7];
        if (_joshuaMoveIndex == 5) [_game makeMove:1];
        if (_joshuaMoveIndex == 6) [_game makeMove:5];
        if (_joshuaMoveIndex == 7) [_game makeMove:3];
        if (_joshuaMoveIndex == 8) [_game makeMove:2];
    }
    [_boardView setNeedsDisplay];
    
    _joshuaMoveIndex++;
    if (_joshuaMoveIndex > 8)
    {
        _joshuaMoveIndex = 0;
        _numJoshuaGames++;
        if (_numJoshuaGames < 10) [_game reset];
    }
    if (_numJoshuaGames == 10)
    {
        [_timer invalidate];
        NSString *path = [[NSBundle mainBundle] pathForResource:@"not2play" ofType:@"wav"];
        _avPlayer = [[AVAudioPlayer alloc] initWithContentsOfURL:[NSURL fileURLWithPath:path] error:NULL];
        _avPlayer.delegate = self;
        [_avPlayer play];
    }
}

@end
