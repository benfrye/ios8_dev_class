//
//  TempConverterTests.m
//  TempConverterTests
//
//  Copyright (c) 2014 Classroom. All rights reserved.
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

- (void)testCelsiusToFahrenheit
{
    float c = 100.0;
    float f;
    
    MyConverter *converter = [[MyConverter alloc] init];
    f = [converter convertToFahrenheit:c];
    
    XCTAssert(f == 212.0, @"Pass");
}

- (void)testFahrenheitToCelsius
{
    float f = 212.0;
    float c;
    
    MyConverter *converter = [[MyConverter alloc] init];
    c = [converter convertToCelsius:f];
    
    XCTAssert(c == 100.0, @"Pass");
}

- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
}

@end
