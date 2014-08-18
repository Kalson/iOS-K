//
//  RevisionTests.m
//  RevisionTests
//
//  Created by KaL on 8/7/14.
//  Copyright (c) 2014 Kalson Kalu. All rights reserved.
//

#import <XCTest/XCTest.h>

@interface RevisionTests : XCTestCase

@end

@implementation RevisionTests

- (void)setUp
{
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown
{
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testMyUnderstandingOfForLoops
{
   // 2 ways of doing loops
    
    int sum = 0; // declaring & init
    // slow loop
    for (int i = 0; i < 5; i++) {
        sum = sum + 1;
        
        NSLog(@"Sum of integers 0 through 4 (inclusive) = %d", sum);
        
        XCTAssertEqual(sum, 10, @"Testing sum of ints )..4");
    }
    
    NSLog(@"Hello");
}

@end
