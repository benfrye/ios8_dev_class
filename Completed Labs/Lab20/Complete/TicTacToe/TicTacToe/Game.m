//
//  Game.m
//  TicTacToe
//
//  Copyright (c) 2013 Acme. All rights reserved.
//

#import "Game.h"

@implementation Game
{
    NSMutableArray *_board;
}

- (id)init
{
    if (self = [super init])
    {
        _board = [NSMutableArray arrayWithCapacity:9];
        [self reset];
    }
    return self;
}

- (NSArray *)winner
{
    if ([self matchForC1:0 c2:1 c3:2] != Empty) return @[@0, @1, @2];
    if ([self matchForC1:0 c2:3 c3:6] != Empty) return @[@0, @2, @6];
    if ([self matchForC1:0 c2:4 c3:8] != Empty) return @[@0, @4, @8];
    if ([self matchForC1:1 c2:4 c3:7] != Empty) return @[@1, @4, @7];
    if ([self matchForC1:2 c2:5 c3:8] != Empty) return @[@2, @5, @8];
    if ([self matchForC1:2 c2:4 c3:6] != Empty) return @[@2, @4, @6];
    if ([self matchForC1:3 c2:4 c3:5] != Empty) return @[@3, @4, @5];
    if ([self matchForC1:6 c2:7 c3:8] != Empty) return @[@6, @7, @8];
    return nil;
}

- (void)reset
{
    [_board removeAllObjects];
    for (int i = 0; i < 9; ++i)
    {
        [_board addObject:[NSNumber numberWithInt:Empty]];
    }
    _currentTurn = X;
}

- (BOOL)makeMove:(int)cell
{
    if (!self.winner && ([_board[cell] integerValue] == Empty))
    {
        _board[cell] = [NSNumber numberWithInt:_currentTurn];
        _currentTurn = (_currentTurn == X ? O : X);
        return YES;
    }
    return NO;
}

- (void)makeCPUMove
{
    int i = rand() % 8;
    for (int cell = i; cell < 8; ++cell)
    {
        if ([_board[cell] integerValue] == Empty)
        {
            [self makeMove:cell];
            return;
        }
        if (cell == 8) cell = 0;
    }
}

- (GamePiece)matchForC1:(int)c1 c2:(int)c2 c3:(int)c3
{
    GamePiece p1 = (int)[_board[c1] integerValue];
    GamePiece p2 = (int)[_board[c2] integerValue];
    GamePiece p3 = (int)[_board[c3] integerValue];
    if ((p1 == p2) && (p2 == p3))
    {
        if (p1 > 0) return p1;
    }
    return Empty;
}
    
@end
