//
//  BoardView.m
//  TicTacToe
//
//  Copyright (c) 2013 Acme. All rights reserved.
//

#import "BoardView.h"
#import "Game.h"

@implementation BoardView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)drawRect:(CGRect)rect
{
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetLineWidth(context, 10.0);
    CGContextSetStrokeColorWithColor(context, [[UIColor blueColor] CGColor]);
    
    float cellSize = _boardRect.size.width / 3;
    
    // draw the board
    for (int i = 1; i < 3; ++i)
    {
        CGContextMoveToPoint(context, _boardRect.origin.x + (i * cellSize), _boardRect.origin.y);
        CGContextAddLineToPoint(context, _boardRect.origin.x + (i * cellSize), _boardRect.origin.y + _boardRect.size.height);
        CGContextMoveToPoint(context, _boardRect.origin.x, _boardRect.origin.y + (i * cellSize));
        CGContextAddLineToPoint(context, _boardRect.origin.x + _boardRect.size.width, _boardRect.origin.y + (i * cellSize));
    }
    // draw the cells
    for (int i = 0; i < 9; ++i)
    {
        GamePiece p = (int)[_game.board[i] integerValue];
        CGRect cellRect = CGRectMake(_boardRect.origin.x + ((i % 3) * cellSize) + 20.0,
                                     _boardRect.origin.y + ((i / 3) * cellSize) + 20.0,
                                     cellSize - 40.0, cellSize - 40.0);
        switch (p)
        {
            case Empty:
                // do nothing
                break;
            case X:
                CGContextMoveToPoint(context, cellRect.origin.x, cellRect.origin.y);
                CGContextAddLineToPoint(context, cellRect.origin.x + cellRect.size.width,
                                        cellRect.origin.y + cellRect.size.height);
                CGContextMoveToPoint(context, cellRect.origin.x, cellRect.origin.y + cellRect.size.height);
                CGContextAddLineToPoint(context, cellRect.origin.x + cellRect.size.width,cellRect.origin.y);
                break;
            case O:
                CGContextAddEllipseInRect(context, cellRect);
                break;
        }
    }
    CGContextStrokePath(context);
    
    // draw winner line
    NSArray *winner = _game.winner;
    if (winner)
    {
        int startCell = (int)[winner[0] integerValue];
        int endCell = (int)[winner[2] integerValue];
        CGPoint startPoint = [self centerForCell:startCell];
        CGPoint endPoint = [self centerForCell:endCell];
        
        CGContextSetStrokeColorWithColor(context, [[UIColor redColor] CGColor]);
        CGContextMoveToPoint(context, startPoint.x, startPoint.y);
        CGContextAddLineToPoint(context, endPoint.x, endPoint.y);
        CGContextStrokePath(context);
    }
}

- (int)cellForPoint:(CGPoint)point
{
    float cellSize = _boardRect.size.width / 3;
    for (int i = 0; i < 9; ++i)
    {
        CGRect cellRect = CGRectMake(_boardRect.origin.x + ((i % 3) * cellSize) + 20.0,
                                     _boardRect.origin.y + ((i / 3) * cellSize) + 20.0,
                                     cellSize - 40.0, cellSize - 40.0);
        
        if (CGRectContainsPoint(cellRect, point)) return i;
    }
    return -1;
}

- (CGPoint)centerForCell:(int)cell
{
    float cellSize = _boardRect.size.width / 3;
    return CGPointMake(_boardRect.origin.x + ((cell % 3) * cellSize) + (cellSize / 2),
                       _boardRect.origin.y + ((cell / 3) * cellSize) + (cellSize / 2));
}

@end
