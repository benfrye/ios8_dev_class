//
//  CarTableViewCell.h
//  CarBrowser
//
//  Created by Ben Frye on 4/14/15.
//  Copyright (c) 2015 Classroom. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CarTableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UIImageView *carImageView;
@property (weak, nonatomic) IBOutlet UILabel *makeLabel;
@property (weak, nonatomic) IBOutlet UILabel *modelLabel;

@end
