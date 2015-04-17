//
//  ProductCategory.h
//  JSONParser
//
//  Created by Ben Frye on 4/17/15.
//  Copyright (c) 2015 Classroom. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ProductCategory : NSObject

@property NSString *categoryID;
@property NSString *categoryName;
@property NSMutableArray *products;

@end
