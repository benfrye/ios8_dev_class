//
//  TempConverterTests.m
//  TempConverterTests
//
//  Created by Ben Frye on 4/13/15.
//  Copyright (c) 2015 Classroom. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <XCTest/XCTest.h>
#import "MyConverter.h"

@interface TempConverterTests : XCTestCase

@end

@implementation TempConverterTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testCelciusToFarenheit
{
    float c = 100;
    float f;
    
    MyConverter *converter = [[MyConverter alloc] init];
    converter.temperatureScale = C;
    converter.temperature = c;
    f = [converter convert:F];
    
    XCTAssert(f == 212.0, @"Pass");
}

- (void)testFarenheitToCelcius
{
    float c;
    float f = 212.0;
    
    MyConverter *converter = [[MyConverter alloc] init];
    converter.temperatureScale = F;
    converter.temperature = f;
    c = [converter convert:C];
    
    XCTAssert(c == 100.0, @"Pass");
}

- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
}

@end
