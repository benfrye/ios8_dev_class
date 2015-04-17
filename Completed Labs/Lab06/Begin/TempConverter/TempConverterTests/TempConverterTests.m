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
    MyConverter *converter = [[MyConverter alloc] init];
    converter.temperatureScale = C;
    converter.temperature = 100.0;
    
    XCTAssert([converter convert:F] == 212.0, @"Pass");
}

- (void)testFahrenheitToCelsius
{
    MyConverter *converter = [[MyConverter alloc] init];
    converter.temperatureScale = F;
    converter.temperature = 212.0;
    
    XCTAssert([converter convert:C] == 100.0, @"Pass");
}

- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
}

@end
