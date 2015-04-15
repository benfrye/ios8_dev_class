//
//  Contact.h
//  DatabaseApp
//
//  Created by Ben Frye on 4/15/15.
//  Copyright (c) 2015 Classroom. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface Contact : NSManagedObject

@property (nonatomic, retain) NSString * name;
@property (nonatomic, retain) NSString * address;
@property (nonatomic, retain) NSString * phone;

@end
